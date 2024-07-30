import 'package:ecommerce/signup/models/new_user_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NewUserNotifier extends StateNotifier<NewUser> {
  NewUserNotifier()
      : super(
          NewUser(
            name: '',
            email: '',
            password: '',
          ),
        );

  void updateUserName(String name) {
    state = state.copyWith(name: name);
  }

  void updateUserEmail(String email) {
    state = state.copyWith(email: email);
  }

  void updateUserPassword(String password) {
    state = state.copyWith(password: password);
  }

  void updateUserPostedStatus(bool status) {
    state = state.copyWith(userPosted: status);
  }
}

final newUserProvider = StateNotifierProvider<NewUserNotifier, NewUser>(
  (ref) => NewUserNotifier(),
);
