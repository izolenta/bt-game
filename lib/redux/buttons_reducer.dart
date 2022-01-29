import 'package:bt_game/redux/actions/change_need_safe_area_action.dart';
import 'package:bt_game/redux/actions/generate_field_success_action.dart';
import 'package:bt_game/redux/actions/init_board_list_action.dart';
import 'package:bt_game/redux/actions/move_success_action.dart';
import 'package:bt_game/redux/actions/resize_action.dart';
import 'package:bt_game/redux/states/board_description.dart';
import 'package:bt_game/redux/states/board_set_for_size.dart';
import 'package:redux/redux.dart';

import 'states/buttons_state.dart';

class ButtonsReducer {

  late final Reducer<ButtonsState> _reducer;

  ButtonsReducer() {
    _reducer = combineReducers([
      TypedReducer<ButtonsState, ResizeAction>(_onResize),
      TypedReducer<ButtonsState, GenerateFieldSuccessAction>(_onFieldGenerated),
      TypedReducer<ButtonsState, MoveSuccessAction>(_onMoveDone),
      TypedReducer<ButtonsState, ChangeNeedSafeAreaAction>(_onChangeNeedSafeArea),
      TypedReducer<ButtonsState, InitBoardListAction>(_onInitBoardList),
    ]);

  }

  Reducer<ButtonsState> get reducer => _reducer;

  ButtonsState _onResize(ButtonsState state, ResizeAction action) =>
      state.rebuild((b) => b
        ..screenSize = action.size);

  ButtonsState _onChangeNeedSafeArea(ButtonsState state, ChangeNeedSafeAreaAction action) =>
      state.rebuild((b) => b
        ..topPadding = action.topPadding);

  ButtonsState _onFieldGenerated(ButtonsState state, GenerateFieldSuccessAction action) =>
      state.rebuild((b) => b
        ..turnsLeft = action.maxTurns
        ..board.replace(action.board));

  ButtonsState _onMoveDone(ButtonsState state, MoveSuccessAction action) =>
      state.rebuild((b) => b
        ..turnsLeft = state.turnsLeft-1
        ..board.replace(action.board));

  ButtonsState _onInitBoardList(ButtonsState state, InitBoardListAction action) =>
      state.rebuild((b) {
        for (var nextSize in action.boards.keys) {
          var setForSize = BoardSetForSize();
          final sizeSet = action.boards[nextSize]!;
          for (int i=0; i<3; i++) {
            final boardDescriptions = <BoardDescription>[];
            final diffSet = sizeSet.where((element) => element.difficulty == i).toList();
            for (var nextDiff in diffSet) {
              boardDescriptions.add(BoardDescription((b) => b
                  ..difficulty = i
                  ..boardId = nextDiff.id
                  ..isAccessed = nextDiff.accessed
                  ..turnsToSolve = nextDiff.solutionLength
              ));
            }
            var a = 0;
            setForSize = setForSize.rebuild((s) => s.boardsForDifficulty[i] = boardDescriptions);
            var b = 0;
          }
          var c = 0;
          b.boardConfigState.boardSetsForSize[nextSize] = setForSize;
        }
      });
}
