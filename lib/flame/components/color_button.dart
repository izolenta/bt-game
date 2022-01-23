import 'package:bt_game/redux/actions/move_action.dart';
import 'package:bt_game/redux/buttons_dispatcher.dart';
import 'package:flame/components.dart';
import 'package:flame/input.dart';
import 'package:flutter/material.dart';

class ColorButton extends PositionComponent with Tappable {

  final Sprite _sprite;
  final int _color;
  final Anchor _anchor;

  var _hidden = false;

  final ButtonsDispatcher _dispatcher;
  late SpriteComponent _widget;

  int get color => _color;
  bool get isHidden => _hidden;

  ColorButton(this._sprite, this._color, Vector2 position, Vector2 size, this._dispatcher, this._anchor)
      : super(position: position, size: size, anchor: _anchor) {
     _widget = SpriteComponent(
      sprite: _sprite,
      position: Vector2(size.x/2, size.y/2),
      size: size,
      anchor: _anchor
    );
    add(_widget);
  }

  @override
  bool onTapDown(TapDownInfo info) {
    if (_hidden) {
      return false;
    }
    _widget.scale = Vector2(0.8, 0.8);
    return true;
  }

  @override
  bool onTapUp(TapUpInfo info) {
    if (_hidden) {
      return false;
    }
    _widget.scale = Vector2(1, 1);
    _dispatcher.dispatch(MoveAction(_color));
    return true;
  }

  @override
  bool onTapCancel() {
    if (_hidden) {
      return false;
    }
    _widget.scale = Vector2(1, 1);
    return true;
  }

  void hide() {
    _hidden = true;
    _widget.setColor(Colors.black26);
  }

  void reveal() {
    _hidden = false;
    _widget.setColor(Colors.white);
  }
}