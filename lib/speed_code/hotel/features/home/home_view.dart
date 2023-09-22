import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:only_code/speed_code/hotel/product/widget/nav_bar/my_nav_bar.dart';
import '../../product/init/local_keys.dart';
import '../../product/items/color_items.dart';
import '../../product/utility/padding/page_padding.dart';
import '../../product/utility/size/icon_size.dart';
import '../../product/utility/size/widget_size.dart';
import '../../product/widget/button/my_button.dart';
import '../../product/widget/circle_avatar/custom_circle_avatar.dart';

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
      bottomNavigationBar: const MyNavBar(),
      appBar: const _AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: PagePadding.pagePaddingK16.horizontal),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 24,
              ),
              const _Header(),
              const SizedBox(
                height: 24,
              ),
              SizedBox(
                height: WidgetSizes.spacingXxl7,
                child: _ButtonListViewBuilder(buttonText: buttonText),
              ),
              const SizedBox(
                height: 24,
              ),
              const _CardTile(text: LocalKeys.popular),
              const SizedBox(
                height: 24,
              ),
              const SizedBox(
                height: WidgetSizes.spacingXxlL13,
                child: _CardItems(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
