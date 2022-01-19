import 'package:bt_game/redux/actions/generate_field_action.dart';
import 'package:bt_game/redux/actions/generate_field_success_action.dart';
import 'package:bt_logic/bt_logic.dart';
import 'package:flutter/foundation.dart';
import 'package:redux_epics/redux_epics.dart';

import 'states/buttons_state.dart';

Board _generateField(GenerateFieldParam param) => param.solver.generateField(param.size, param.difficulty, param.deepCheck);

class ButtonsEffects {

  final SolverService _solver;

  ButtonsEffects(this._solver);

  Epic<ButtonsState> getEffects() {
    return combineEpics([
      TypedEpic<ButtonsState, GenerateFieldAction>(_onGenerateField),
    ]);
  }

  Stream<Object?> _onGenerateField(Stream<GenerateFieldAction> actions, EpicStore<ButtonsState> store) =>
      actions.asyncExpand((action) async* {
        var board = await compute(_generateField, GenerateFieldParam(action.dimension, action.difficulty, 5, _solver));
        yield GenerateFieldSuccessAction(board);
      });
}