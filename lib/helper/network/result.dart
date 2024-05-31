enum ResultStatus {
  none,
  success,
  loading,
  error,
}

sealed class Result<T> {
  final ResultStatus status;
  final T? data;
  final String? message;

  const Result({
    required this.status,
    this.data,
    this.message,
  });
}

class NetworkSuccess<T> extends Result<T> {
  const NetworkSuccess({required T data})
      : super(status: ResultStatus.success, data: data);
}

class NetworkLoading<T> extends Result<T> {
  const NetworkLoading() : super(status: ResultStatus.loading);
}
class NetworkNone<T> extends Result<T> {
  const NetworkNone() : super(status: ResultStatus.none);
}

class NetworkError<T> extends Result<T> {
  const NetworkError({required String message})
      : super(status: ResultStatus.error, message: message);
}
