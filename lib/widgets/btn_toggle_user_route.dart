import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:maps/blocs/blocs.dart';

class BtnToggleUserRoute extends StatelessWidget {
  const BtnToggleUserRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mapBloc = BlocProvider.of<MapBloc>(context);

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          animationDuration: const Duration(milliseconds: 500),
        ),
        onPressed: () {
          mapBloc.add(OnToggleUserRouteDrawingEvent());
        },
        child: const Icon(
          Icons.more_horiz_rounded,
          color: Colors.black,
        ),
      ),
    );
  }
}
