import 'package:flutter/material.dart';
import 'package:only_code/speed_code/ice_cream/constants/ice_cream_constants.dart';
import 'package:only_code/speed_code/ice_cream/widget/ice_app_bar.dart';
import 'package:only_code/speed_code/ice_cream/widget/ice_card.dart';

class IceCreamView extends StatefulWidget {
  const IceCreamView({super.key});

  @override
  State<IceCreamView> createState() => _IceCreamViewState();
}

extension on BuildContext {
  Size get sizeOf => MediaQuery.sizeOf(this);
}

class _IceCreamViewState extends State<IceCreamView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const IceAppBar(),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('What would you like to eat?'),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      TextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey[50],
                          border: const OutlineInputBorder(
                              borderSide: BorderSide.none),
                          hintText: 'Search',
                          suffixIcon: const Icon(Icons.search),
                        ),
                      ),
                      IconButton(onPressed: () {}, icon: const Icon(Icons.abc)),
                    ],
                  ),
                ),
                const _PageBody(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _PageBody extends StatelessWidget {
  const _PageBody();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: context.sizeOf.height * 0.5,
        child: ListView.builder(
          itemCount: 5,
          controller: PageController(viewportFraction: 0.8),
          physics: const ClampingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return SizedBox(
                width: context.sizeOf.width * 0.75,
                height: context.sizeOf.height * 0.5,
                child: const Padding(
                  padding: IceCreamConstants.paddingAll,
                  child: IceCard(),
                ));
          },
        ));
  }
}
