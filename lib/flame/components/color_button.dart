import 'package:bt_game/redux/actions/move_action.dart';
import 'package:bt_game/redux/buttons_dispatcher.dart';
import 'package:flame/components.dart';
import 'package:flame/input.dart';

class ColorButton extends PositionComponent with Tappable {

  final Sprite sprite;
  final int color;

  final ButtonsDispatcher _dispatcher;

  ColorButton(this.sprite, this.color, Vector2? position, Vector2? size, this._dispatcher) : super(position: position, size: size) {
    final widget = SpriteComponent(
      sprite: sprite,
      position: Vector2(0,0),
      size: size,
    );
    add(widget);
  }

  @override
  bool onTapDown(TapDownInfo event) {
    _dispatcher.dispatch(MoveAction(color));
    return true;
  }
}