import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:maps/blocs/blocs.dart';
import 'package:maps/ui/ui.dart';

class BtnCurrentLocation extends StatelessWidget {
  const BtnCurrentLocation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final locationBloc = BlocProvider.of<LocationBloc>(context);
    final mapBloc = BlocProvider.of<MapBloc>(context);

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: FloatingActionButton(
        backgroundColor: Colors.white,
        child: const Icon(
          Icons.my_location_rounded,
          color: Colors.black,
        ),
        onPressed: () {
          final userLocation = locationBloc.state.lastKnownLocation;

          if (userLocation == null) {
            final snack =
                CustomSnackbar(message: 'No hay ubicación', btnLabel: 'OK');
            ScaffoldMessenger.of(context).showSnackBar(snack);
            return;
          }
          mapBloc.moveCamera(userLocation);
        },
      ),
    );
  }
}
