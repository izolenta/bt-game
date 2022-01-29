import 'package:bt_logic/bt_logic.dart';

class InitBoardListAction {
  final Map<int, List<BoardConfig>> boards;

  InitBoardListAction(this.boards);
}