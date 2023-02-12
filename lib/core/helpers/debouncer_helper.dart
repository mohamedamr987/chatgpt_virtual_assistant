import 'dart:async';

import 'package:flutter/material.dart';

class DebouncerHelper {
  final int milliseconds = 500;
  Timer? _timer;

  DebouncerHelper();

  run(VoidCallback action) {
    _timer?.cancel();
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}