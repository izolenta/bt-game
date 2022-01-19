import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/sprite.dart';

class SpriteService {

  bool _isInitialized = false;

  late final _cleanBlocks = <Sprite>[];
  late final _starBlocks = <Sprite>[];
  late final _buttons = <Sprite>[];

  bool get isInitialized => _isInitialized;

  SpriteService() {
    var s = 1;
  }

  void initSprites() {
    for (var i = 0; i < 7; i++) {
      var next = Sprite(Flame.images.fromCache('sprites.png'),
          srcPosition: Vector2(i * 256, 0), srcSize: Vector2(256, 256));
      _cleanBlocks.add(next);
      next = Sprite(Flame.images.fromCache('sprites.png'),
          srcPosition: Vector2(i * 256, 256), srcSize: Vector2(256, 256));
      _starBlocks.add(next);
    }
    _isInitialized = true;
  }

  List<Sprite> get cleanBlocks => _cleanBlocks;
  List<Sprite> get starBlocks => _starBlocks;
  List<Sprite> get buttons => _buttons;
}
