import '../entities/exchange_entity.dart';
import '../repositories/exchange_repository.dart';

abstract class GetExchangeUsecase {
  Future<ExchangeEntity> call();
}

class GetExchangeUsecaseImpl implements GetExchangeUsecase {
  final ExchangeRepository _repository;

  GetExchangeUsecaseImpl({
    required ExchangeRepository repository,
  }) : _repository = repository;

  @override
  Future<ExchangeEntity> call() async {
    return await _repository.getExchange();
  }
}
