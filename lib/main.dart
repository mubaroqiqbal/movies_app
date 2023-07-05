import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movies_app/constants/setup_locator.dart';
import 'package:movies_app/ui/movies_app.dart';

void main() async {
  await setupLocator();

  return runZonedGuarded(() {
    runApp(const MoviesApp());
  }, (error, stackTrace) {
    print(error);
    print(stackTrace);
  });
}
