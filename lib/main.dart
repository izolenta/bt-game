import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';

import 'flame/buttons_game.dart';
import 'services/register_dependencies.dart';

void main() async {

  registerDependencies();
  final buttons = GetIt.I.get<ButtonsGame>();
  runApp(GameWidget(game: buttons));
  await Flame.device.fullScreen();
  await Flame.device.setPortrait();
}