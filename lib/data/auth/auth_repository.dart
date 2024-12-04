import 'package:linkyou/data/auth/auth_repository_interface.dart';
import 'package:linkyou/data/auth/auth_service.dart';
import 'package:linkyou/core/responses/repository_response.dart';
import 'package:linkyou/core/models/auth_change_email_input.dart';
import 'package:linkyou/core/models/auth_change_password_input.dart';
import 'package:linkyou/core/models/auth_forgot_input.dart';
import 'package:linkyou/core/models/auth_signin_input.dart';
import 'package:linkyou/core/models/auth_sign_up_input.dart';
import 'package:linkyou/core/models/login.dart';
import 'package:linkyou/core/models/pagination_info.dart';

class AuthRepository implements AuthRepositoryInterface {
  final AuthService _authService;

  AuthRepository({required AuthService authService})
      : _authService = authService;

  @override
  Future<RepositoryResponse<void>> changeEmail(
      AuthChangeEmailInput input) async {
    try {
      await _authService.changeEmail(input);
      return RepositoryResponse(data: null);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<RepositoryResponse<void>> changePassword(
      AuthChangePasswordInput input) async {
    try {
      await _authService.changePassword(input);
      return RepositoryResponse(data: null);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<RepositoryResponse<void>> forgotPassword(AuthForgotInput input) async {
    try {
      await _authService.forgotPassword(input);
      return RepositoryResponse(data: null);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<RepositoryResponse<Login>> signIn(AuthSigninInput input) async {
    try {
      final serviceResponse = await _authService.signIn(input);
      final pagination = PaginationInfo.fromHeaders(serviceResponse.headers);

      return RepositoryResponse(
        data: Login.fromJson(serviceResponse.data),
        pagination: pagination,
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<RepositoryResponse<void>> signUp(AuthSignUpInput input) async {
    try {
      await _authService.signUp(input);
      return RepositoryResponse(data: null);
    } catch (e) {
      rethrow;
    }
  }
}
