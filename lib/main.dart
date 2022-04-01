import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:maps/app/app.dart';

import 'blocs/blocs.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<GpsBloc>(
          create: (context) => GpsBloc(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}
