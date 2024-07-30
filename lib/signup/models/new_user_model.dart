class NewUser {
  final String name;
  final String email;
  final String password;
  final bool userPosted;

  NewUser({
    required this.name,
    required this.email,
    required this.password,
    this.userPosted = true,
  });

  NewUser copyWith({
    String? name,
    String? email,
    String? password,
    bool? userPosted,
  }) =>
      NewUser(
        name: name ?? this.name,
        email: email ?? this.email,
        password: password ?? this.password,
        userPosted: userPosted ?? this.userPosted,
      );

  @override
  String toString() => 'NewUser(name: $name, email: $email, password: $password, userPosted: $userPosted)';
}
