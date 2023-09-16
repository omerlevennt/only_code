part of './authentic_on_board.dart';

class _BodyHeader extends StatelessWidget {
  const _BodyHeader();
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      _ImagePath.woman.png,
      fit: BoxFit.cover,
    );
  }
}

class _BodySubView extends StatelessWidget {
  const _BodySubView({
    required this.model,
  });
  final AuthenticOnBoardModel model;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const _EmptyHeight(),
        Text(
          model.title,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: Theme.of(context).textTheme.headlineLarge?.fontSize,
              ),
        ),
        const _EmptyHeight(),
        Text(model.description,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w300,
                )),
        const _EmptyHeight(),
        const _GetStarted(),
      ],
    );
  }
}

class _GetStarted extends StatelessWidget {
  const _GetStarted();
  final String _getStarted = 'Get Started';
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: _ProjectRadius.circularRadiusSmall),
            backgroundColor:
                Theme.of(context).colorScheme.error.withOpacity(0.8)),
        onPressed: () {},
        child: Padding(
          padding: _ProjectPadding.paddingAll,
          child: SizedBox(
              width: MediaQuery.sizeOf(context).width * 0.5,
              child: Center(child: Text(_getStarted))),
        ));
  }
}

mixin _ProjectPadding {
  static EdgeInsets paddingAll = const EdgeInsets.all(24);
}

mixin _ProjectRadius {
  static BorderRadius circularRadiusSmall = BorderRadius.circular(8);
}

class _EmptyHeight extends StatelessWidget {
  const _EmptyHeight();

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 24,
    );
  }
}

class _ImagePath {
  static const String woman = 'img_women';
}

extension on String {
  String get png => 'assets/img/$this.png';
}
