import 'package:ecommerce/common/services/toast.dart';
import 'package:ecommerce/common/widgets/common_helper_widget.dart';
import 'package:ecommerce/dashboard/dashboard.dart';
import 'package:ecommerce/login/providers/login_user_provider.dart';
import 'package:ecommerce/signup/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Login extends ConsumerStatefulWidget {
  const Login({super.key});

  @override
  ConsumerState<Login> createState() => _LoginState();
}

class _LoginState extends ConsumerState<Login> {
  Future<void> handleUserLogin() async {
    final loginData = ref.read(loginUserProvider);
    final auth = FirebaseAuth.instance;

    if (loginData.email == '') {
      ToastFlutter().toast('Please enter the email');
      return;
    }

    if (loginData.password == '') {
      ToastFlutter().toast('Please enter the password');
      return;
    }

    try {
      final nav = Navigator.of(context);
      ref.read(loginUserProvider.notifier).updateUserLoggedInStatus(false);
      final credential = await auth.signInWithEmailAndPassword(
        email: loginData.email,
        password: loginData.password,
      );

      if (credential.user == null) {
        ToastFlutter().toast('User does not exist!');
        ref.read(loginUserProvider.notifier).updateUserLoggedInStatus(true);
        return;
      }

      var user = credential.user;
      if (user != null) {
        ref.read(loginUserProvider.notifier).updateUserLoggedInStatus(true);
        ref.invalidate(loginUserProvider);
        nav.pushReplacement(
          MaterialPageRoute(
            builder: (context) => const Dashboard(),
          ),
        );
      } else {
        ref.read(loginUserProvider.notifier).updateUserLoggedInStatus(true);
        ToastFlutter().toast('Not a existing user, please signup!');
        return;
      }
    } on FirebaseAuthException catch (e) {
      ref.read(loginUserProvider.notifier).updateUserLoggedInStatus(true);
      if (e.code == 'invalid-email') {
        ToastFlutter().toast('Invalid email format!');
      } else if (e.code == 'weak-password') {
        ToastFlutter().toast('The provided password is too weak, please try strong one!');
      } else if (e.code == 'email-already-in-use') {
        ToastFlutter().toast('The email address is already in use!');
      } else {
        ToastFlutter().toast('Something went wrong! Please try again later.');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final loginData = ref.watch(loginUserProvider);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        systemOverlayStyle: Theme.of(context).appBarTheme.systemOverlayStyle!.copyWith(
              statusBarColor: Theme.of(context).colorScheme.primary,
              statusBarIconBrightness: Brightness.dark,
              systemNavigationBarColor: Theme.of(context).colorScheme.primary,
            ),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 16.w, left: 16.w, right: 16.w, bottom: 16.h),
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                buildHeadingText(context, Theme.of(context).colorScheme.secondary),
              ],
            ),
            SizedBox(
              child: Column(
                children: [
                  buildTextField(context, 'Email', false, (email) {
                    ref.read(loginUserProvider.notifier).updateUserEmail(email);
                  }),
                  buildTextField(context, 'Password', true, (password) {
                    ref.read(loginUserProvider.notifier).updateUserPassword(password);
                  }),
                ],
              ),
            ),
            SizedBox(
              child: Column(
                children: [
                  buildSubmitButton(
                    context,
                    'Login',
                    loginData.userLoggedin,
                    () => handleUserLogin(),
                  ),
                  SizedBox(height: 5.h),
                  buildBottomNavigation(context, "New Here? ", 'Signup', () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => const Signup(),
                      ),
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
