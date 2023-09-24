import 'package:flutter/material.dart';
import 'package:only_code/speed_code/lang_app/lang_dropdown.dart';
import 'package:only_code/speed_code/lang_app/widget/course_grid.dart';
import 'package:only_code/speed_code/lang_app/widget/today_challange_card.dart';

class LangAppView extends StatefulWidget {
  const LangAppView({super.key});

  @override
  State<LangAppView> createState() => _LangAppViewState();
}

class _LangAppViewState extends State<LangAppView> {
  static const _imageUrl = 'https://randomuser.me/api/portraits/lego/7.jpg';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const _AppBar(),
      body: ListView(
        padding: PagePadding.horizantalNormal,
        children: const [
          _Header(),
          _WelcomeBackCard(),
          TodayChallange(),
          _YourCoursesCard(),
          CourseGrid(),
        ],
      ),
    );
  }
}

class _YourCoursesCard extends StatelessWidget {
  const _YourCoursesCard();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PagePadding.verticalNormal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Your Courses',
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          TextButton(
              onPressed: () {},
              child: const Text(
                'View All',
                style: TextStyle(color: _AppColor.primary),
              ))
        ],
      ),
    );
  }
}

@immutable
final class _AppColor {
  const _AppColor._();
  static const Color primary = Colors.green;
}

@immutable
final class PagePadding {
  const PagePadding._();

  static const EdgeInsets allNormal = EdgeInsets.all(16.0);
  static const EdgeInsets horizantalNormal =
      EdgeInsets.symmetric(horizontal: 16.0);
  static const EdgeInsets verticalNormal = EdgeInsets.symmetric(vertical: 16.0);
  static const EdgeInsets verticalLow = EdgeInsets.symmetric(vertical: 8.0);
  static const EdgeInsets topLow = EdgeInsets.only(top: 8.0);
  static const EdgeInsets leftLow = EdgeInsets.only(left: 8.0);
}

class _WelcomeBackCard extends StatelessWidget {
  const _WelcomeBackCard();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PagePadding.verticalNormal,
      child: Text(
        'Welcome back !',
        style: Theme.of(context)
            .textTheme
            .bodyLarge
            ?.copyWith(fontSize: 30, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(
        backgroundImage: NetworkImage(_LangAppViewState._imageUrl),
      ),
      title: Text(
        'Alias Jorden',
        style: Theme.of(context).textTheme.titleLarge,
      ),
      subtitle: const Padding(
        padding: PagePadding.topLow,
        child: Row(
          children: [
            Icon(
              Icons.place,
              color: Colors.red,
            ),
            SizedBox(width: 5),
            Text('United kingdom'),
          ],
        ),
      ),
    );
  }
}

class _AppBar extends StatelessWidget implements PreferredSizeWidget {
  const _AppBar();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      iconTheme: const IconThemeData(color: Colors.black),
      leading: const Icon(Icons.menu_outlined),
      actions: const [LangDropDown()],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
