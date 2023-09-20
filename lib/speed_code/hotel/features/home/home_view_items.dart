part of './home_view.dart';

class _AppBar extends StatelessWidget implements PreferredSizeWidget {
  const _AppBar();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      centerTitle: false,
      backgroundColor: Colors.transparent,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      leading: const Padding(
        padding: PagePadding.pagePaddingK8,
        child: CustomCircleAvatar(),
      ),
      title: const _CustomListTile(),
      actionsIconTheme: const IconThemeData(
          color: ColorItems.paynesGreey, size: IconSize.medium),
      actions: [
        IconButton(
            onPressed: () {}, icon: const Icon(Icons.notifications_outlined))
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _CustomListTile extends StatelessWidget {
  const _CustomListTile();

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        '${LocalKeys.hello} , ${LocalKeys.userName}',
        style: Theme.of(context)
            .textTheme
            .titleLarge
            ?.copyWith(fontWeight: FontWeight.bold),
      ),
      subtitle: const Text(LocalKeys.subTitle),
    );
  }
}

class _SearchBar extends StatelessWidget {
  const _SearchBar();

  @override
  Widget build(BuildContext context) {
    return const TextField(
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.search,
      cursorColor: ColorItems.paynesGreey,
      decoration: InputDecoration(
        hintText: 'Search Hotel..',
        filled: true,
        fillColor: Color.fromARGB(255, 236, 235, 235),
        prefixIcon: Icon(Icons.search),
        prefixIconColor: ColorItems.paynesGreey,
        border: InputBorder.none,
      ),
    );
  }
}

class _FilterButton extends StatelessWidget {
  const _FilterButton();

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.filter_list_rounded,
          color: Colors.blue,
        ));
  }
}
