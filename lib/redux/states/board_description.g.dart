// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'board_description.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$BoardDescription extends BoardDescription {
  @override
  final int boardId;
  @override
  final bool isAccessed;
  @override
  final int difficulty;
  @override
  final int turnsToSolve;

  factory _$BoardDescription(
          [void Function(BoardDescriptionBuilder)? updates]) =>
      (new BoardDescriptionBuilder()..update(updates)).build();

  _$BoardDescription._(
      {required this.boardId,
      required this.isAccessed,
      required this.difficulty,
      required this.turnsToSolve})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        boardId, 'BoardDescription', 'boardId');
    BuiltValueNullFieldError.checkNotNull(
        isAccessed, 'BoardDescription', 'isAccessed');
    BuiltValueNullFieldError.checkNotNull(
        difficulty, 'BoardDescription', 'difficulty');
    BuiltValueNullFieldError.checkNotNull(
        turnsToSolve, 'BoardDescription', 'turnsToSolve');
  }

  @override
  BoardDescription rebuild(void Function(BoardDescriptionBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BoardDescriptionBuilder toBuilder() =>
      new BoardDescriptionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BoardDescription &&
        boardId == other.boardId &&
        isAccessed == other.isAccessed &&
        difficulty == other.difficulty &&
        turnsToSolve == other.turnsToSolve;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, boardId.hashCode), isAccessed.hashCode),
            difficulty.hashCode),
        turnsToSolve.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('BoardDescription')
          ..add('boardId', boardId)
          ..add('isAccessed', isAccessed)
          ..add('difficulty', difficulty)
          ..add('turnsToSolve', turnsToSolve))
        .toString();
  }
}

class BoardDescriptionBuilder
    implements Builder<BoardDescription, BoardDescriptionBuilder> {
  _$BoardDescription? _$v;

  int? _boardId;
  int? get boardId => _$this._boardId;
  set boardId(int? boardId) => _$this._boardId = boardId;

  bool? _isAccessed;
  bool? get isAccessed => _$this._isAccessed;
  set isAccessed(bool? isAccessed) => _$this._isAccessed = isAccessed;

  int? _difficulty;
  int? get difficulty => _$this._difficulty;
  set difficulty(int? difficulty) => _$this._difficulty = difficulty;

  int? _turnsToSolve;
  int? get turnsToSolve => _$this._turnsToSolve;
  set turnsToSolve(int? turnsToSolve) => _$this._turnsToSolve = turnsToSolve;

  BoardDescriptionBuilder();

  BoardDescriptionBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _boardId = $v.boardId;
      _isAccessed = $v.isAccessed;
      _difficulty = $v.difficulty;
      _turnsToSolve = $v.turnsToSolve;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BoardDescription other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$BoardDescription;
  }

  @override
  void update(void Function(BoardDescriptionBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$BoardDescription build() {
    final _$result = _$v ??
        new _$BoardDescription._(
            boardId: BuiltValueNullFieldError.checkNotNull(
                boardId, 'BoardDescription', 'boardId'),
            isAccessed: BuiltValueNullFieldError.checkNotNull(
                isAccessed, 'BoardDescription', 'isAccessed'),
            difficulty: BuiltValueNullFieldError.checkNotNull(
                difficulty, 'BoardDescription', 'difficulty'),
            turnsToSolve: BuiltValueNullFieldError.checkNotNull(
                turnsToSolve, 'BoardDescription', 'turnsToSolve'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
