import 'dart:ui' as ui;
import 'package:bt_game/flame/components/color_button.dart';
import 'package:bt_game/redux/actions/generate_field_action.dart';
import 'package:bt_game/redux/actions/resize_action.dart';
import 'package:bt_game/redux/buttons_dispatcher.dart';
import 'package:bt_game/redux/states/buttons_state.dart';
import 'package:bt_game/services/lifecycle_notifier.dart';
import 'package:bt_game/services/sprite_service.dart';
import 'package:bt_logic/bt_logic.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

class ButtonsGame extends FlameGame with HasTappables {

  final Store<ButtonsState> _store;
  final ButtonsDispatcher _dispatcher;
  final SpriteService _spriteService;
  final LifecycleNotifier _notifier;
  late final TextComponent _turnsWidget;
  final cells = <SpriteComponent>[];

  ButtonsState get state => _store.state;
  int get dimension => state.dimension;
  num get width => state.screenSize!.x;
  num get height => state.screenSize!.y;
  double get cellSize => (width - 20)/dimension;

  String get turnsLeftString => 'TURNS: ${state.turnsLeft}';

  ButtonsGame(this._store, this._dispatcher, this._spriteService, this._notifier) {
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
    _fillInitialBoard();
    _dispatcher.dispatch(GenerateFieldAction(state.dimension, Difficulty.easy));
    _notifier.onBoardGenerated.listen(_onBoardGenerated);
    _notifier.onMoveDone.listen(_onMoveDone);
    super.onLoad();
  }

  @override
  void update(double dt) {
    super.update(dt);
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
  }

  @override
  void onGameResize(Vector2 size) {
    _dispatcher.dispatch(ResizeAction(size));
    super.onGameResize(size);
  }

  @override
  Color backgroundColor() => const Color(0x00000000);

  Future _onBoardGenerated(void _) async {
    await _fillStartPosition();
    _addButtons();
    _addTurnsText();
  }

  void _addTurnsText() {
    _turnsWidget = TextComponent(
        text: turnsLeftString,
        position: Vector2(10, 40),
        textRenderer: TextPaint(
          style: TextStyle(
            fontFamily: 'Lilita',
            fontSize: 25,
            foreground: Paint()
              ..shader = ui.Gradient.linear(
                const Offset(0,0),
                const Offset(0,20),
                [
                  Colors.blue.shade50,
                  Colors.blue.shade700
                ],
              ),
          ),
        ));
    add(_turnsWidget);
  }

  void _fillInitialBoard() {
    var sprite = _spriteService.cleanBlocks[6];
    for (int i=0; i<dimension; i++) {
      for (int j=0; j<dimension; j++) {
        final widget = SpriteComponent(
          sprite: sprite,
          position: Vector2(10+j*cellSize, 70+i*cellSize),
          size: Vector2(cellSize, cellSize),
        );
        widget.setAlpha(0);
        var cc = CurvedEffectController(0.3, Curves.decelerate);
        widget.add(OpacityEffect.fadeIn(cc));
        cells.add(widget);
        add(widget);
      }
    }
  }

  Future<void> _fillStartPosition() async{
    var cnt = 0;
    while (true) {
      if (cnt < dimension * dimension) {
        var widget = cells[cnt];
        var cc = CurvedEffectController(0.2, Curves.decelerate);
        widget.add(OpacityEffect.to(0.3, cc));
      }
      if (cnt >= 20) {
        final x = (cnt-20) % dimension;
        final y = (cnt-20) ~/ dimension;
        var cell = state.board!.cells[cnt-20];
        final sprite = cell.isMarked
            ? _spriteService.starBlocks[cell.color]
            : _spriteService.cleanBlocks[cell.color];
        final oldWidget = cells[cnt-20];
        remove(oldWidget);
        final widget = SpriteComponent(
          sprite: sprite,
          position: Vector2(10+x*cellSize, 70+y*cellSize),
          size: Vector2(cellSize, cellSize),
        );
        widget.setAlpha((255*0.3).toInt());
        var cc = CurvedEffectController(0.2, Curves.decelerate);
        widget.add(OpacityEffect.to(1, cc));
        if (cell.isMarked) {
          _addPulse(widget);
        }
        cells[cnt-20] = widget;
        add(widget);
      }
      await Future.delayed(const Duration(milliseconds: 4));
      cnt++;
      if (cnt >= dimension * dimension + 20) {
        break;
      }
    }
  }

  void _onMoveDone(void _) {
    var cnt = 0;
    while (cnt < dimension * dimension) {
      final x = cnt % dimension;
      final y = cnt ~/ dimension;
      var cell = state.board!.cells[cnt];
      final sprite = cell.isMarked
          ? _spriteService.starBlocks[cell.color]
          : _spriteService.cleanBlocks[cell.color];
      final oldWidget = cells[cnt];
      remove(oldWidget);
      final widget = SpriteComponent(
        sprite: sprite,
        position: Vector2(10+x*cellSize, 70+y*cellSize),
        size: Vector2(cellSize, cellSize),
      );
      if (cell.isMarked) {
        _addPulse(widget);
      }
      cells[cnt] = widget;
      add(widget);
      cnt++;
    }
    for (var comp in children.whereType<ColorButton>()) {
      if (comp.color == state.board!.cells[0].color && !comp.isHidden) {
        comp.hide();
      }
      if (comp.color != state.board!.cells[0].color && comp.isHidden) {
        comp.reveal();
      }
    }
    _turnsWidget.text = turnsLeftString;
  }

  void _addPulse(HasPaint widget) {
    widget.add(ColorEffect(
      const Color(0xFF000000),
      const Offset(0.0, 0.4),
      InfiniteEffectController(SequenceEffectController([
        CurvedEffectController(1, Curves.easeOut),
        ReverseCurvedEffectController(1, Curves.easeIn),
      ]
      )),
    ));
  }

  void _addButtons() {
    var fraction = width / 3;
    var buttonWidth = 384/width*fraction;
    for (var i=0; i<6; i++) {
      final sprite = _spriteService.buttons[i];
      final widget = ColorButton(
        sprite,
        i,
        Vector2(40 + buttonWidth/2 + 180*(i ~/ 3).toDouble(), 500+80*(i%3)),
        Vector2(384/width*fraction, 180/width*fraction),
        _dispatcher,
        Anchor.center,
      );
      add(widget);
    }
  }
}
