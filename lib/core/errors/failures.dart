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
  ServerFailure(super.message, [super.stackTrace]);
}

/// Ağ Connection Errors
class NetworkFailure extends Failure {
  NetworkFailure(super.message, [super.stackTrace]);
}

/// Auth Errors
class AuthFailure extends Failure {
  AuthFailure(super.message, [super.stackTrace]);
}

/// Unknown Errors
class UnknownFailure extends Failure {
  UnknownFailure(String message, [StackTrace? stackTrace]) : super("⚠️ Unknown Error: $message", stackTrace);
}
