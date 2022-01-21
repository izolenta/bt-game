import 'package:bt_logic/bt_logic.dart';
import 'package:built_value/built_value.dart';
import 'package:flame/components.dart';

part 'buttons_state.g.dart';

abstract class ButtonsState implements Built<ButtonsState, ButtonsStateBuilder> {
  factory ButtonsState([void Function(ButtonsStateBuilder b) updates]) = _$ButtonsState;

  ButtonsState._();

  Board? get board;

  Vector2? get screenSize;

  int get dimension;

  int get turnsLeft;
}
