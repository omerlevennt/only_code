part of './home_view.dart';

List<String> buttonText = ['Pupular', 'Nearby', 'Recommneded', 'Last'];
const String imageUrl = 'https://i.redd.it/8up9xqxk1zy41.jpg';

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
        fillColor: ColorItems.paynesGreey,
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
          color: ColorItems.paynesBlue,
        ));
  }
}

class _ButtonListViewBuilder extends StatelessWidget {
  const _ButtonListViewBuilder({
    required this.buttonText,
  });

  final List<String> buttonText;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      scrollDirection: Axis.horizontal,
      itemCount: buttonText.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(right: 12.0),
          child: MyButton(text: buttonText[index]),
        );
      },
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: _SearchBar(),
        ),
        Padding(
          padding: EdgeInsets.only(left: PagePadding.pagePaddingK16.left),
          child: const _FilterButton(),
        )
      ],
    );
  }
}

class _CardItems extends StatelessWidget {
  const _CardItems();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      padding: EdgeInsets.zero,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return const Padding(
          padding: EdgeInsets.only(right: 10.0),
          child: Card(
            child: Stack(
              children: [
                SizedBox(
                  child: _CardImage(imageUrl: imageUrl),
                ),
                _FavoriteIcon(),
                Positioned(
                  bottom: 0,
                  child: _CardHeader(),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

class _CardImage extends StatelessWidget {
  const _CardImage({
    required this.imageUrl,
  });

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageUrl,
      fit: BoxFit.cover,
    );
  }
}

class _CardHeader extends StatelessWidget {
  const _CardHeader();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: WidgetSizes.spacingXxlL15,
      height: WidgetSizes.spacingXxl7,
      decoration: const BoxDecoration(color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Mavar Mevati Hotel',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 40.0),
                child: Text(
                  "99/night",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ],
          ),
          const Spacer(),
          Row(
            children: [
              const Icon(
                Icons.place,
                color: Colors.red,
              ),
              Text(
                'South tang, Banten',
                style: Theme.of(context).textTheme.titleMedium,
              )
            ],
          )
        ],
      ),
    );
  }
}

class _FavoriteIcon extends StatelessWidget {
  const _FavoriteIcon();

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 10,
      right: 10,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(90)),
        child: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.favorite,
              color: Colors.red,
            )),
      ),
    );
  }
}

class _CardTile extends StatelessWidget {
  const _CardTile({required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          text,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const Spacer(),
        TextButton(
          onPressed: () {},
          child: const Text(LocalKeys.seeAll),
        ),
      ],
    );
  }
}
