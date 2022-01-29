import 'package:bt_game/redux/actions/init_board_list_action.dart';
import 'package:bt_game/redux/buttons_dispatcher.dart';
import 'package:bt_game/scenes/game_scene.dart';
import 'package:bt_game/services/register_dependencies.dart';
import 'package:bt_logic/bt_logic.dart';
import 'package:flame/flame.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';

late ButtonsDispatcher _dispatcher;

void main() async {
  registerDependencies();
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(BoardConfigAdapter());
  _dispatcher = GetIt.I.get<ButtonsDispatcher>();
  await _copyDataToHive();
  await _readHiveData();
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

Future<void> _readHiveData() async {
  final ids = <int, List<BoardConfig>>{};
  for (var key in diffData.keys) {
    final box = await Hive.openBox<BoardConfig>('boards_$key');
    ids[key] = box.values.toList();
    box.close();
  }
  _dispatcher.dispatch(InitBoardListAction(ids));
  await (Future.delayed(Duration.zero));
}

Future<void> _copyDataToHive() async {
  for (var key in diffData.keys) {
    final boxName = 'boards_$key';
    var exists = await Hive.boxExists(boxName);
    if (exists) {
      print('Box $boxName exists, skipping');
    }
    else {
      print('Box $boxName does not exist, copying data');
      final box = await Hive.openBox<BoardConfig>('boards_$key');
      var content = await rootBundle.loadString('assets/boards/x$key.csv');
      content = content.trim();
      final lines = content.split('\n');
      for (var line in lines) {
        var split = line.trim().split(',');
        int moves = int.parse(split[2]);
        int id = int.parse(split[0]);
        var foundDiff = getDifficulty(key, moves);
        if (foundDiff != null) {
          if (box.values
              .where((b) => b.id == id)
              .isNotEmpty) {
            print('duplicated value $id');
          }
          else {
            box.add(BoardConfig()
              ..id = id
              ..dimension = key
              ..solutionLength = moves
              ..difficulty = foundDiff
              ..accessed = false
            );
          }
        }
      }
      box.close();
    }
  }
}