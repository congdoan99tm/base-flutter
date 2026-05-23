sealed class Result<T, E> {
  const Result();

  R when<R>({
    required R Function(T data) success,
    required R Function(E error) failure,
  }) {
    return switch (this) {
      Success<T, E>(data: final data) => success(data),
      Error<T, E>(error: final error) => failure(error),
    };
  }
}

final class Success<T, E> extends Result<T, E> {
  const Success(this.data);

  final T data;
}

final class Error<T, E> extends Result<T, E> {
  const Error(this.error);

  final E error;
}
