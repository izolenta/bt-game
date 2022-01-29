import 'package:built_value/built_value.dart';

part 'board_description.g.dart';

abstract class BoardDescription implements Built<BoardDescription, BoardDescriptionBuilder> {

  int get boardId;
  bool get isAccessed;
  int get difficulty;
  int get turnsToSolve;

  BoardDescription._();
  factory BoardDescription([void Function(BoardDescriptionBuilder) updates]) = _$BoardDescription;
}