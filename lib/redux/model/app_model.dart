import 'package:training/redux/model/main_model.dart';

class AppState {
  final MainState mainState;

  AppState({this.mainState});

  factory AppState.initial() {
    return AppState(mainState: MainState.initial());
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppState &&
          runtimeType == other.runtimeType &&
          mainState == other.mainState;

  @override
  int get hashCode => mainState.hashCode;
}
