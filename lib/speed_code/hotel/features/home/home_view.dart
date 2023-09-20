import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:only_code/speed_code/hotel/product/init/local_keys.dart';
import 'package:only_code/speed_code/hotel/product/items/color_items.dart';
import 'package:only_code/speed_code/hotel/product/utility/padding/page_padding.dart';
import 'package:only_code/speed_code/hotel/product/utility/size/icon_size.dart';
import 'package:only_code/speed_code/hotel/product/widget/circle_avatar/custom_circle_avatar.dart';
part 'home_view_items.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const _AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: PagePadding.pagePaddingK16.horizontal),
        child: Column(
          children: [
            const SizedBox(
              height: 24,
            ),
            Row(
              children: [
                const Expanded(
                  child: _SearchBar(),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(left: PagePadding.pagePaddingK16.left),
                  child: const _FilterButton(),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
