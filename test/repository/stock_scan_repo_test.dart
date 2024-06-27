import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:stock_scan_parser/network/endpoints/stock_scan_api.dart';
import 'package:stock_scan_parser/network/models/stock_scan_resp.dart';
import 'package:stock_scan_parser/repository/stock_scan_repo.dart';

import 'stock_scan_repo_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<StockScanApi>(),
])
void main() {
  late StockScanRepo stockScanRepo;
  late StockScanApi stockScanApi;

  setUp(() {
    stockScanApi = MockStockScanApi();
    stockScanRepo = StockScanRepoImpl(stockScanApi: stockScanApi);

    when(stockScanApi.getData()).thenAnswer((realInvocation) => Future.value([
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
          }),
          StockScan.fromJson({
            "id": 2,
            "name": "Open = High",
            "tag": "Bullish",
            "color": "green",
            "criteria": [
              {
                "type": "variable",
                "text": "Today’s open \u003C yesterday’s low by \$1 %",
                "variable": {
                  "\$1": {
                    "type": "value",
                    "values": [-3, -1, -2, -5, -10]
                  }
                }
              }
            ]
          })
        ]));
  });

  test("getStockScanData returns list of StockScans", () async {
    List<StockScan> stockScans = await stockScanRepo.getStockScanData();

    expect(stockScans.length, 2);
    expect(stockScans[0].name, "Top gainers");
    expect(stockScans[0].criteria[0].type, "plain_text");
    expect(stockScans[1].tag, "Bullish");
    expect(stockScans[1].criteria.length, 1);
    expect(stockScans[1].criteria[0].type, "variable");
    expect(stockScans[1].criteria[0].variable?["\$1"]?["values"],
        [-3, -1, -2, -5, -10]);
  });
}
