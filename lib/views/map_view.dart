import 'package:flutter/material.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapView extends StatelessWidget {
  final LatLng initialLocation;
  const MapView({
    Key? key,
    required this.initialLocation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CameraPosition initialCameraPosition = CameraPosition(
      target: initialLocation,
      zoom: 15,
    );

    final size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width,
      height: size.height,
      child: GoogleMap(
        initialCameraPosition: initialCameraPosition,
        myLocationEnabled: true,
        zoomControlsEnabled: false,
        zoomGesturesEnabled: true,
        myLocationButtonEnabled: false,

        // TODO: Marker
        // TODO: Polyline
        // TODO: cuando se mueve el mapa, se actualiza la posición del usuario
      ),
    );
  }
}