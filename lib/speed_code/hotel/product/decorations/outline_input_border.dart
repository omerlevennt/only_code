import 'package:flutter/material.dart';
import 'package:only_code/speed_code/hotel/product/items/color_items.dart';

class OutlineInputBorder extends StatelessWidget {
  const OutlineInputBorder(
      {super.key,
      required BorderSide borderSide,
      required BorderRadius borderRadius});

  @override
  Widget build(BuildContext context) {
    return OutlineInputBorder(
        borderSide: BorderSide(color: ColorItems.paynesGreey),
        borderRadius: BorderRadius.all(Radius.circular(16)));
  }
}
