import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

void loadingBox({required BuildContext context}) {
  showDialog(
    context: context,
    barrierDismissible: false,
    barrierColor: Colors.transparent,
    builder: (context) {
      return Center(
        child: Lottie.asset(
          "assets/lottie/Simple Loading.json",
          width: 140,
          height: 140,
        ),
      );
    },
  );
}

void hideLoader(BuildContext context) {
  Navigator.of(context).pop();
}
