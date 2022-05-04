import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  LocationBloc() : super(const LocationState()) {
    on<LocationEvent>((event, emit) {});
  }

  Future getCurrentLocation() async {
    final position = await Geolocator.getCurrentPosition();
    print('Position: $position');
    // TODDO: retornar unj objeto de tipo LatLng
  }

  void startFollowingUser() {
    Geolocator.getPositionStream().listen((event) {
      final position = event;
      print('Position: $position');
    });
  }
}
