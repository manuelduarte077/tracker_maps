import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:loading_progress_indicator/loading_progress_indicator.dart';
import 'package:loading_progress_indicator/progress_indicator/ball_scale_multiple_progress_indicator.dart';

const text = 'Please wait';

void showLoadingMessage(BuildContext context) {
  // Android
  if (Platform.isAndroid) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text(text),
        content: Container(
          width: 100,
          height: 100,
          margin: const EdgeInsets.only(top: 10),
          child: Column(
            children: [
              const Text('Calculating route'),
              const SizedBox(height: 15),
              LoadingProgressIndicator(
                indicator: BallScaleMultipleProgressIndicator(),
                size: 50,
                color: Colors.indigoAccent,
              ),
              // CircularProgressIndicator(
              //   strokeWidth: 3,
              //   color: Colors.black,
              // )
            ],
          ),
        ),
      ),
    );
    return;
  }

  showCupertinoDialog(
    context: context,
    builder: (context) => const CupertinoAlertDialog(
      title: Text(text),
      content: CupertinoActivityIndicator(),
    ),
  );
}
