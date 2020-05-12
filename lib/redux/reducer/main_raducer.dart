import 'package:redux/redux.dart';
import 'package:training/redux/action/main_action.dart';
import 'package:training/redux/model/main_model.dart';

final mainReducer = combineReducers<MainState>(
    [TypedReducer<MainState, SetCart>(_setMainState)]);

MainState _setMainState(MainState state, SetCart payload) {
  return state.copyWith(carts: payload.carts);
}
