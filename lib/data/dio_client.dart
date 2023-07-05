import 'package:dio/dio.dart';
import 'package:movies_app/constants/endpoints.dart';

class DioClient {
  // dio instance
  final Dio _dio = Dio();

  // injecting dio instance
  DioClient() {
    _dio
      ..options.baseUrl = Endpoints.baseUrl
      ..options.connectTimeout = const Duration(seconds: 10000)
      ..options.receiveTimeout = const Duration(seconds: 10000)
      ..options.contentType = Headers.jsonContentType
      ..interceptors.addAll(
        [
          InterceptorsWrapper(onRequest: (RequestOptions options, RequestInterceptorHandler handler) async {
            options.headers.putIfAbsent('Authorization', () => "Bearer ${Endpoints.readToken}");

            return handler.next(options);
          }, onError: (DioException dioError, ErrorInterceptorHandler handler) async {
            return handler.next(dioError);
          }, onResponse: (Response response, ResponseInterceptorHandler handler) async {
            return handler.next(response);
          }),
        ],
      );
  }

  // Get:-----------------------------------------------------------------------
  Future<dynamic> get(
    String uri, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.get(
        uri,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response.data;
    } on DioError catch (e, stackTrace) {
      rethrow;
    }
  }

  // Post:----------------------------------------------------------------------
  Future<dynamic> post(
    String uri, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.post(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response.data;
    } on DioError catch (e, stackTrace) {
      rethrow;
    }
  }

  // Put:-----------------------------------------------------------------------
  Future<dynamic> put(
    String uri, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.put(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response.data;
    } on DioError catch (e, stackTrace) {
      rethrow;
    }
  }

  // Delete:--------------------------------------------------------------------
  Future<dynamic> delete(
    String uri, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.delete(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response.data;
    } on DioError catch (e, stackTrace) {
      rethrow;
    }
  }

  // Post Multipart:----------------------------------------------------------------------
  Future<dynamic> postMultiPart(String uri, {required FormData data}) async {
    try {
      // debugPrint("postMultiPart I");
      final Dio dio = Dio()
        ..options.baseUrl = _dio.options.baseUrl
        ..interceptors.addAll(_dio.interceptors);

      // print("postMultiPart II");
      final Response response = await dio.post(uri, data: data);

      // print("postMultiPart III");
      return response.data;
    } on DioError catch (e, stackTrace) {
      rethrow;
    }
  }
}
