class AuthChangeEmailInput {
  final String email;

  AuthChangeEmailInput({required this.email});

  Map<String, dynamic> toJson() {
    return {
      'email': email,
    };
  }
}