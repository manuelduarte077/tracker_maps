import 'package:google_maps_flutter/google_maps_flutter.dart' show LatLng;
import 'package:maps/models/places_response.dart';

class RouteDestination {
  final List<LatLng> points;
  final double duration;
  final double distance;
  final Feature endPlaces;

  RouteDestination({
    required this.points,
    required this.duration,
    required this.distance,
    required this.endPlaces,
  });
}
