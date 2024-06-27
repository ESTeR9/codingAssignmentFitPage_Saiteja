import 'package:stock_scan_parser/network/endpoints/stock_scan_api.dart';
import 'package:stock_scan_parser/network/models/stock_scan_resp.dart';

abstract class StockScanRepo {
  Future<List<StockScan>> getStockScanData();
}

class StockScanRepoImpl implements StockScanRepo {
  final StockScanApi stockScanApi;

  StockScanRepoImpl({required this.stockScanApi});

  @override
  Future<List<StockScan>> getStockScanData() {
    return stockScanApi.getData();
  }
}
