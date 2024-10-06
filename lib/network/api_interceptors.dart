import 'package:dio/dio.dart';

import '../data/local/secure_storage_helper.dart';
import '../shared/utils/log_util.dart';
import 'api_util.dart';

class ApiInterceptors extends QueuedInterceptorsWrapper {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final token = await SecureStorageHelper.instance.getToken();

    if(options.path == '/admin/Device/Register') {
      options.headers.remove('Content-Length');
    }

    if (token != null) {
      options.headers['Authorization'] = 'Bearer ${token}';
    }
    options.headers.remove('Content-Length');
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    //Handle section expired without refresh token
    // if (response.statusCode == 401) {
    //   _forceSignIn();
    // }
    super.onResponse(response, handler);
  }

  @override
  Future<void> onError(DioException err, ErrorInterceptorHandler handler) async {
    final statusCode = err.response?.statusCode;
    final path = err.requestOptions.path;
    final uri = err.requestOptions.uri;
    final RequestOptions request = err.requestOptions;
    logger.e(
        "⚠️ ERROR[$statusCode] => PATH: $path \n Response: ${err.response?.data}");
    print('status code ${statusCode}');
    switch (statusCode) {
      case 401:
        final savedToken = await SecureStorageHelper.instance.getToken();
        String requestingTokens = err.requestOptions.headers['Authorization']
            .toString()
            .replaceFirst("Bearer ", "");
        //Handle following request with old token
        if (savedToken != null && savedToken != requestingTokens) {
          //Clone request with new token
          final cloneReq = await _cloneRequest(
            accessToken: savedToken ,
            request: request,
            uri: uri,
          );
          return handler.resolve(cloneReq);
        }
        //Don't have savedToken => return error
        if (savedToken == null) {
          return handler.next(err);
        }
        //Refresh token in first request
        try {
          final result = await ApiUtil.onRefreshToken("savedToken");
          if (result != null) {
            //Refresh success => clone current request
            SecureStorageHelper.instance.saveToken(result.accessToken??"");
            final cloneReq = await _cloneRequest(
              accessToken: result.accessToken??"",
              request: request,
              uri: uri,
            );
            return handler.resolve(cloneReq);
          } else {
            //Refresh failure => force login
            logger.e("Response refresh token is null");
            _forceSignIn();
            return handler.next(err);
          }
        } catch (e) {
          //Refresh failure => force login
          logger.e(
              "Api refresh token error $e, msg: ${(e as DioException).response}");
          _forceSignIn();
          return handler.next(err);
        }
      case 404:
        return handler.reject(err);
      default:
        handler.next(err);
    }
  }

  Future<Response> _cloneRequest({
    required String accessToken,
    required RequestOptions request,
    required Uri uri,
  }) async {
    final newOptions = Options(
      method: request.method,
      headers: request.headers,
    );
    newOptions.headers!['Authorization'] = 'Bearer $accessToken';
    return await ApiUtil.getDio().requestUri(
      uri,
      options: newOptions,
      data: request.data,
    );
  }

  void _forceSignIn() {
    //Clear session
    SecureStorageHelper.instance.removeToken();
    //Open sign-in page
    // while (GoRouter.of(AppRouter.navigationKey.currentContext!).canPop()) {
    //   GoRouter.of(AppRouter.navigationKey.currentContext!).pop();
    // }
    // GoRouter.of(AppRouter.navigationKey.currentContext!)
    //     .pushReplacementNamed(AppRouter.signIn);
  }
}
