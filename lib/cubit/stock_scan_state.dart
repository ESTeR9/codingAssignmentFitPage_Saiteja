import "package:equatable/equatable.dart";

abstract class StockScanPageState extends Equatable {
  const StockScanPageState();

  @override
  List<Object> get props => [];
}

class StockScanPageInitialState extends StockScanPageState {}

class StockScanPageLoadingState extends StockScanPageState {}

class StockScanPageLoadedState extends StockScanPageState {}
