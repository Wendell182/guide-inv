import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import '../../feature/exchange_chart/domain/repositories/exchange_repository.dart';
import '../../feature/exchange_chart/domain/usecases/get_exchange.dart';
import '../../feature/exchange_chart/external/datasource/exchange_datasource_impl.dart';
import '../../feature/exchange_chart/infra/datasources/exchange_datasource.dart';
import '../../feature/exchange_chart/infra/repositories/exchange_repository_impl.dart';
import '../../feature/exchange_chart/presentation/cubits/exchange_cubit.dart';
import 'package:http/http.dart';

final getIt = GetIt.instance;

void initServiceLocator() {
  getIt.registerFactory<Dio>(
    () => Dio(),
  );

  getIt.registerSingleton<ExchangeDatasource>(ExchangeDatasourceImpl(
    http: getIt(),
  ));

  getIt.registerSingleton<ExchangeRepository>(
      ExchangeRepositoryImpl(datasource: getIt()));

  getIt.registerSingleton<GetExchangeUsecase>(
      GetExchangeUsecaseImpl(repository: getIt()));

  getIt.registerFactory<ExchangeCubit>(() => ExchangeCubit(usecase: getIt()));
}
