class AuthForgotInput {
  final String email;

  AuthForgotInput({required this.email});

  Map<String, dynamic> toJson() {
    return {
      'email': email,
    };
  }
}
