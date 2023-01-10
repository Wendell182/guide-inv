import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/constants.dart';
import '../cubits/exchange_cubit.dart';
import '../cubits/state.dart';
import '../viewmodel/exchange_chart_viewmodel.dart';

class ExchangeChart extends StatefulWidget {
  const ExchangeChart({Key? key}) : super(key: key);

  @override
  State<ExchangeChart> createState() => _ExchangeChartState();
}

class _ExchangeChartState extends State<ExchangeChart> {
  @override
  Widget build(BuildContext context) {
    final viewModel = ExchangeChartViewmodel();

    return Scaffold(
      appBar: AppBar(title: const Text(Constants.chartAppBarTitle)),
      body: BlocBuilder<ExchangeCubit, ExchangeState>(
        builder: (context, state) {
          if (state is ExchangeLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ExchangeLoadedState) {
            final count = state.exchange.chart?.result?[0].indicators?.quote?[0]
                    ?.open?.length ??
                0;

            if (count > 0) {
              final exchangeTimestamp =
                  state.exchange.chart?.result?[0].timestamp;
              final quotes = state
                      .exchange.chart?.result?[0].indicators?.quote?[0]?.open ??
                  [];
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Variação do ativo: ${state.exchange.chart?.result?[0].meta?.symbol}',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black.withOpacity(.5),
                    ),
                  ),
                  const SizedBox(height: 42.0),
                  AspectRatio(
                    aspectRatio: 2,
                    child: LineChart(
                      viewModel.getChartData(
                          quotes: quotes, dates: exchangeTimestamp),
                      swapAnimationDuration: const Duration(milliseconds: 250),
                    ),
                  ),
                ],
              );
            } else {
              return const Center(child: Text(Constants.noDataMessage));
            }
          } else if (state is ExchangeErrorState) {
            return Center(
              child: Text(state.errorMessage),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
