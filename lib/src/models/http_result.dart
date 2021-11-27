class HttpResult {
  int code;
  bool success;
  var result;

  HttpResult({
    required this.code,
    required this.success,
    required this.result,
  });
}
