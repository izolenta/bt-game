import 'package:bt_game/redux/actions/generate_field_action.dart';
import 'package:bt_game/redux/actions/generate_field_success_action.dart';
import 'package:bt_game/redux/models/make_move_param.dart';
import 'package:bt_game/services/lifecycle_notifier.dart';
import 'package:bt_logic/bt_logic.dart';
import 'package:flutter/foundation.dart';
import 'package:redux_epics/redux_epics.dart';

import 'actions/move_action.dart';
import 'actions/move_success_action.dart';
import 'models/generate_field_param.dart';
import 'states/buttons_state.dart';

Board _generateField(GenerateFieldParam param) => param.solver.generateField(param.size, param.difficulty, param.deepCheck);

Board _makeMove(MakeMoveParam param) => param.boardService.move(param.board, param.color);

class ButtonsEffects {

  final SolverService _solver;
  final BoardService _boardService;
  final LifecycleNotifier _notifier;

  ButtonsEffects(this._solver, this._notifier, this._boardService);

  Epic<ButtonsState> getEffects() {
    return combineEpics([
      TypedEpic<ButtonsState, GenerateFieldAction>(_onGenerateField),
      TypedEpic<ButtonsState, GenerateFieldSuccessAction>(_onGenerateFieldSuccess),
      TypedEpic<ButtonsState, MoveAction>(_onMove),
      TypedEpic<ButtonsState, MoveSuccessAction>(_onMoveDone),
    ]);
  }

  Stream<Object?> _onGenerateField(Stream<GenerateFieldAction> actions, EpicStore<ButtonsState> store) =>
      actions.asyncExpand((action) async* {
        var board = await compute(_generateField, GenerateFieldParam(action.dimension, action.difficulty, 7, _solver));
        yield GenerateFieldSuccessAction(board, getMaxTurns(action.dimension));
      });
  Stream<Object?> _onGenerateFieldSuccess(Stream<GenerateFieldSuccessAction> actions, EpicStore<ButtonsState> store) =>
      actions.asyncExpand((action) async* {
        _notifier.notifyBoardGenerated();
      });
  Stream<Object?> _onMove(Stream<MoveAction> actions, EpicStore<ButtonsState> store) =>
      actions.asyncExpand((action) async* {
        var board = await compute(_makeMove, MakeMoveParam(_boardService, store.state.board!, action.color));
        yield MoveSuccessAction(board);
      });
  Stream<Object?> _onMoveDone(Stream<MoveSuccessAction> actions, EpicStore<ButtonsState> store) =>
      actions.asyncExpand((action) async* {
        _notifier.notifyMoveDone();
      });

}