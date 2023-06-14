class ResponseModel<T> {
  final bool _isSuccess;
  final int? _code;

  final String? _message;
  final String? _error;
  T? data;

  ResponseModel(
      this._isSuccess,
      this._code,

      this._message, {
        this.data,
        String? error,
      }) : _error = error;

  int? get code => _code;
  String? get message => _message;

  String? get error => _error;

  bool get isSuccess => _isSuccess;
// dynamic get data => data;

}
