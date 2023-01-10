import 'package:dio/dio.dart';

import '../../domain/entities/exchange_entity.dart';
import '../../domain/failures/exception.dart';
import '../../infra/datasources/exchange_datasource.dart';

class ExchangeDatasourceImpl implements ExchangeDatasource {
  final Dio _http;
  static const URL =
      'https://query2.finance.yahoo.com/v8/finance/chart/PETR4.SA';

  ExchangeDatasourceImpl({required Dio http}) : _http = http;

  @override
  Future<ExchangeEntity> getExchange() async {
    final response = await _http.get(URL);
    if (response.statusCode == 200) {
      return ExchangeEntity.fromJson(response.data);
    }
    throw ApiException.fromResponse(response.data);
  }
}
