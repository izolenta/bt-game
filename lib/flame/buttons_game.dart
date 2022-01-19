import 'package:bt_game/redux/actions/generate_field_action.dart';
import 'package:bt_game/redux/actions/resize_action.dart';
import 'package:bt_game/redux/buttons_dispatcher.dart';
import 'package:bt_game/redux/states/buttons_state.dart';
import 'package:bt_game/services/sprite_service.dart';
import 'package:bt_logic/bt_logic.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:redux/redux.dart';

import 'components/board_panel.dart';

class ButtonsGame extends FlameGame {

  late final Store<ButtonsState> _store;
  late final ButtonsDispatcher _dispatcher;
  late final SpriteService _spriteService;
  late final BoardPanel _boardPanel;

  ButtonsGame() {
    _dispatcher = GetIt.I.get<ButtonsDispatcher>();
    _store = GetIt.I.get<Store<ButtonsState>>();
    _spriteService = GetIt.I.get<SpriteService>();

    _boardPanel = BoardPanel();

    _dispatcher.onAction.listen((Object act) {
      _store.dispatch(act);
    });
  }

  @override
  Future<void> onLoad() async {
    final items = [
      'sprites.png'
    ];
    await Flame.images.loadAll(items);
    _spriteService.initSprites();
    _dispatcher.dispatch(GenerateFieldAction(10, Difficulty.hard));
    super.onLoad();
  }

  @override
  void update(double dt) {
    _boardPanel.update(dt);
    super.update(dt);
  }

  @override
  void render(Canvas canvas) {
    _boardPanel.render(canvas);
    _renderTurns(canvas);
    super.render(canvas);
  }

  @override
  void onGameResize(Vector2 size) {
    _dispatcher.dispatch(ResizeAction(size));
    super.onGameResize(size);
  }

  @override
  Color backgroundColor() => const Color(0x00000000);

  void _renderTurns(Canvas canvas) {
    const textStyle = TextStyle(
        color: Colors.blue,
        fontSize: 30,
        fontFamily: 'Amatic'
    );

    const textSpan = TextSpan(
      text: 'TURNS: 25',
      style: textStyle,
    );
    final textPainter = TextPainter(
      text: textSpan,
      textAlign: TextAlign.left,
      textDirection: TextDirection.ltr,
    );
    textPainter.layout(
      minWidth: 300,
      maxWidth: 300,
    );
    const offset = Offset(10, 40);
    textPainter.paint(canvas, offset);
  }
}
