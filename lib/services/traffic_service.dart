import 'package:dio/dio.dart';
import 'package:maps/models/models.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' show LatLng;

import 'package:maps/services/services.dart';

class TrafficService {
  final Dio _dioTraffic;
  final Dio _dioPlaces;

  final String _baseTrafficUrl = 'https://api.mapbox.com/directions/v5/mapbox';
  final String _baseTrafficUrlPlaces =
      'https://api.mapbox.com/geocoding/v5/mapbox.places';

  TrafficService()
      : _dioTraffic = Dio()..interceptors.add(TrafficInterceptor()),
        _dioPlaces = Dio()..interceptors.add(PlacesInterceptor());

  Future<TrafficResponse> getCoorsStartToEnd(LatLng start, LatLng end) async {
    // Interceptores
    final coorsString =
        '${start.longitude}, ${start.latitude}; ${end.longitude}, ${end.latitude}';
    final url = '$_baseTrafficUrl/driving/$coorsString';

    final resp = await _dioTraffic.get(url);

    final data = TrafficResponse.fromMap(resp.data);

    return data;
  }

  Future<List<Feature>> getResultsByQuery(
      LatLng proximity, String query) async {
    if (query.isEmpty) return [];
    final url = '$_baseTrafficUrlPlaces/$query.json';

    final resp = await _dioPlaces.get(url, queryParameters: {
      'proximity': '${proximity.longitude},${proximity.latitude}',
      'limit': '7',
    });

    final placesResponse = PlacesResponse.fromJson(resp.data);

    return placesResponse.features;
  }

  // Traer la informacion de los places
  Future<Feature> getInfoPlaces(LatLng coors) async {
    final url =
        '$_baseTrafficUrlPlaces/${coors.longitude}, ${coors.latitude}.json';

    final resp = await _dioPlaces.get(url, queryParameters: {
      'limit': '1',
    });

    final placesResponse = PlacesResponse.fromJson(resp.data);

    return placesResponse.features.first;
  }

  // Traer el datale de los marcadores
  Future<Feature> getInfoMarker(LatLng coors) async {
    final url =
        '$_baseTrafficUrlPlaces/${coors.longitude}, ${coors.latitude}.json';

    final resp = await _dioPlaces.get(url, queryParameters: {
      'limit': '1',
    });

    final placesResponse = PlacesResponse.fromJson(resp.data);

    return placesResponse.features.first;
  }
}
