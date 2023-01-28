class ResponseBase {
  final int _statusCode;

  ResponseBase(this._statusCode);

  int get statusCode => _statusCode;
}