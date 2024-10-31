import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';
import '../../../network/api_client.dart';
import '../../../network/api_util.dart';
import '../../local/secure_storage_helper.dart';
import '../../models/object_response.dart';
import '../../models/user/users.dart';
import '../../models/user/user_body.dart';

abstract class AuthRepository {
  Future<ObjectResponse<Auth>> login(AuthBody body);
}

@singleton
class AuthRepositoryImpl extends AuthRepository {
  final ApiClient apiClient = ApiUtil.apiClient;

  @override
  Future<ObjectResponse<Auth>> login(AuthBody body) async {
    try {
      // Chuyển đổi body sang dạng Map để phù hợp với method login của ApiClient
      final Map<String, dynamic> loginBody = {
        'email': body.email,
        'password': body.password,
      };

      // Gọi API login
      final dynamic response = await apiClient.login(loginBody);

      // Kiểm tra và xử lý response
      if (response != null) {
        // Sử dụng fromJson của ObjectResponse với factory method fromJson của Auth
        final ObjectResponse<Auth> objectResponse = ObjectResponse.fromJson(
            response,
                (json) => Auth.fromJson(json as Map<String, dynamic>)
        );

        return objectResponse;
      } else {
        // Trả về response lỗi nếu response null
        return ObjectResponse(
            status: false,
            description: 'Login failed: No response from server'
        );
      }
    } on DioException catch (dioError) {
      // Xử lý các lỗi Dio cụ thể
      return ObjectResponse(
          status: false,
          description: dioError.response?.data['Description']
              ?? dioError.response?.data['description']
              ?? 'Login failed: Network error'
      );
    } catch (error) {
      // Xử lý các lỗi khác
      return ObjectResponse(
          status: false,
          description: 'Login error: ${error.toString()}'
      );
    }
  }
}

// Service sử dụng repository
class AuthService {
  final AuthRepository _authRepository;
  final SecureStorageHelper _secureStorageHelper;

  AuthService(this._authRepository, this._secureStorageHelper);

  Future<Auth?> login(String email, String password) async {
    // Tạo AuthBody với các thông tin tối thiểu
    final authBody = AuthBody(
      name: '', // Giá trị mặc định nếu không có
      email: email,
      password: password,
      gender: '', // Giá trị mặc định nếu không có
      birthDate: DateTime.now(), // Giá trị mặc định nếu không có
    );

    final response = await _authRepository.login(authBody);

    if (response.status == true && response.data != null) {
      // Lưu token
      if (response.data!.id.isNotEmpty) {
        _secureStorageHelper.saveToken(response.data!.id);
      }
      return response.data;
    } else {
      // Ném ra exception với mô tả lỗi từ server
      throw response.description ?? 'Login failed';
    }
  }
}