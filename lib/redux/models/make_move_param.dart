import 'package:bt_logic/bt_logic.dart';

class MakeMoveParam {
  final BoardService boardService;
  final Board board;
  final int color;

  MakeMoveParam(this.boardService, this.board, this.color);
}