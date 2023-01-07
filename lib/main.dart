import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_inv/core/service_locator/service_locator.dart';
import 'package:guide_inv/feature/exchange_chart/presentation/cubits/exchange_cubit.dart';
import 'package:guide_inv/feature/exchange_chart/presentation/screens/exchange_page.dart';

void main() {
  initServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (_) => getIt<ExchangeCubit>()..getExchange(),
        child: const ExchangePage(),
      ),
    );
  }
}
