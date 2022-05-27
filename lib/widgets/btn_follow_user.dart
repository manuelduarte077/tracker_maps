import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:maps/blocs/blocs.dart';

class BtnFollowUser extends StatelessWidget {
  const BtnFollowUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mapBloc = BlocProvider.of<MapBloc>(context);

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: ElevatedButton(
        child: BlocBuilder<MapBloc, MapState>(
          builder: (context, state) {
            return Icon(
              state.isFollowingUser
                  ? Icons.directions_run_rounded
                  : Icons.hail_rounded,
              color: Colors.black,
            );
          },
        ),
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          animationDuration: const Duration(milliseconds: 500),
        ),
        onPressed: () {
          mapBloc.add(OnStartMapFollowingUserEvent());
        },
      ),
    );
  }
}
