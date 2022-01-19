import 'dart:async';

class LifecycleNotifier {

  final StreamController<void> _onBoardGeneratedController = StreamController.broadcast();
  Stream<void> get onBoardGenerated => _onBoardGeneratedController.stream;

  final StreamController<void> _onMoveDoneController = StreamController.broadcast();
  Stream<void> get onMoveDone => _onMoveDoneController.stream;

  void notifyBoardGenerated() => _onBoardGeneratedController.add(null);
  void notifyMoveDone() => _onMoveDoneController.add(null);
}