import 'states/buttons_state.dart';

ButtonsState initButtonsState() {
  return ButtonsState((b) => b
      ..dimension = 12
      ..turnsLeft = 0
      ..topPadding = 0
  );
}
