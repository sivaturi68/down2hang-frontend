import 'package:flutter/material.dart';

import 'color_palette.dart';
import 'util.dart';

class AppTheme {
  static MaterialColor materialColor = createMaterialColor(colors[1]);

  static ThemeData appTheme() => ThemeData(
    fontFamily: 'Segoe UI',
    primarySwatch: materialColor,
  );
}
