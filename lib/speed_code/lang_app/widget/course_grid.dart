import 'package:flutter/material.dart';
import '../lang_app_view.dart';

class CourseGrid extends StatelessWidget {
  const CourseGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      physics: const ClampingScrollPhysics(),
      shrinkWrap: true,
      crossAxisCount: 2,
      children: GridItems.exaples.map((e) => _GridCard(e)).toList(),
    );
  }
}

class _GridCard extends StatelessWidget {
  const _GridCard(this.item);
  final GridItems item;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      color: item.color.withOpacity(0.3),
      elevation: 0,
      child: Padding(
        padding: PagePadding.allNormal,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(flex: 2),
              Icon(
                item.icon,
                color: item.color,
              ),
              const Spacer(),
              Text(
                item.title,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const Spacer(),
              Text(item.subTitle),
              const Spacer(),
              LinearProgressIndicator(
                value: item.progress,
                color: item.color,
              ),
              const Spacer(flex: 2),
            ]),
      ),
    );
  }
}

class GridItems {
  final IconData icon;
  final String title;
  final String subTitle;
  final double progress;
  final Color color;

  GridItems(
      {required this.icon,
      required this.title,
      required this.subTitle,
      required this.progress,
      required this.color});

  static final List<GridItems> exaples = [
    GridItems(
        icon: Icons.book_outlined,
        title: 'Reading',
        subTitle: 'Your Progress 41%',
        progress: 0.41,
        color: Colors.purpleAccent),
    GridItems(
        icon: Icons.book_outlined,
        title: 'Reading',
        subTitle: 'Your Progress 14%',
        progress: 0.14,
        color: Colors.pink),
    GridItems(
        icon: Icons.book_outlined,
        title: 'Reading',
        subTitle: 'Your Progress 56%',
        progress: 0.56,
        color: Colors.yellow),
    GridItems(
        icon: Icons.book_outlined,
        title: 'Reading',
        subTitle: 'Your Progress 89%',
        progress: 0.89,
        color: Colors.blue),
  ];
}
