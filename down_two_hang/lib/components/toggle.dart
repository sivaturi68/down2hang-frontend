import 'package:flutter/material.dart';
import '../color_palette.dart';

class SwitchButton extends StatelessWidget {
  final bool value;
  final void Function(bool)? onChanged;

  const SwitchButton({Key? key, required this.value, required this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 2,
      child: Switch.adaptive(
        activeColor: colors[0],
        activeTrackColor: Colors.white70,
        inactiveThumbColor: colors[2],
        inactiveTrackColor: Colors.white70,
        value: value,
        onChanged: onChanged,
      ),
    );
  }
}
