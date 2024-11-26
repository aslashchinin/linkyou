class AuthChangePasswordInput {
  final String currentPassword;
  final String newPassword;
  final String passwordConfirm;

  AuthChangePasswordInput({
    required this.currentPassword,
    required this.newPassword,
    required this.passwordConfirm,
  });

  Map<String, dynamic> toJson() {
    return {
      'current': currentPassword,
      'password': newPassword,
      'password_confirm': passwordConfirm,
    };
  }
}
