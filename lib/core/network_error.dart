class CustomDioError implements Exception {
  final String errorMessage;
  final int code;
  CustomDioError(this.errorMessage, {this.code = 400});

  @override
  String toString() => errorMessage;
}
