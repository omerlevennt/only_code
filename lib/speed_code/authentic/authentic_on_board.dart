import 'package:flutter/material.dart';
import 'package:only_code/speed_code/authentic/authentic_on_board_model.dart';
part 'authentic_on_board_items.dart';

class AutgwnticOnBoardView extends StatefulWidget {
  const AutgwnticOnBoardView({super.key});

  @override
  State<AutgwnticOnBoardView> createState() => _AutgwnticOnBoardViewState();
}

class _AutgwnticOnBoardViewState extends State<AutgwnticOnBoardView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Expanded(flex: 4, child: _BodyHeader()),
          Expanded(
            flex: 3,
            child: _BodySubView(
                model: AuthenticOnBoardModel(
              title: 'Best Quality For Your Qutfit',
              description:
                  'Explore the 2021s best clothes from over 20k brands',
            )),
          )
        ],
      ),
    );
  }
}
