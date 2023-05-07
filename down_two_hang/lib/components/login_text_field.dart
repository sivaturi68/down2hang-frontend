import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vector_graphics/vector_graphics.dart';

import 'package:down_two_hang/app_theme.dart';
import 'package:down_two_hang/color_palette.dart';

class LoginTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final bool isPassword;

  const LoginTextField({
    super.key,
    required this.controller, // object responsible for getting the text from input
    required this.labelText, // the label of the input before typing in it
    required this.isPassword, // whether the characters should be obscured or not
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: TextField(
        controller: controller,
        autocorrect: false,
        obscureText: isPassword,
        obscuringCharacter: '●',
        style: const TextStyle(
          color: Colors.white,
          fontSize: 25
        ),
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: colors[3]),
          ),
          fillColor: colors[0],
          filled: true,
          labelText: labelText,
          labelStyle: TextStyle(
            // color: Colors.deepPurple.shade900
            color: colors[3]
          ),
          floatingLabelStyle: TextStyle(
            backgroundColor: Colors.transparent,
            color: colors[3],
          ),
        ),
      ),
    );
  }
}
