import 'package:bt_game/services/sprite_service.dart';
import 'package:flame/components.dart';
import 'package:flame/layers.dart';

class Background extends PreRenderedLayer {

  final SpriteService _spriteService;
  final Vector2 screenSize;

  Background(this._spriteService, this.screenSize);

  @override
  void drawLayer() {
    final width = screenSize.x;
    final height = screenSize.y;
    final _bg = SpriteComponent(sprite: _spriteService.background, size: Vector2(width, height));
    _bg.render(canvas);
  }
}