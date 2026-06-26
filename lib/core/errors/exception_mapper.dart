import 'package:fruit_hub/core/errors/exceptions.dart';
import 'package:fruit_hub/core/errors/failure.dart';

extension AppExceptionMapper on AppException {
  Failure toFailure() {
    switch (this) {
      case NetworkException():
        return NetworkFailure(message: message);

      case ValidationException():
        return ValidationFailure(
          message: message,
          errors: (this as ValidationException).errors,
        );

      case UnauthorizedException():
        return UnauthorizedFailure(message: message);

      case ForbiddenException():
        return ForbiddenFailure(message: message);

      case NotFoundException():
        return NotFoundFailure(message: message);

      case CacheException():
        return CacheFailure(message: message);

      case TimeoutException():
        return TimeoutFailure(message: message);

      case ServerException():
        return ServerFailure(message: message, code: statusCode);

      default:
        return UnknownFailure(message: message);
    }
  }
}
