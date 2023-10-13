import 'package:flutter/material.dart';

@immutable
final class IceCreamConstants {
  const IceCreamConstants._();
  static const EdgeInsets paddingAll = EdgeInsets.all(16);
  static const EdgeInsets paddingAllLow = EdgeInsets.all(16);
  static const EdgeInsets paddingLeftLow = EdgeInsets.only(left: 8.0);

  static const String cardTitle = 'Yogurt Land';
  static const String toCard = 'To Card';
  static const String inStock = 'In Stock';
  static const double price = 8.5;

  static const Color favoriteColor = Colors.red;

  static String cardImage = 'https://picsum.photos/200/300';
}
