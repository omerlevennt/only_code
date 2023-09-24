import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class LangDropDown extends StatefulWidget {
  const LangDropDown({super.key});

  @override
  State<LangDropDown> createState() => _LangDropDownState();
}

class _LangDropDownState extends State<LangDropDown> {
  final ValueNotifier<LangAppItems?> _itemNotifier = ValueNotifier(null);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _itemNotifier,
      builder: (context, value, child) {
        return DropdownButton<LangAppItems>(
          value: _itemNotifier.value,
          items: LangAppItems.sanples.map((e) {
            return DropdownMenuItem(
              value: e,
              child: _DropDownCardItems(e),
            );
          }).toList(),
          onChanged: (value) {
            _itemNotifier.value = value;
          },
        );
      },
    );
  }
}

class _DropDownCardItems extends StatelessWidget {
  const _DropDownCardItems(this.item);
  final LangAppItems item;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Icon(item.icon),
          const SizedBox(
            width: 10,
          ),
          Text(item.title)
        ],
      ),
    );
  }
}

final class LangAppItems extends Equatable {
  final IconData icon;
  final String title;

  const LangAppItems({required this.icon, required this.title});

  static final List<LangAppItems> sanples = [
    const LangAppItems(icon: Icons.filter_vintage_sharp, title: 'Franch'),
    const LangAppItems(icon: Icons.face, title: 'Turkish'),
  ];

  @override
  List<Object> get props => [icon, title];
}
