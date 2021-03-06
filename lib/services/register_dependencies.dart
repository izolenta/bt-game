import 'package:bt_game/flame/buttons_game.dart';
import 'package:bt_game/redux/buttons_dispatcher.dart';
import 'package:bt_game/redux/buttons_effects.dart';
import 'package:bt_game/redux/buttons_reducer.dart';
import 'package:bt_game/redux/buttons_state_factory.dart';
import 'package:bt_game/redux/states/buttons_state.dart';
import 'package:bt_game/services/sprite_service.dart';
import 'package:bt_logic/bt_logic.dart';
import 'package:get_it/get_it.dart';
import 'package:redux/redux.dart';
import 'package:redux_epics/redux_epics.dart';

import 'lifecycle_notifier.dart';

void registerDependencies() {
  final getIt = GetIt.instance;
  getIt.registerSingleton<SpriteService>(SpriteService());
  getIt.registerSingleton<LifecycleNotifier>(LifecycleNotifier());
  getIt.registerSingleton<ButtonsDispatcher>(ButtonsDispatcher());
  getIt.registerSingleton<ButtonsReducer>(ButtonsReducer());
  getIt.registerSingleton<BoardService>(BoardService());
  getIt.registerSingleton<SolverService>(SolverService(getIt.get<BoardService>()));
  getIt.registerSingleton<ButtonsEffects>(ButtonsEffects(
      getIt.get<SolverService>(),
      getIt.get<LifecycleNotifier>(),
      getIt.get<BoardService>(),
  ));
  getIt.registerSingleton<Store<ButtonsState>>(createStore(
      getIt.get<ButtonsReducer>(),
      getIt.get<ButtonsEffects>(),
  ));
  getIt.registerSingleton<ButtonsGame>(ButtonsGame(
    getIt.get<Store<ButtonsState>>(),
    getIt.get<ButtonsDispatcher>(),
    getIt.get<SpriteService>(),
    getIt.get<LifecycleNotifier>(),
  ));
}

Store<ButtonsState> createStore(ButtonsReducer reducer, ButtonsEffects effects) {
  return Store<ButtonsState>(
      reducer.reducer,
      initialState: initButtonsState(),
      middleware: [EpicMiddleware(effects.getEffects())],
      distinct: true
  );
}