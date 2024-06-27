import "package:dio/dio.dart";
import "package:stock_scan_parser/config/app_config.dart";

class DioClient {
  static DioClient? _dioClient;
  static late Dio _dio;
  late bool isNewAuthInterceptorEnabled = false;

  factory DioClient() {
    _dioClient ??= DioClient._internal();
    return _dioClient!;
  }

  DioClient._internal() {
    _dio = Dio(
      BaseOptions(
        baseUrl: AppConfig.baseUrl,
        connectTimeout: const Duration(milliseconds: AppConfig.connectTimeout),
        receiveTimeout: const Duration(milliseconds: AppConfig.receiveTimeout),
      ),
    );
  }

  Dio get dio => _dio;

  void dispose() {
    _dio.close();
  }
}
