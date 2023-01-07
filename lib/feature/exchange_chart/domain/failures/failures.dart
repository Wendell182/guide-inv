import 'package:guide_inv/core/failures/failure.dart';

abstract class ExchangeFailure extends Failure {
  ExchangeFailure({
    String errorMessage = '',
    StackTrace? stackTrace,
    String? label,
  }) : super(errorMessage: errorMessage, stackTrace: stackTrace, label: label);
}

class UnknownExchangeFailure extends ExchangeFailure {
  UnknownExchangeFailure({
    String errorMessage = 'Ocorreu um erro inesperado, tente novamente.',
    StackTrace? stackTrace,
    String? label,
  }) : super(
          errorMessage: errorMessage,
          stackTrace: stackTrace,
          label: label,
        );
}
