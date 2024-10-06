import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../data/models/object_response.dart';
import '../data/models/token_entity.dart';
import '../shared/helpers/EnvParams.dart';
import 'api_client.dart';
import 'api_interceptors.dart';

mixin ApiUtil {
  static Dio? dio;

  static Dio getDio() {
    if (dio == null) {
      dio = Dio();
      dio!.options.connectTimeout = const Duration(milliseconds: 60000);
      if (EnvParams.referer.isNotEmpty) {
        dio!.options.headers['Referer'] = EnvParams.referer;
      }
      dio!.interceptors.add(ApiInterceptors());
      dio!.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        compact: false,
      ));
    }
    return dio!;
  }

  static ApiClient get apiClient {
    final apiClient = ApiClient(getDio(), baseUrl: EnvParams.baseUrl);
    return apiClient;
  }

  static Future<TokenEntity?> onRefreshToken(String? token) async {
    if (token == null) return null;
    final dio = Dio();
    dio.options.connectTimeout = const Duration(milliseconds: 60000);
    dio.options.headers['Authorization'] = "Bearer $token";
    dio.options.headers['connection'] = "keep-alive";
    dio.interceptors.add(PrettyDioLogger());
    final res = await dio.get('${EnvParams.baseUrl}/refresh-token');
    final value = res.data == null
        ? null
        : ObjectResponse<TokenEntity>.fromJson(
            res.data!,
            (json) => TokenEntity.fromJson(json as Map<String, dynamic>),
          );
    if (value != null && value.data != null) {
      return value.data;
    }
    return null;
  }
}
