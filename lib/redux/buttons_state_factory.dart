import 'states/buttons_state.dart';

ButtonsState initButtonsState() {
  return ButtonsState((b) => b
      ..dimension = 15
      ..turnsLeft = 0
      ..topPadding = 0
  );
}
