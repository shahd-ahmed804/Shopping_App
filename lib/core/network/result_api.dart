sealed class ResultApi<T> {}

class SuccessApi<T> extends ResultApi<T> {
   SuccessApi(this.data);
   final T? data;
}

class ErrorApi<T> extends ResultApi<T> {
   ErrorApi(this.errorMessage);
  final String errorMessage;
}