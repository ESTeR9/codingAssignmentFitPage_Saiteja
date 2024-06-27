import 'package:flutter/material.dart';
import 'package:stock_scan_parser/presentation/stock_scan_home/widgets/horizontal_dotted_line_painter.dart';
import 'package:stock_scan_parser/util/color_utility.dart';

class StockScanWidget extends StatelessWidget {
  final String name;
  final String tag;
  final String color;
  final Function? onTap;

  const StockScanWidget(
      {super.key,
      required this.name,
      required this.tag,
      required this.color,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                textAlign: TextAlign.left,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(decoration: TextDecoration.underline),
              ),
              Text(
                tag,
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    decoration: TextDecoration.underline,
                    color: colorMap[color]),
              ),
            ],
          ),
          onTap: () {
            onTap?.call();
          },
        ),
        const SizedBox(
          height: 16,
        ),
        CustomPaint(
          size: const Size(double.infinity, 1),
          painter: HorizontalDottedLinePainter(),
        ),
      ],
    );
  }
}
