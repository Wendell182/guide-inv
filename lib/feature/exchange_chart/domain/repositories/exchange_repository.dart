import '../entities/exchange_entity.dart';

abstract class ExchangeRepository {
  Future<ExchangeEntity> getExchange();
}
