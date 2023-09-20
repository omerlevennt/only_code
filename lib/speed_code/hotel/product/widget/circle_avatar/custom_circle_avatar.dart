import 'package:flutter/material.dart';
import 'package:only_code/speed_code/hotel/product/items/color_items.dart';

class CustomCircleAvatar extends StatelessWidget {
  const CustomCircleAvatar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const String imageUrl = 'https://picsum.photos/id/237/200/300';
    return const CircleAvatar(
      backgroundColor: ColorItems.paynesGreey,
      backgroundImage: NetworkImage(imageUrl),
    );
  }
}
