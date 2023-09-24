import 'package:flutter/material.dart';
import 'package:only_code/speed_code/lang_app/custom_decaration.dart';

import '../lang_app_view.dart';

final class TodayItemsCard {
  final String title;
  final String description;
  final String hint;

  const TodayItemsCard(
      {required this.title, required this.description, required this.hint});

  static const TodayItemsCard example = TodayItemsCard(
      title: "Todey's Challenge",
      description: 'Take this lesson to earn new milestones',
      hint: 'Tap to Start');
}

class TodayChallange extends StatelessWidget {
  const TodayChallange({super.key, this.item = TodayItemsCard.example});
  final TodayItemsCard item;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const CustomDecoration(),
      child: Padding(
        padding: PagePadding.allNormal,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Opacity(
              opacity: 0.6,
              child: Chip(
                label: Text(
                  'Intermediate',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                backgroundColor: Colors.red.withOpacity(0.3),
              ),
            ),
            Padding(
              padding: PagePadding.verticalLow,
              child: Text(
                item.title,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              children: [
                const Icon(
                  Icons.money_outlined,
                  color: Colors.yellow,
                ),
                Expanded(
                  child: Padding(
                    padding: PagePadding.leftLow,
                    child: Text(
                      item.description,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: Colors.white,
                          ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: PagePadding.verticalLow,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.white),
                  onPressed: () {},
                  child: Text(item.hint)),
            )
          ],
        ),
      ),
    );
  }
}
