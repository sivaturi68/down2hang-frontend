import 'package:flutter/material.dart';

/* potential main color palette of app in hex */
const hexColors = <int>[
  0xff360568, /* Persian Indigo */
  0xff7f3bba, /* Grape */
  0xff7785ac, /* Glaucous */
  0xff9ac6c5, /* Light Blue */
  0xffa5e6ba, /* Celadon */
];

/* create colors from hex codes */
final colors = hexColors.map((hex) => Color(hex)).toList();
