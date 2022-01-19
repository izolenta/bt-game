import 'dart:ui';

import 'package:bt_game/redux/states/buttons_state.dart';
import 'package:bt_game/services/sprite_service.dart';
import 'package:flame/extensions.dart';
import 'package:get_it/get_it.dart';
import 'package:redux/redux.dart';

class BoardPanel {

  late final SpriteService _spriteService;
  late final Store<ButtonsState> _store;

  BoardPanel() {
    _store = GetIt.I.get<Store<ButtonsState>>();
    _spriteService = GetIt.I.get<SpriteService>();
  }

  void update(double dt) {}

  void render(Canvas canvas) {
    if (!_spriteService.isInitialized) {
      return;
    }
    final dimension = _store.state.dimension;
    var width = _store.state.screenSize!.x;
    var cellSize = (width - 20)/_store.state.dimension;
    for (var  i=0; i<dimension; i++) {
      for (var  j=0; j<dimension; j++) {
        var sprite = _spriteService.cleanBlocks[6];
        if (_store.state.board != null) {
          var cell = _store.state.board!.cells[i*dimension+j];
            sprite = cell.isMarked
                ? _spriteService.starBlocks[cell.color]
                : _spriteService.cleanBlocks[cell.color];
        }
        sprite.render(canvas, position: Vector2(10+j*cellSize, 70+i*cellSize), size: Vector2(cellSize, cellSize));
      }
    }
  }
}
