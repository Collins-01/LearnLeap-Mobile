import 'package:flutter/material.dart';

extension ValueNotifierExtension<T> on T {
  ValueNotifier<T> get obs => ValueNotifier<T>(this);
}
