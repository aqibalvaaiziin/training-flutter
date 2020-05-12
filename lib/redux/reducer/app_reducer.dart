import 'package:training/redux/model/app_model.dart';
import 'package:training/redux/reducer/main_raducer.dart';

AppState appReducer(AppState state, dynamic action) {
  return AppState(mainState: mainReducer(state.mainState, action));
}
