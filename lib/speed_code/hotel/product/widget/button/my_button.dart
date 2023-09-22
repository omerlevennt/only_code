import 'package:flutter/material.dart';
import 'package:only_code/speed_code/hotel/product/items/color_items.dart';

class MyButton extends StatefulWidget {
  const MyButton({super.key, required this.text});
  final String text;

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  bool isSelected = false; // Düğme başlangıçta seçili değil

  void toggleSelection() {
    setState(() {
      isSelected = !isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        toggleSelection();
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          isSelected
              ? ColorItems.paynesBlue
              : ColorItems.paynesGreey.withOpacity(0.01),
        ),
      ),
      child: Text(
        widget.text,
        style: TextStyle(
          fontSize: 16,
          color: isSelected ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}
