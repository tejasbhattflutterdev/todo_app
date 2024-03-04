import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:todo_app_example/app/api/api_rest.dart';

class ApiCall with REST {
  ApiCall._instance() {
    REST.dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90));
  }
  static ApiCall get instance => ApiCall._instance();
}
