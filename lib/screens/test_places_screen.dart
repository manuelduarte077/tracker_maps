import 'package:flutter/material.dart';
import 'package:maps/models/models.dart';

class TestPlacesScreen extends StatelessWidget {
  final String text;
  final String placeName;
  final Properties? properties;

  const TestPlacesScreen({
    Key? key,
    required this.text,
    required this.placeName,
    required this.properties,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width,
      height: size.height,
      child: Stack(
        children: [
          Positioned(
            bottom: 150,
            child: Card(
              child: Column(
                children: [
                  Text(text),
                  Text(placeName),
                  if (properties != null)
                    Text(
                      properties!.address ?? ' ',
                      style: const TextStyle(fontSize: 20),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
