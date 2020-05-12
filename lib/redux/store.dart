import 'package:redux/redux.dart';
import 'package:redux_logging/redux_logging.dart';
import 'package:training/redux/model/app_model.dart';
import 'package:training/redux/reducer/app_reducer.dart';

Future<Store<AppState>> createStore() async {
  return Store(
    appReducer,
    initialState: AppState.initial(),
    distinct: true,
    middleware: [LoggingMiddleware.printer()],
  );
}
