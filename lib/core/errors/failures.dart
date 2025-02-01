abstract class Failure {
  final String message;
  final StackTrace? stackTrace;

  Failure(this.message, [this.stackTrace]);

  @override
  String toString() {
    return "$message\nStackTrace: $stackTrace";
  }
}

/// API Errors
class ServerFailure extends Failure {
  ServerFailure(String message, [StackTrace? stackTrace]) : super(message, stackTrace);
}

/// Ağ Connection Errors
class NetworkFailure extends Failure {
  NetworkFailure(String message, [StackTrace? stackTrace]) : super(message, stackTrace);
}

/// Auth Errors
class AuthFailure extends Failure {
  AuthFailure(String message, [StackTrace? stackTrace]) : super(message, stackTrace);
}

/// Unknown Errors
class UnknownFailure extends Failure {
  UnknownFailure(String message, [StackTrace? stackTrace]) : super("⚠️ Unknown Error: $message", stackTrace);
}
