enum ResultStatus {
  none,
  success,
  loading,
  error,
}

sealed class Result<T> {
  final ResultStatus status;
  final T? value;
  final String? message;

  const Result({
    required this.status,
    this.value,
    this.message,
  });
}

class DataSuccess<T> extends Result<T> {
  const DataSuccess({required T data})
      : super(status: ResultStatus.success, value: data);
}

class Loading<T> extends Result<T> {
  const Loading() : super(status: ResultStatus.loading);
}

class NoData<T> extends Result<T> {
  const NoData() : super(status: ResultStatus.none);
}

class DataError<T> extends Result<T> {
  const DataError({required String message})
      : super(status: ResultStatus.error, message: message);
}
