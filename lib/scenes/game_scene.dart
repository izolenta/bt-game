import 'package:bt_game/flame/buttons_game.dart';
import 'package:bt_game/redux/actions/change_need_safe_area_action.dart';
import 'package:bt_game/redux/buttons_dispatcher.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

final buttons = GetIt.I.get<ButtonsGame>();
final dispatcher = GetIt.I.get<ButtonsDispatcher>();

class GameScene extends StatelessWidget {
  const GameScene({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    dispatcher.dispatch(ChangeNeedSafeAreaAction(MediaQuery.of(context).viewPadding.top.toInt()));
    return Scaffold(
      body: WillPopScope(
        onWillPop: () async => false,
        child: GameWidget(
          game: buttons,
        ),
      ),
    );
  }
}