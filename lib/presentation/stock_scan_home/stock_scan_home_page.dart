import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dotted_separator/dotted_separator.dart';

import 'package:stock_scan_parser/cubit/stock_scan_cubit.dart';
import 'package:stock_scan_parser/cubit/stock_scan_state.dart';
import 'package:stock_scan_parser/network/core/client.dart';
import 'package:stock_scan_parser/presentation/stock_scan_home/widgets/stock_scan_widget.dart';
import 'package:stock_scan_parser/repository/stock_scan_repo.dart';
import '../../network/endpoints/stock_scan_api.dart';
import '../../network/models/stock_scan_resp.dart';
import '../stock_scan_criteria/stock_scan_criteria_page.dart';

class StockScanHomePage extends StatefulWidget {
  final StockScanCubit _cubit;

  StockScanHomePage({super.key, required this.title})
      : _cubit = StockScanCubit(
            stockScanRepo:
                StockScanRepoImpl(stockScanApi: StockScanApi(DioClient().dio)));

  final String title;

  @override
  State<StockScanHomePage> createState() => _StockScanHomePageState();
}

class _StockScanHomePageState extends State<StockScanHomePage> {
  @override
  void initState() {
    super.initState();
    widget._cubit.fetchStockScans();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, top: 16, right: 16),
        child: BlocBuilder(
            bloc: widget._cubit,
            buildWhen: (StockScanPageState previousState,
                StockScanPageState currentState) {
              return currentState is StockScanPageLoadingState ||
                  currentState is StockScanPageLoadedState;
            },
            builder: (context, state) {
              return (state is StockScanPageLoadedState)
                  ? Container(
                      color: Theme.of(context).primaryColor,
                      padding: const EdgeInsets.only(
                          left: 16, top: 40, right: 16, bottom: 16),
                      child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: widget._cubit.stockScans.length,
                          itemBuilder: (context, index) {
                            StockScan stockScan =
                                widget._cubit.stockScans[index];
                            return Column(
                              children: [
                                StockScanWidget(
                                  name: stockScan.name,
                                  tag: stockScan.tag,
                                  color: stockScan.color,
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              StockScanCriteriaPage(
                                                stockScan: stockScan,
                                              )),
                                    );
                                  },
                                ),
                                index != (widget._cubit.stockScans.length - 1)
                                    ? const SizedBox(height: 16)
                                    : const SizedBox(),
                              ],
                            );
                          }),
                    )
                  : Center(
                      child: CircularProgressIndicator(
                        color: Theme.of(context).primaryColor,
                      ),
                    );
            }),
      ),
    );
  }
}
