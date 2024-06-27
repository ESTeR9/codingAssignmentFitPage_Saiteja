import 'package:flutter/material.dart';
import 'package:stock_scan_parser/presentation/stock_scan_home/stock_scan_home_page.dart';

import 'language/locale_text.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const StockScanApp());
}

class StockScanApp extends StatelessWidget {
  const StockScanApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Stock Scans",
      theme: ThemeData(
        primaryColor: const Color(0xFF01131B),
        secondaryHeaderColor: const Color(0xFF1686B0),
        cardColor: Colors.white,
        //ToDo: add text themes
        textTheme: const TextTheme(
          bodyLarge: TextStyle(fontSize: 18, color: Colors.white),
          bodySmall: TextStyle(fontSize: 10, color: Colors.white),
        ),
      ),
      home: StockScanHomePage(
          title: LocaleTextFetcher.getText("app_bar_title") ?? ""),
    );
  }
}
