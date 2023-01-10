import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/formatter/formatter.dart';
import '../cubits/exchange_cubit.dart';
import '../cubits/state.dart';
import '../viewmodel/exchange_page_viewmodel.dart';
import '../widgets/exchange_tile.dart';
import '../widgets/row_title.dart';

class ExchangePage extends StatefulWidget {
  const ExchangePage({
    Key? key,
  }) : super(key: key);

  @override
  State<ExchangePage> createState() => _ExchangePageState();
}

class _ExchangePageState extends State<ExchangePage> {
  final viewModel = ExchangeViewmodel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(Constants.exchangetAppBaTitle)),
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
              return Column(
                children: [
                  const RowTitle(),
                  Expanded(
                    child: ListView.builder(
                      itemCount: count,
                      itemBuilder: (_, index) {
                        final exchangeOpen = state.exchange.chart?.result?[0]
                                .indicators?.quote?[0]?.open?[index] ??
                            0.0;
                        final nextOpen = state.exchange.chart?.result?[0]
                                .indicators?.quote?[0]?.open?[index + 1] ??
                            0.0;
                        final firstDayValue = state.exchange.chart?.result?[0]
                                .indicators?.quote?[0]?.open?[0] ??
                            0.0;
                        final exchangeTimestamp =
                            state.exchange.chart?.result?[0].timestamp?[index];
                        return ExchangeTile(
                            day: index + 1,
                            date: parseDateInline(exchangeTimestamp ?? 0),
                            value: exchangeOpen,
                            variationD1: viewModel.parseVariationD1(
                                exchangeOpen, nextOpen),
                            variationFirstDay:
                                viewModel.parseVariationFromFirstDate(
                                    exchangeOpen, firstDayValue));
                      },
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
