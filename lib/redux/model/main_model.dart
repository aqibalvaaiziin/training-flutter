import 'package:meta/meta.dart';

@immutable
class MainState {
  final List carts;
  final int total;
  MainState({@required this.carts, @required this.total});

  factory MainState.initial() {
    return MainState(carts: [], total: 0);
  }

  MainState copyWith({List carts, int total}) {
    return MainState(
      carts: carts ?? this.carts,
      total: total ?? this.total,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MainState &&
          runtimeType == other.runtimeType &&
          carts == other.carts;

  @override
  int get hashCode => carts.hashCode;
}
