import 'package:linkyou/core/base/api_base.dart';
import 'package:linkyou/core/responses/service_response.dart';
import 'package:linkyou/core/models/auth_change_email_input.dart';
import 'package:linkyou/core/models/auth_change_password_input.dart';
import 'package:linkyou/core/models/auth_forgot_input.dart';
import 'package:linkyou/core/models/auth_signin_input.dart';
import 'package:linkyou/core/models/auth_sign_up_input.dart';

class AuthService extends ApiBase {
  AuthService({required super.authProvider});

  Future<ServiceResponse<void>> changeEmail(AuthChangeEmailInput input) async {
    try {
      String url = '/auth/email';
      await post(url, body: input.toJson());
      return ServiceResponse(data: null, headers: {});
    } catch (e) {
      throw Exception('Error changing email: $e');
    }
  }

  Future<ServiceResponse<void>> changePassword(
      AuthChangePasswordInput input) async {
    try {
      String url = '/auth/password';
      await post(url, body: input.toJson());
      return ServiceResponse(data: null, headers: {});
    } catch (e) {
      throw Exception('Error changing password: $e');
    }
  }

  Future<ServiceResponse<void>> forgotPassword(AuthForgotInput input) async {
    try {
      String url = '/auth/forgot';
      await post(url, body: input.toJson());
      return ServiceResponse(data: null, headers: {});
    } catch (e) {
      throw Exception('Error processing password reset: $e');
    }
  }

  Future<ServiceResponse<Map<String, dynamic>>> signIn(
      AuthSigninInput input) async {
    try {
      String url = '/auth/signin';
      final response = await post(url, body: input.toJson());
      return ServiceResponse(
        data: Map<String, dynamic>.from(response.data),
        headers: response.headers.map,
      );
    } catch (e) {
      throw Exception('Error signing in: $e');
    }
  }

  Future<ServiceResponse<void>> signUp(AuthSignUpInput input) async {
    try {
      String url = '/auth/signup';
      await post(url, body: input.toJson());
      return ServiceResponse(data: null, headers: {});
    } catch (e) {
      throw Exception('Error signing up: $e');
    }
  }
}
