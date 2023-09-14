import 'package:flutter/material.dart';
import 'package:only_code/speed_code/rent/modal/rent_modal.dart';
import 'package:only_code/speed_code/rent/view/rent_view.dart';

enum StatusTabItems { home, filter, favorite, shop }

mixin RentViewMixin on State<RentView> {
  late final List<RentModel> _rentItemsDummy;
  List<RentModel> get rentItems => _rentItemsDummy;
  @override
  void initState() {
    super.initState();
    _rentItemsDummy = List.generate(
        5,
        (index) => RentModel(
            title: 'Title $index',
            subTitle: 'SubTitle $index',
            price: 1000,
            imagePath: 'https://picsum.photos/200/300'));
  }
}
