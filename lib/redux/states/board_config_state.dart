import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';

import 'board_set_for_size.dart';

part 'board_config_state.g.dart';

abstract class BoardConfigState implements Built<BoardConfigState, BoardConfigStateBuilder> {

  BuiltMap<int, BoardSetForSize> get boardSetsForSize;

  BoardConfigState._();
  factory BoardConfigState([void Function(BoardConfigStateBuilder) updates]) = _$BoardConfigState;
}