import '../../domain/entities/exchange_entity.dart';

abstract class ExchangeDatasource {
  Future<ExchangeEntity> getExchange();
}
