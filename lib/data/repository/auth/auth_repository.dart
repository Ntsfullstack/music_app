import 'package:injectable/injectable.dart';
import 'package:spotify/data/models/user/user_body.dart';
import '../../../network/api_client.dart';
import '../../../network/api_util.dart';
import '../../models/object_response.dart';
import '../../models/user/users.dart';

abstract class AuthRepository {
  Future<ObjectResponse<Auth>> login(AuthBody body);
}

@singleton
class AuthRepositoryImpl extends AuthRepository {
  ApiClient apiClient = ApiUtil.apiClient;
  @override
  Future<ObjectResponse<Auth>> login(AuthBody body) async {
    try {
      final res = await apiClient.login(body.toJson());
      return res;
    } catch (e) {
      rethrow;
    }
  }
}