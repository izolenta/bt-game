import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/widgets.dart';

import 'flame/buttons_game.dart';
import 'services/register_dependencies.dart';

void main() async {

  registerDependencies();
  final buttons = ButtonsGame();
  runApp(GameWidget(game: buttons));
  await Flame.device.fullScreen();
  await Flame.device.setPortrait();
}