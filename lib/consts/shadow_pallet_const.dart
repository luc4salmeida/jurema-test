import 'package:flutter/material.dart';

abstract class ShadowPallet {
  static List<BoxShadow> get defaultShadow => [
        BoxShadow(
            offset: Offset(0.0, 3.0),
            blurRadius: 5.0,
            spreadRadius: -1.0,
            color: Colors.grey),
        BoxShadow(
            offset: Offset(0.0, 6.0),
            blurRadius: 10.0,
            spreadRadius: 0.0,
            color: Colors.grey.shade100),
        BoxShadow(
            offset: Offset(0.0, 1.0),
            blurRadius: 18.0,
            spreadRadius: 0.0,
            color: Colors.grey.shade100),
      ];
}
