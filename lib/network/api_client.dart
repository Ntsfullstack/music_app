import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';
import 'package:spotify/data/models/user/users.dart';

part 'api_client.g.dart';

@RestApi()
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @POST("/api/v1/login")
  Future<Map<String, dynamic>> login(@Body() Map<String, dynamic> loginData);
}