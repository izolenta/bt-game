// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'buttons_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ButtonsState extends ButtonsState {
  @override
  final Board? board;
  @override
  final Vector2? screenSize;
  @override
  final int dimension;
  @override
  final int turnsLeft;

  factory _$ButtonsState([void Function(ButtonsStateBuilder)? updates]) =>
      (new ButtonsStateBuilder()..update(updates)).build();

  _$ButtonsState._(
      {this.board,
      this.screenSize,
      required this.dimension,
      required this.turnsLeft})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        dimension, 'ButtonsState', 'dimension');
    BuiltValueNullFieldError.checkNotNull(
        turnsLeft, 'ButtonsState', 'turnsLeft');
  }

  @override
  ButtonsState rebuild(void Function(ButtonsStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ButtonsStateBuilder toBuilder() => new ButtonsStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ButtonsState &&
        board == other.board &&
        screenSize == other.screenSize &&
        dimension == other.dimension &&
        turnsLeft == other.turnsLeft;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, board.hashCode), screenSize.hashCode),
            dimension.hashCode),
        turnsLeft.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ButtonsState')
          ..add('board', board)
          ..add('screenSize', screenSize)
          ..add('dimension', dimension)
          ..add('turnsLeft', turnsLeft))
        .toString();
  }
}

class ButtonsStateBuilder
    implements Builder<ButtonsState, ButtonsStateBuilder> {
  _$ButtonsState? _$v;

  BoardBuilder? _board;
  BoardBuilder get board => _$this._board ??= new BoardBuilder();
  set board(BoardBuilder? board) => _$this._board = board;

  Vector2? _screenSize;
  Vector2? get screenSize => _$this._screenSize;
  set screenSize(Vector2? screenSize) => _$this._screenSize = screenSize;

  int? _dimension;
  int? get dimension => _$this._dimension;
  set dimension(int? dimension) => _$this._dimension = dimension;

  int? _turnsLeft;
  int? get turnsLeft => _$this._turnsLeft;
  set turnsLeft(int? turnsLeft) => _$this._turnsLeft = turnsLeft;

  ButtonsStateBuilder();

  ButtonsStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _board = $v.board?.toBuilder();
      _screenSize = $v.screenSize;
      _dimension = $v.dimension;
      _turnsLeft = $v.turnsLeft;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ButtonsState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ButtonsState;
  }

  @override
  void update(void Function(ButtonsStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ButtonsState build() {
    _$ButtonsState _$result;
    try {
      _$result = _$v ??
          new _$ButtonsState._(
              board: _board?.build(),
              screenSize: screenSize,
              dimension: BuiltValueNullFieldError.checkNotNull(
                  dimension, 'ButtonsState', 'dimension'),
              turnsLeft: BuiltValueNullFieldError.checkNotNull(
                  turnsLeft, 'ButtonsState', 'turnsLeft'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'board';
        _board?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'ButtonsState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
