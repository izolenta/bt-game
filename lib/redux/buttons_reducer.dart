import 'package:bt_game/redux/actions/generate_field_success_action.dart';
import 'package:bt_game/redux/actions/resize_action.dart';
import 'package:redux/redux.dart';

import 'states/buttons_state.dart';

class ButtonsReducer {

  late final Reducer<ButtonsState> _reducer;

  ButtonsReducer() {
    _reducer = combineReducers([
      TypedReducer<ButtonsState, ResizeAction>(_onResize),
      TypedReducer<ButtonsState, GenerateFieldSuccessAction>(_onFieldGenerated),
    ]);

  }

  Reducer<ButtonsState> get reducer => _reducer;

  ButtonsState _onResize(ButtonsState state, ResizeAction action) =>
      state.rebuild((b) => b
        ..screenSize = action.size);

  ButtonsState _onFieldGenerated(ButtonsState state, GenerateFieldSuccessAction action) =>
      state.rebuild((b) => b
        ..board.replace(action.board));
}
