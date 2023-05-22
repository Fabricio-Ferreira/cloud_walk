import 'package:equatable/equatable.dart';

abstract class ErrorApp extends Equatable implements Exception {
  final String message;

  const ErrorApp(this.message);

  @override
  List<Object> get props => [message];
}

class DeviceException extends ErrorApp {
  const DeviceException(String message) : super(message);
}

class CacheException extends ErrorApp {
  const CacheException(String message) : super(message);
}

class ServerFailure extends ErrorApp {
  const ServerFailure(String message) : super(message);
}

class DioFailure extends ErrorApp {
  const DioFailure(String message) : super(message);
}
