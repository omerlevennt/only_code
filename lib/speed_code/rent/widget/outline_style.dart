import 'package:flutter/material.dart';
import 'package:only_code/speed_code/rent/utility/project_color.dart';

mixin OutlineStyle {
  static final circleStyle = OutlinedButton.styleFrom(
      elevation: 0,
      backgroundColor: Colors.transparent,
      shape: const CircleBorder(
          side: BorderSide(color: ProjectColor.black12, width: 2)));
}
