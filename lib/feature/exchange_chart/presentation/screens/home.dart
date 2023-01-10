import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/di/service_locator.dart';
import '../cubits/exchange_cubit.dart';
import 'exchange_chart.dart';
import 'exchange_page.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(Constants.homeAppBarTitle)),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.monetization_on, size: 42, color: Constants.blueLight),
              Text('PET4.SA',
                  style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.bold,
                      color: Constants.blueLight)),
            ],
          ),
          const SizedBox(height: 42.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => BlocProvider(
                              create: (context) =>
                                  getIt<ExchangeCubit>()..getExchange(),
                              child: const ExchangeChart(),
                            )));
                  },
                  child: const Text('Gráfico')),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => BlocProvider(
                              create: (context) =>
                                  getIt<ExchangeCubit>()..getExchange(),
                              child: const ExchangePage(),
                            )));
                  },
                  child: const Text('Tabela')),
            ],
          ),
        ],
      ),
    );
  }
}
