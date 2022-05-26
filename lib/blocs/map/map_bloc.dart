import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:maps/blocs/blocs.dart';
import 'package:maps/models/models.dart';
import 'package:maps/themes/theme.dart';

part 'map_event.dart';
part 'map_state.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  final LocationBloc locationBloc;
  GoogleMapController? _mapController;
  LatLng? mapCenter;

  StreamSubscription<LocationState>? locationStateSubscription;

  MapBloc({
    required this.locationBloc,
  }) : super(const MapState()) {
    on<OnMapInitializedEvent>(_onInitMap);

    on<OnStartMapFollowingUserEvent>(_onStartMapFollowingUser);

    on<OnStopMapFollowingUserEvent>(
        ((event, emit) => emit(state.copyWith(isFollowingUser: false))));

    on<UpddateUSerPolylineEvent>(_onPolylineNewPoint);
    on<DisplayPolylinesEvent>(
      (event, emit) => emit(state.copyWith(
        polylines: event.polylines,
        markers: event.markers,
        circles: event.circles,
      )),
    );

    on<OnToggleUserRouteDrawingEvent>(
      (event, emit) =>
          emit(state.copyWith(isShowRouteDrawing: !state.isShowRouteDrawing)),
    );

    locationStateSubscription = locationBloc.stream.listen((locationState) {
      if (locationState.lastKnownLocation != null) {
        add(UpddateUSerPolylineEvent(locationState.myLocationHistory));
      }

      if (!state.isFollowingUser) return;
      if (locationState.lastKnownLocation == null) return;

      moveCamera(locationState.lastKnownLocation!);
    });
  }

  void _onInitMap(OnMapInitializedEvent event, Emitter<MapState> emit) {
    _mapController = event.controller;
    _mapController!.setMapStyle(jsonEncode(uberMapTheme));

    emit(state.copyWith(isMapInitialized: true));
  }

  void _onStartMapFollowingUser(
      OnStartMapFollowingUserEvent event, Emitter<MapState> emit) {
    emit(state.copyWith(isFollowingUser: true));

    if (locationBloc.state.lastKnownLocation == null) return;
    moveCamera(locationBloc.state.lastKnownLocation!);
  }

  void _onPolylineNewPoint(
      UpddateUSerPolylineEvent event, Emitter<MapState> emit) {
    final myRoute = Polyline(
      polylineId: const PolylineId('myRoute'),
      color: Colors.indigoAccent,
      width: 5,
      startCap: Cap.roundCap,
      endCap: Cap.roundCap,
      points: event.userLocations,
    );

    final currentPolylines = Map<String, Polyline>.from(state.polylines);
    currentPolylines['myRoute'] = myRoute;

    emit(state.copyWith(polylines: currentPolylines));
  }

  Future drawRoutePoliyline(RouteDestination destination) async {
    final myRoute = Polyline(
      polylineId: const PolylineId('route'),
      color: Colors.indigoAccent,
      width: 5,
      startCap: Cap.roundCap,
      endCap: Cap.roundCap,
      points: destination.points,
    );

    // Markers
    final startMarker = Marker(
      markerId: const MarkerId('start'),
      position: destination.points.first,
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
      infoWindow: InfoWindow(
        title: 'Start',
        snippet: '${destination.points.first}',
      ),
    );

    final endMarker = Marker(
      markerId: const MarkerId('end'),
      position: destination.points.last,
      icon: BitmapDescriptor.defaultMarker,
      infoWindow: InfoWindow(
        title: 'Start',
        snippet: '${destination.points.last}',
      ),
      draggable: true,
      onTap: () {},
    );

    // Circles
    // final startCircle = Circle(
    //   circleId: const CircleId('start'),
    //   center: destination.points.first,
    //   radius: 10,
    //   strokeColor: Colors.indigoAccent,
    //   strokeWidth: 5,
    //   fillColor: Colors.transparent,
    // );

    final endCircle = Circle(
      circleId: const CircleId('end'),
      center: destination.points.last,
      radius: 10,
      // strokeColor: Colors.purpleAccent,
      // fillColor: Colors.transparent,
      fillColor: const Color.fromRGBO(171, 39, 133, 0.1),
      strokeColor: const Color.fromRGBO(171, 39, 133, 0.5),
    );

    final currentCircles = Map<String, Circle>.from(state.circles);
    currentCircles['start'] = endCircle;

    final currentPolylines = Map<String, Polyline>.from(state.polylines);
    currentPolylines['route'] = myRoute;

    final currentMarkers = Map<String, Marker>.from(state.markers);
    currentMarkers['start '] = startMarker;

    currentMarkers['end'] = endMarker;

    add(DisplayPolylinesEvent(
      currentPolylines,
      currentMarkers,
      currentCircles,
    ));

    await Future.delayed(const Duration(milliseconds: 300));
    _mapController?.showMarkerInfoWindow(const MarkerId('start'));
  }

  void moveCamera(LatLng newLocation) {
    final cameraUpdate = CameraUpdate.newLatLng(newLocation);
    _mapController?.animateCamera(cameraUpdate);
  }

  @override
  Future<void> close() {
    locationStateSubscription?.cancel();
    return super.close();
  }
}
