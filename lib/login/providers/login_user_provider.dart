import 'package:ecommerce/login/models/login_user_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginUserNotifier extends StateNotifier<LoginUser> {
  LoginUserNotifier()
      : super(
          LoginUser(email: '', password: ''),
        );

  void updateUserEmail(String email) {
    state = state.copyWith(email: email);
  }

  void updateUserPassword(String password) {
    state = state.copyWith(password: password);
  }

  void updateUserLoggedInStatus(bool status) {
    state = state.copyWith(userLoggedin: status);
  }
}

final loginUserProvider = StateNotifierProvider<LoginUserNotifier, LoginUser>(
  (ref) => LoginUserNotifier(),
);
