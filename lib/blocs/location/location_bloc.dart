import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' show LatLng;

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  StreamSubscription<Position>? positionStream;

  LocationBloc() : super(const LocationState()) {
    on<OnStartFollowingUserEvent>(
      ((event, emit) => emit(state.copyWith(followingUser: true))),
    );
    on<OnStopFollowingUserEvent>(
      ((event, emit) => emit(state.copyWith(followingUser: false))),
    );

    on<OnNewUserLocationEvent>((event, emit) {
      emit(state.copyWith(
        lastKnownLocation: event.newLocation,
        myLocationHistory: [...state.myLocationHistory, event.newLocation],
      ));
    });
  }

  Future getCurrentLocation() async {
    final position = await Geolocator.getCurrentPosition();
    add(
      OnNewUserLocationEvent(LatLng(position.latitude, position.longitude)),
    );
  }

  void startFollowingUser() {
    add(OnStartFollowingUserEvent());

    positionStream = Geolocator.getPositionStream().listen((event) {
      final position = event;
      add(
        OnNewUserLocationEvent(LatLng(position.latitude, position.longitude)),
      );
    });
  }

  void stopFollowingUser() {
    positionStream?.cancel();

    add(OnStopFollowingUserEvent());
  }

  @override
  Future<void> close() {
    stopFollowingUser();
    return super.close();
  }
}
