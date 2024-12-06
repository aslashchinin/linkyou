import 'package:linkyou/core/responses/repository_response.dart';
import 'package:linkyou/core/models/auth_change_email_input.dart';
import 'package:linkyou/core/models/auth_change_password_input.dart';
import 'package:linkyou/core/models/auth_forgot_input.dart';
import 'package:linkyou/core/models/auth_signin_input.dart';
import 'package:linkyou/core/models/auth_sign_up_input.dart';
import 'package:linkyou/core/models/login.dart';
import 'package:linkyou/core/base/repository_interface_base.dart';

abstract class AuthRepositoryInterface implements RepositoryInterfaceBase {
  Future<RepositoryResponse<void>> changeEmail(AuthChangeEmailInput input);
  Future<RepositoryResponse<void>> changePassword(
      AuthChangePasswordInput input);
  Future<RepositoryResponse<void>> forgotPassword(AuthForgotInput input);
  Future<RepositoryResponse<Login>> signIn(AuthSigninInput input);
  Future<RepositoryResponse<void>> signUp(AuthSignUpInput input);
}
