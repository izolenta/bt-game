// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'board_set_for_size.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$BoardSetForSize extends BoardSetForSize {
  @override
  final BuiltMap<int, List<BoardDescription>> boardsForDifficulty;

  factory _$BoardSetForSize([void Function(BoardSetForSizeBuilder)? updates]) =>
      (new BoardSetForSizeBuilder()..update(updates)).build();

  _$BoardSetForSize._({required this.boardsForDifficulty}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        boardsForDifficulty, 'BoardSetForSize', 'boardsForDifficulty');
  }

  @override
  BoardSetForSize rebuild(void Function(BoardSetForSizeBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BoardSetForSizeBuilder toBuilder() =>
      new BoardSetForSizeBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BoardSetForSize &&
        boardsForDifficulty == other.boardsForDifficulty;
  }

  @override
  int get hashCode {
    return $jf($jc(0, boardsForDifficulty.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('BoardSetForSize')
          ..add('boardsForDifficulty', boardsForDifficulty))
        .toString();
  }
}

class BoardSetForSizeBuilder
    implements Builder<BoardSetForSize, BoardSetForSizeBuilder> {
  _$BoardSetForSize? _$v;

  MapBuilder<int, List<BoardDescription>>? _boardsForDifficulty;
  MapBuilder<int, List<BoardDescription>> get boardsForDifficulty =>
      _$this._boardsForDifficulty ??=
          new MapBuilder<int, List<BoardDescription>>();
  set boardsForDifficulty(
          MapBuilder<int, List<BoardDescription>>? boardsForDifficulty) =>
      _$this._boardsForDifficulty = boardsForDifficulty;

  BoardSetForSizeBuilder();

  BoardSetForSizeBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _boardsForDifficulty = $v.boardsForDifficulty.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BoardSetForSize other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$BoardSetForSize;
  }

  @override
  void update(void Function(BoardSetForSizeBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$BoardSetForSize build() {
    _$BoardSetForSize _$result;
    try {
      _$result = _$v ??
          new _$BoardSetForSize._(
              boardsForDifficulty: boardsForDifficulty.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'boardsForDifficulty';
        boardsForDifficulty.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'BoardSetForSize', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
