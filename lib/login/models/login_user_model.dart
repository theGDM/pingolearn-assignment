class LoginUser {
  final String email;
  final String password;
  final bool userLoggedin;

  LoginUser({
    required this.email,
    required this.password,
    this.userLoggedin = true,
  });

  LoginUser copyWith({
    String? email,
    String? password,
    bool? userLoggedin,
  }) =>
      LoginUser(
        email: email ?? this.email,
        password: password ?? this.password,
        userLoggedin: userLoggedin ?? this.userLoggedin,
      );

  @override
  String toString() => 'LoginUser(email: $email, password: $password, userLoggedin: $userLoggedin)';
}
