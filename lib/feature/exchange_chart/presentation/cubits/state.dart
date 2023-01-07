import '../../domain/entities/exchange_entity.dart';

abstract class ExchangeState {
  const ExchangeState();
}

class ExchangeInitialState extends ExchangeState {}

class ExchangeLoadingState extends ExchangeState {
  const ExchangeLoadingState();
}

class ExchangeLoadedState extends ExchangeState {
  final ExchangeEntity exchange;

  ExchangeLoadedState({required this.exchange});
}

class ExchangeErrorState extends ExchangeState {
  final String errorMessage;

  ExchangeErrorState({required this.errorMessage});
}
