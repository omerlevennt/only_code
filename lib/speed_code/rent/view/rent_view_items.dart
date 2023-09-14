part of './rent_view.dart';

class _BottomBar extends StatelessWidget {
  const _BottomBar();

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: TabBar(
        indicatorColor: Colors.transparent,
        labelColor: ProjectColor.black,
        unselectedLabelColor: ProjectColor.black26,
        tabs: [
          Tab(
            icon: Icon(Icons.home),
          ),
          Tab(
            icon: Icon(Icons.filter),
          ),
          Tab(
            icon: Icon(Icons.favorite),
          ),
          Tab(
            icon: Icon(Icons.shop_outlined),
          ),
        ],
      ),
    );
  }
}

class _AppBar extends StatelessWidget
    with OutlineStyle
    implements PreferredSizeWidget {
  _AppBar();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: false,
      elevation: 0,
      backgroundColor: Colors.transparent,
      foregroundColor: ProjectColor.black,
      automaticallyImplyLeading: false,
      titleSpacing: 0,
      title: Padding(
        padding: ProjectPadding.paddingOnlyLeft,
        child: const _SearchField(),
      ),
      actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.menu))],
      leading: ElevatedButton(
          style: OutlineStyle.circleStyle,
          onPressed: () {},
          child: const Icon(
            Icons.chevron_left_outlined,
            color: ProjectColor.black,
          )),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _SearchField extends StatelessWidget {
  const _SearchField();

  @override
  Widget build(BuildContext context) {
    return TextField(
      onTap: () {
        showSearch<bool>(context: context, delegate: SearchDelegateCustom());
      },
      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.search),
          hintText: 'Search',
          contentPadding: EdgeInsets.zero,
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: ProjectColor.black, width: 1),
            borderRadius: ProjectRadius.borderRadiusCircularAllNormal,
          )),
    );
  }
}

class _CustomDriver extends StatelessWidget {
  const _CustomDriver();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: ProjectPadding.paddingVerticalNormal,
      child: const Divider(
        height: 2,
        thickness: 2,
      ),
    );
  }
}

class SearchDelegateCustom extends SearchDelegate<bool> {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            close(context, false);
          },
          icon: const Icon(Icons.close))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return null;
  }

  @override
  Widget buildResults(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return const Text('dummy');
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return const Text('dummy');
      },
    );
  }
}
