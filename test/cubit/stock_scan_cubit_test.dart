import 'package:mockito/annotations.dart';
import "package:flutter_test/flutter_test.dart";
import "package:bloc_test/bloc_test.dart";
import 'package:mockito/mockito.dart';
import 'package:stock_scan_parser/cubit/stock_scan_cubit.dart';
import 'package:stock_scan_parser/cubit/stock_scan_state.dart';
import 'package:stock_scan_parser/network/models/stock_scan_resp.dart';
import 'package:stock_scan_parser/repository/stock_scan_repo.dart';

import 'stock_scan_cubit_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<StockScanRepoImpl>(),
])
void main() {
  late StockScanRepo stockScanRepo;
  late StockScanCubit stockScanCubit;

  setUp(() {
    stockScanRepo = MockStockScanRepoImpl();
    stockScanCubit = StockScanCubit(stockScanRepo: stockScanRepo);

    when(stockScanRepo.getStockScanData())
        .thenAnswer((realInvocation) => Future.value([
              StockScan.fromJson({
                "id": 1,
                "name": "Top gainers",
                "tag": "Intraday Bullish",
                "color": "green",
                "criteria": [
                  {
                    "type": "plain_text",
                    "text": "Sort - %price change in descending order"
                  }
                ]
              })
            ]));
  });

  blocTest<StockScanCubit, StockScanPageState>(
      "Emits StockScanPageLoadedState on success response",
      build: () => stockScanCubit,
      act: (StockScanCubit stockScanCubit) {
        stockScanCubit.fetchStockScans();
      },
      expect: () => [StockScanPageLoadingState(), StockScanPageLoadedState()],
      verify: (cubit) {
        verify(stockScanRepo.getStockScanData()).called(1);
      });
}
