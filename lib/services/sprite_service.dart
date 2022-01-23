import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/sprite.dart';

class SpriteService {

  bool _isInitialized = false;

  late final _cleanBlocks = <Sprite>[];
  late final _starBlocks = <Sprite>[];
  late final _buttons = <Sprite>[];
  late final Sprite _background;

  bool get isInitialized => _isInitialized;

  void initSprites() {
    for (var i = 0; i < 7; i++) {
      var next = Sprite(Flame.images.fromCache('sprites.png'),
          srcPosition: Vector2(i * 256, 0), srcSize: Vector2(256, 256));
      _cleanBlocks.add(next);
      next = Sprite(Flame.images.fromCache('sprites.png'),
          srcPosition: Vector2(i * 256, 256), srcSize: Vector2(256, 256));
      _starBlocks.add(next);
    }
    for (var i=0; i<4; i++) {
      var next = Sprite(Flame.images.fromCache('sprites.png'),
          srcPosition: Vector2(i * 384, 512), srcSize: Vector2(384, 180));
      _buttons.add(next);
    }
    for (var i=0; i<2; i++) {
      var next = Sprite(Flame.images.fromCache('sprites.png'),
          srcPosition: Vector2(i * 384, 692), srcSize: Vector2(384, 180));
      _buttons.add(next);
    }
    _background = Sprite(Flame.images.fromCache('bg.png'));
    _isInitialized = true;
  }

  List<Sprite> get cleanBlocks => _cleanBlocks;
  List<Sprite> get starBlocks => _starBlocks;
  List<Sprite> get buttons => _buttons;
  Sprite get background => _background;
}
