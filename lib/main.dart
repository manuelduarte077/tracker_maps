import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:maps/app/app.dart';
import 'package:maps/blocs/blocs.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<GpsBloc>(create: (context) => GpsBloc()),
        BlocProvider<LocationBloc>(create: (context) => LocationBloc()),
        BlocProvider<MapBloc>(
          create: (context) =>
              MapBloc(locationBloc: BlocProvider.of<LocationBloc>(context)),
        ),
      ],
      child: const MyApp(),
    ),
  );
}
