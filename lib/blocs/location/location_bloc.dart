import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  StreamSubscription<Position>? positionStream;

  LocationBloc() : super(const LocationState()) {
    on<LocationEvent>((event, emit) {});
  }

  Future getCurrentLocation() async {
    final position = await Geolocator.getCurrentPosition();
    print('Position: $position');
    // TODDO: retornar unj objeto de tipo LatLng
  }

  void startFollowingUser() {
    print('startFollowingUser');
    positionStream = Geolocator.getPositionStream().listen((event) {
      final position = event;
      print('Position: $position');
    });
  }

  void stopFollowingUser() {
    positionStream?.cancel();
    print('Position stream cancelled');
  }

  @override
  Future<void> close() {
    stopFollowingUser();
    return super.close();
  }
}
