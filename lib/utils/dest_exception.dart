/// DestException
class DestException implements Exception {
  DestException({this.error});

  dynamic error;

  StackTrace? _stackTrace;

  // ignore: unnecessary_getters_setters
  set stackTrace(StackTrace? stack) => _stackTrace = stack;

  // ignore: unnecessary_getters_setters
  StackTrace? get stackTrace => _stackTrace;

  String get message => (error?.toString() ?? '');

  @override
  String toString() {
    var msg = 'DestException : $message';
    if (_stackTrace != null) {
      msg += '\n$stackTrace';
    }
    return msg;
  }
}
