import 'package:bt_game/redux/states/board_description.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';

part 'board_set_for_size.g.dart';

abstract class BoardSetForSize implements Built<BoardSetForSize, BoardSetForSizeBuilder> {

  BuiltMap<int, List<BoardDescription>> get boardsForDifficulty;

  BoardSetForSize._();
  factory BoardSetForSize([void Function(BoardSetForSizeBuilder) updates]) = _$BoardSetForSize;
}