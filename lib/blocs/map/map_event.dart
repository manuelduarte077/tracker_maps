part of 'map_bloc.dart';

abstract class MapEvent extends Equatable {
  const MapEvent();

  @override
  List<Object> get props => [];
}

class OnMapInitializedEvent extends MapEvent {
  final GoogleMapController controller;

  const OnMapInitializedEvent(this.controller);
}

class OnStopMapFollowingUserEvent extends MapEvent {}

class OnStartMapFollowingUserEvent extends MapEvent {}

class UpddateUSerPolylineEvent extends MapEvent {
  final List<LatLng> userLocations;

  const UpddateUSerPolylineEvent(this.userLocations);
}

class OnToggleUserRouteDrawingEvent extends MapEvent {}
