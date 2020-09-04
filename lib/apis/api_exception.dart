class ApiException implements Exception {
  String errorMsg = "Server not respond";

  ApiException(String error) {
    this.errorMsg = error ?? "Server not respond";
  }
}