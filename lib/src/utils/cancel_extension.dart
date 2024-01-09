import 'package:weather_app/exports.dart';

extension CancelTokenExtension on Ref {
  /// creates a token to cancel API requests
  CancelToken cancelToken() {
    final token = CancelToken();
    onCancel(token.cancel);
    return token;
  }
}
