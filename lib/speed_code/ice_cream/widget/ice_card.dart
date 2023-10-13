import 'package:flutter/material.dart';
import 'package:only_code/speed_code/ice_cream/constants/ice_cream_constants.dart';

class IceCard extends StatelessWidget {
  const IceCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          _Header(
            title: IceCreamConstants.cardTitle,
            onPressed: () {},
          ),
          const Expanded(child: _BodyImage()),
          const _BottomField(
              money: IceCreamConstants.price,
              storeName: IceCreamConstants.inStock),
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({required this.title, required this.onPressed});
  final String title;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title),
        const Spacer(),
        Card(
          child: IconButton.filled(
              onPressed: onPressed,
              icon: const Icon(
                Icons.favorite,
                color: IceCreamConstants.favoriteColor,
              )),
        )
      ],
    );
  }
}

class _BodyImage extends StatelessWidget {
  const _BodyImage();

  @override
  Widget build(BuildContext context) {
    return Image.network(IceCreamConstants.cardImage);
  }
}

class _BottomField extends StatelessWidget {
  const _BottomField({required this.money, required this.storeName});
  final double money;
  final String storeName;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            Text(storeName),
            Text.rich(TextSpan(children: [
              const TextSpan(
                text: '\$ ',
              ),
              TextSpan(
                  text: '$money',
                  style: Theme.of(context).textTheme.titleMedium),
            ]))
          ],
        ),
        const Spacer(),
        ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () {},
            child: const Row(
              children: [
                Text(IceCreamConstants.toCard),
                Padding(
                  padding: IceCreamConstants.paddingLeftLow,
                  child: Icon(Icons.shopping_basket_outlined),
                )
              ],
            ))
      ],
    );
  }
}
