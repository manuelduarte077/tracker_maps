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

// Para hacer algo despues de tocar el circulo
class OnCircleTappedEvent extends MapEvent {
  final Circle circleId;

  const OnCircleTappedEvent(this.circleId);
}

class UpddateUSerPolylineEvent extends MapEvent {
  final List<LatLng> userLocations;

  const UpddateUSerPolylineEvent(this.userLocations);
}

class OnToggleUserRouteDrawingEvent extends MapEvent {}

class DisplayPolylinesEvent extends MapEvent {
  final Map<String, Polyline> polylines;
  final Map<String, Marker> markers;
  final Map<String, Circle> circles;
  const DisplayPolylinesEvent(
    this.polylines,
    this.markers,
    this.circles,
  );
}
