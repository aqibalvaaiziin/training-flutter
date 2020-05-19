import 'package:redux/redux.dart';
import 'package:training/redux/action/main_action.dart';
import 'package:training/redux/model/main_model.dart';

final mainReducer = combineReducers<MainState>(
    [TypedReducer<MainState, dynamic>(_setMainState)]);

MainState _setMainState(MainState state, action) {
  if (action is SetCart) {
    return state.copyWith(carts: action.carts);
  } else if (action is SetTotal) {
    return state.copyWith(total: action.total);
  } else if (action is SetCatalog) {
    return state.copyWith(catalogs: action.catalogs);
  } else if (action is SetSliderValue) {
    return state.copyWith(sliderValue: action.sliderValue);
  }
  return state;
}
