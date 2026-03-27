/// Base class for all application failures.
abstract class Failure {
  const Failure({required this.message});
  final String message;

  @override
  String toString() => 'Failure(message: $message)';
}

/// Failure caused by network/server errors.
class ServerFailure extends Failure {
  const ServerFailure({required super.message, this.statusCode});
  final int? statusCode;
}

/// Failure caused by no internet connection.
class NetworkFailure extends Failure {
  const NetworkFailure() : super(message: 'No internet connection');
}

/// Failure caused by local cache issues.
class CacheFailure extends Failure {
  const CacheFailure({required super.message});
}

/// Failure caused by unexpected errors.
class UnknownFailure extends Failure {
  const UnknownFailure({required super.message});
}
