import 'package:flutter/material.dart';

class IceAppBar extends StatelessWidget implements PreferredSizeWidget {
  const IceAppBar({super.key});
  final String _userImageUrl =
      'https://randomuser.me/api/portraits/women/66.jpg';
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        children: [
          _Avatar(
            url: _userImageUrl,
          ),
          _Title()
        ],
      ),
      iconTheme: const IconThemeData(color: Colors.black),
      actions: [
        _Menu(
          onPressed: () {},
        )
      ],
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _Menu extends StatelessWidget {
  final VoidCallback onPressed;

  const _Menu({required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: onPressed, icon: const Icon(Icons.menu_outlined));
  }
}

class _Title extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      'Hi , Train',
      style: Theme.of(context)
          .textTheme
          .headlineSmall
          ?.copyWith(fontWeight: FontWeight.w700),
    );
  }
}

class _Avatar extends StatelessWidget {
  final String url;

  const _Avatar({required this.url});
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundImage: NetworkImage(url),
    );
  }
}
