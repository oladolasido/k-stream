import 'package:dio/dio.dart';
import 'package:kstream/utils/custom_log.dart';

class DioLogging extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    logInfo(
        "--> ${options.method.toUpperCase()} ${options.baseUrl}${options.path}");
    logInfo("Headers : ");
    options.headers.forEach((key, value) => logInfo("$key: $value"));
    logInfo("Content type : ${options.contentType}");
    if (options.data == null) {
      logInfo("Body : ${options.data}");
    }
    logInfo("<-- END HTTP");
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    logInfo(
        "<-- ${response.statusCode} ${response.requestOptions.baseUrl}${response.requestOptions.path}");
    logInfo("Headers:");
    response.headers.forEach((k, v) => logInfo('$k: $v'));
    logInfo("Response: ${response.data}");
    logInfo("<-- END HTTP");
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    logInfo(
        "<-- ${err.message} ${(err.response?.requestOptions != null ? ('${err.response?.requestOptions.baseUrl ?? ''}' '${err.response?.requestOptions.path ?? ''}') : 'URL')}");
    logInfo("${err.response != null ? err.response?.data : 'Unknown Error'}");
    logInfo("<-- End error");
    return super.onError(err, handler);
  }
}
