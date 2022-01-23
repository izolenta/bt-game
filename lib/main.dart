import 'package:bt_game/scenes/game_scene.dart';
import 'package:flame/flame.dart';
import 'package:flutter/material.dart';
import 'services/register_dependencies.dart';

void main() async {

  registerDependencies();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      // Dark more because we are too cool for white theme.
      themeMode: ThemeMode.dark,
      // Use custom theme with 'BungeeInline' font.
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        fontFamily: 'BungeeInline',
        scaffoldBackgroundColor: Colors.black,
      ),
      // MainMenu will be the first screen for now.
      // But this might change in future if we decide
      // to add a splash screen.
      home: const GameScene(),
    ),
  );
  await Flame.device.fullScreen();
  await Flame.device.setPortrait();
}