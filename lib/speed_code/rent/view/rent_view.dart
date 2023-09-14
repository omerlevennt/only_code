import 'package:flutter/material.dart';
import 'package:only_code/speed_code/rent/utility/project_color.dart';
import 'package:only_code/speed_code/rent/utility/project_padding.dart';
import 'package:only_code/speed_code/rent/utility/project_radius.dart';
import 'package:only_code/speed_code/rent/view/rent_view_mixin.dart';
import 'package:only_code/speed_code/rent/widget/outline_style.dart';
import 'package:only_code/speed_code/rent/widget/rent_card.dart';
part 'rent_view_items.dart';

class RentView extends StatefulWidget {
  const RentView({super.key});

  @override
  State<RentView> createState() => _RentViewState();
}

class _RentViewState extends State<RentView> with RentViewMixin {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: StatusTabItems.values.length,
      child: Scaffold(
        appBar: _AppBar(),
        bottomNavigationBar: const _BottomBar(),
        body: ListView.separated(
          padding: ProjectPadding.paddingVerticalNormal +
              ProjectPadding.paddingHorizontalNormal,
          separatorBuilder: (context, index) => const _CustomDriver(),
          itemCount: rentItems.length,
          itemBuilder: (context, index) {
            return SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.1,
                child: RentCard(model: rentItems[index]));
          },
        ),
      ),
    );
  }
}
