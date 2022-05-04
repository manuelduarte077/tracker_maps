part of 'location_bloc.dart';

abstract class LocationEvent extends Equatable {
  const LocationEvent();

  @override
  List<Object> get props => [];
}

// Evento para recibir la nueva ubicación del usuario
class OnNewUserLocationEvent extends LocationEvent {
  final LatLng newLocation;

  const OnNewUserLocationEvent(this.newLocation);
}

class OnStartFollowingUserEvent extends LocationEvent {}

class OnStopFollowingUserEvent extends LocationEvent {}
