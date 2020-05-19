import 'package:meta/meta.dart';

@immutable
class MainState {
  final List carts;
  final List catalogs;
  final int total;
  final double sliderValue;

  MainState(
      {@required this.carts,
      @required this.catalogs,
      @required this.total,
      @required this.sliderValue});

  factory MainState.initial() {
    return MainState(carts: [], catalogs: [], total: 0, sliderValue: 1.0);
  }

  MainState copyWith(
      {List carts, List catalogs, int total, double sliderValue}) {
    return MainState(
      carts: carts ?? this.carts,
      catalogs: catalogs ?? this.catalogs,
      total: total ?? this.total,
      sliderValue: sliderValue ?? this.sliderValue,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MainState &&
          runtimeType == other.runtimeType &&
          carts == other.carts &&
          catalogs == other.catalogs &&
          total == other.total &&
          sliderValue == other.sliderValue;

  @override
  int get hashCode =>
      carts.hashCode ^
      catalogs.hashCode ^
      total.hashCode ^
      sliderValue.hashCode;
}
