import 'package:flutter/material.dart';
import 'package:maps/screens/screens.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: const LoadingScreen(),
    );
  }
}

class SplasScreenApp extends StatelessWidget {
  const SplasScreenApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SplashScreenView(
      navigateRoute: const LoadingScreen(),
      duration: 5000,
      imageSize: 130,
      imageSrc: 'assets/icon/logo_app.png',
      text: 'Splash Screen',
      textType: TextType.ColorizeAnimationText,
      textStyle: const TextStyle(
        fontSize: 40.0,
      ),
      colors: const [
        Colors.purple,
        Colors.blue,
        Colors.yellow,
        Colors.red,
      ],
      backgroundColor: Colors.white,
    );
  }
}
