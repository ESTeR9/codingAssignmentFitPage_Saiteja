import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_scan_parser/cubit/stock_scan_state.dart';

import '../network/models/stock_scan_resp.dart';
import '../repository/stock_scan_repo.dart';

class StockScanCubit extends Cubit<StockScanPageState> {
  final StockScanRepo _stockScanRepo;
  List<StockScan> stockScans = [];

  StockScanCubit({required stockScanRepo})
      : _stockScanRepo = stockScanRepo,
        super(StockScanPageInitialState());

  Future<void> fetchStockScans() async {
    emit(StockScanPageLoadingState());
    stockScans = await _stockScanRepo.getStockScanData();
    if (stockScans.isNotEmpty) {
      emit(StockScanPageLoadedState());
    }
  }
}
