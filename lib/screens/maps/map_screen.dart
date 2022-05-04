import 'package:flutter/material.dart';
import 'package:maps/blocs/blocs.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  void initState() {
    super.initState();

    final locationBloc = BlocProvider.of<LocationBloc>(context);

    // locationBloc.getCurrentLocation();
    locationBloc.startFollowingUser();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Map Screen'),
      ),
    );
  }
}
