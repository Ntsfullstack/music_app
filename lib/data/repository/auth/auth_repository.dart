import 'package:injectable/injectable.dart';
import 'package:spotify/data/models/user/user_body.dart';
import '../../../network/api_client.dart';
import '../../models/object_response.dart';
import '../../models/user/users.dart';

abstract class AuthRepository {
  Future<ObjectResponse<Auth>> login(AuthBody body);
}

@singleton
class AuthRepositoryImpl extends AuthRepository {
  final ApiClient apiClient;

  AuthRepositoryImpl(this.apiClient);

  @override
  Future<ObjectResponse<Auth>> login(AuthBody body) async {
    try {
      final response = await apiClient.login(body.toJson());
      final authData = Auth.fromJson(response);
      return ObjectResponse<Auth>(
        data: authData,
      );
    } catch (e) {
      return ObjectResponse<Auth>(
        data: null,
      );
    }
  }
}