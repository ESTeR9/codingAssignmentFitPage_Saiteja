import 'package:flutter/material.dart';

import '../../language/locale_text.dart';
import '../stock_scan_home/widgets/horizontal_dotted_line_painter.dart';

class ValueVariablePage extends StatelessWidget {
  final List<num> values;

  const ValueVariablePage({super.key, required this.values});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            LocaleTextFetcher.getText("value_variable_page_app_bar_title") ??
                ""),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, top: 16, right: 16),
        child: Container(
          color: Theme.of(context).primaryColor,
          padding:
              const EdgeInsets.only(left: 16, top: 40, right: 16, bottom: 16),
          child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: values.length,
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      values[index].toString(),
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const SizedBox(height: 8),
                    CustomPaint(
                      size: const Size(double.infinity, 1),
                      painter: HorizontalDottedLinePainter(),
                    ),
                    index != (values.length - 1)
                        ? const SizedBox(height: 8)
                        : const SizedBox(),
                  ],
                );
              }),
        ),
      ),
    );
  }
}
