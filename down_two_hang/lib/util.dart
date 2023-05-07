import 'package:flutter/material.dart';

/* Takes a color and makes a MaterialColor out of it (color swatch) */
MaterialColor createMaterialColor(Color baseColor) {
  final strengths = <double>[
    .05, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9
  ];

  var swatch = <int, Color>{};

  int
    r = baseColor.red,
    g = baseColor.green,
    b = baseColor.blue;

  for (var s in strengths) {
    var ds = 0.5 - s;
    swatch[(s * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1
    );
  }

  final ret = MaterialColor(baseColor.value, swatch);
  return ret;
}
