import "package:dio/dio.dart";
import "package:retrofit/http.dart";

import "../models/stock_scan_resp.dart";

part "stock_scan_api.g.dart";

@RestApi()
abstract class StockScanApi {
  factory StockScanApi(Dio dio) = _StockScanApi;

  @GET("/data.json")
  Future<List<StockScan>> getData();
}
