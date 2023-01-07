import 'package:bloc/bloc.dart';

import '../../domain/failures/failures.dart';
import '../../domain/usecases/get_exchange.dart';
import 'state.dart';

class ExchangeCubit extends Cubit<ExchangeState> {
  final GetExchangeUsecase _usecase;

  ExchangeCubit({
    required GetExchangeUsecase usecase,
  })  : _usecase = usecase,
        super(ExchangeInitialState());

  Future<void> getExchange() async {
    emit(const ExchangeLoadingState());
    try {
      final result = await _usecase.call();
      emit(ExchangeLoadedState(exchange: result));
    } on ExchangeFailure catch (error) {
      emit(ExchangeErrorState(errorMessage: error.errorMessage));
    }
  }
}
