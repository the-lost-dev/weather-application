import 'package:weather_app/exports.dart';

class AppException {
  final bool status;
  final String message;

  const AppException({this.status = false, required this.message});

  static const socketExceptionMsg = 'Please check your internet connection';

  static const defaultExceptionMsg =
      'Oops! An error occurred. Please try again';

  factory AppException.fromError(error) {
    print(error);

    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.receiveTimeout:
          return const AppException(
            message: AppException.socketExceptionMsg,
          );

        case DioExceptionType.badResponse:
          return const AppException(message: AppException.defaultExceptionMsg);
        case DioExceptionType.unknown:
        default:
          if (error is SocketException) {
            return const AppException(
              message: AppException.socketExceptionMsg,
            );
          } else if (error is FormatException) {
            return const AppException(
              message: AppException.defaultExceptionMsg,
            );
          } else if (error is HttpException) {
            return const AppException(
              message: AppException.defaultExceptionMsg,
            );
          } else {
            return const AppException(
              message: AppException.defaultExceptionMsg,
            );
          }
      }
    }

    if (error is AppException) return AppException(message: error.message);

    return const AppException(message: AppException.defaultExceptionMsg);
  }
}
