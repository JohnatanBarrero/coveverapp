import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class HttpManager {
  static final HttpManager _singleton = HttpManager._internal();
  factory HttpManager() {
    return _singleton;
  }

  HttpManager._internal();

  final Dio _genDio = Dio()
    ..interceptors.add(AppInterceptorGeneraLog().prettyDioLogger);

  Dio get genDio => _genDio;

  init({
    required String urlBase,
  }) {
    genDio.options.baseUrl = urlBase;
    genDio.options.headers = {
      Headers.contentTypeHeader: Headers.jsonContentType,
      Headers.acceptHeader: Headers.jsonContentType,
    };
  }
}

class AppInterceptorGeneraLog {
  final _prettyDioLogger = PrettyDioLogger(
    requestHeader: true,
    requestBody: true,
    responseBody: false,
    responseHeader: false,
    compact: false,
  );
  PrettyDioLogger get prettyDioLogger => _prettyDioLogger;
}
