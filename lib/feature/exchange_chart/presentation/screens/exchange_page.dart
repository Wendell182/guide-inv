import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_inv/core/formatter/formatter.dart';
import 'package:guide_inv/feature/exchange_chart/presentation/widgets/exchange_tile.dart';
import 'package:guide_inv/feature/exchange_chart/presentation/widgets/row_title.dart';

import '../cubits/exchange_cubit.dart';
import '../cubits/state.dart';

class ExchangePage extends StatefulWidget {
  const ExchangePage({Key? key}) : super(key: key);

  @override
  State<ExchangePage> createState() => _ExchangePageState();
}

class _ExchangePageState extends State<ExchangePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Exchange')),
      body: BlocBuilder<ExchangeCubit, ExchangeState>(
        builder: (context, state) {
          if (state is ExchangeLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ExchangeLoadedState) {
            final count = state
                .exchange.chart?.result?[0].indicators?.quote?[0].open?.length;
            final countStamp =
                state.exchange.chart?.result?[0].timestamp?.length;
            final itemCount = count! > countStamp! ? count : countStamp;
            return ListView.builder(
              itemCount: itemCount,
              itemBuilder: (_, index) {
                double? exchangeOpen = 0;
                if (state.exchange.chart?.result?[0].indicators?.quote?[0]
                        .open?[index] ==
                    null) {
                  exchangeOpen = state.exchange.chart?.result?[0].indicators
                      ?.quote?[0].open?[index];
                }
                exchangeOpen = Doubles.safe(
                    old: state.exchange.chart?.result?[0].indicators?.quote?[0]
                        .open?[index],
                    defaultVal: 0);
                final exchangeTimestamp =
                    state.exchange.chart?.result?[0].timestamp?[index];
                return Column(
                  children: [
                    ExchangeTile(
                        day: itemCount.toString(),
                        date: parseDateInline(exchangeTimestamp ?? 0),
                        value: exchangeOpen,
                        variationD1: itemCount.toString(),
                        variationFirstDay: itemCount.toString()),
                  ],
                );
              },
            );
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
