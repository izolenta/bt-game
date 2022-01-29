// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'board_config_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$BoardConfigState extends BoardConfigState {
  @override
  final BuiltMap<int, BoardSetForSize> boardSetsForSize;

  factory _$BoardConfigState(
          [void Function(BoardConfigStateBuilder)? updates]) =>
      (new BoardConfigStateBuilder()..update(updates)).build();

  _$BoardConfigState._({required this.boardSetsForSize}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        boardSetsForSize, 'BoardConfigState', 'boardSetsForSize');
  }

  @override
  BoardConfigState rebuild(void Function(BoardConfigStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BoardConfigStateBuilder toBuilder() =>
      new BoardConfigStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BoardConfigState &&
        boardSetsForSize == other.boardSetsForSize;
  }

  @override
  int get hashCode {
    return $jf($jc(0, boardSetsForSize.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('BoardConfigState')
          ..add('boardSetsForSize', boardSetsForSize))
        .toString();
  }
}

class BoardConfigStateBuilder
    implements Builder<BoardConfigState, BoardConfigStateBuilder> {
  _$BoardConfigState? _$v;

  MapBuilder<int, BoardSetForSize>? _boardSetsForSize;
  MapBuilder<int, BoardSetForSize> get boardSetsForSize =>
      _$this._boardSetsForSize ??= new MapBuilder<int, BoardSetForSize>();
  set boardSetsForSize(MapBuilder<int, BoardSetForSize>? boardSetsForSize) =>
      _$this._boardSetsForSize = boardSetsForSize;

  BoardConfigStateBuilder();

  BoardConfigStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _boardSetsForSize = $v.boardSetsForSize.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BoardConfigState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$BoardConfigState;
  }

  @override
  void update(void Function(BoardConfigStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$BoardConfigState build() {
    _$BoardConfigState _$result;
    try {
      _$result = _$v ??
          new _$BoardConfigState._(boardSetsForSize: boardSetsForSize.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'boardSetsForSize';
        boardSetsForSize.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'BoardConfigState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
