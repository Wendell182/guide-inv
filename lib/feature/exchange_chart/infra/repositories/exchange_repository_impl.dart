import '../../domain/entities/exchange_entity.dart';
import '../../domain/failures/failures.dart';
import '../../domain/repositories/exchange_repository.dart';
import '../datasources/exchange_datasource.dart';

class ExchangeRepositoryImpl implements ExchangeRepository {
  final ExchangeDatasource _datasource;

  ExchangeRepositoryImpl({
    required ExchangeDatasource datasource,
  }) : _datasource = datasource;

  @override
  Future<ExchangeEntity> getExchange() async {
    try {
      return await _datasource.getExchange();
    } on ExchangeFailure {
      rethrow;
    } catch (error, stackTrace) {
      throw UnknownExchangeFailure(
        stackTrace: stackTrace,
        label: 'ExchangeRepositoryImpl - getExchange',
      );
    }
  }
}
