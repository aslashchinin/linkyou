class AuthSigninInput {
  final String login;
  final String password;

  AuthSigninInput({required this.login, required this.password});

  Map<String, dynamic> toJson() {
    return {
      'login': login,
      'password': password,
    };
  }
}
