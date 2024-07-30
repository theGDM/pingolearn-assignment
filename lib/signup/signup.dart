import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/common/services/toast.dart';
import 'package:ecommerce/common/widgets/common_helper_widget.dart';
import 'package:ecommerce/dashboard/dashboard.dart';
import 'package:ecommerce/login/login.dart';
import 'package:ecommerce/signup/providers/new_user_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Signup extends ConsumerStatefulWidget {
  const Signup({super.key});

  @override
  ConsumerState<Signup> createState() => _SignupState();
}

class _SignupState extends ConsumerState<Signup> {
  Future<void> handleUserSignup() async {
    final userData = ref.read(newUserProvider);
    final auth = FirebaseAuth.instance;
    final firestore = FirebaseFirestore.instance;
    if (userData.name == '') {
      ToastFlutter().toast('Please enter the user name');
      return;
    }

    if (userData.email == '') {
      ToastFlutter().toast('Please enter the email');
      return;
    }

    if (userData.password == '') {
      ToastFlutter().toast('Please enter the password');
      return;
    }

    try {
      final nav = Navigator.of(context);
      ref.read(newUserProvider.notifier).updateUserPostedStatus(false);
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: userData.email,
        password: userData.password,
      );

      await firestore.collection('users').doc(userCredential.user!.uid).set({
        'name': userData.email,
        'email': userData.password,
      });

      if (userCredential.user != null) {
        ref.read(newUserProvider.notifier).updateUserPostedStatus(true);
        ref.invalidate(newUserProvider);
        nav.pushReplacement(
          MaterialPageRoute(
            builder: (context) => const Dashboard(),
          ),
        );
      }
    } on FirebaseAuthException catch (e) {
      ref.read(newUserProvider.notifier).updateUserPostedStatus(true);
      if (e.code == 'invalid-email') {
        ToastFlutter().toast('Invalid email format!');
      } else if (e.code == 'weak-password') {
        ToastFlutter().toast('The provided password is too weak, please try strong one!');
      } else if (e.code == 'email-already-in-use') {
        ToastFlutter().toast('The email address is already in use. please login!');
      } else {
        ToastFlutter().toast('Something went wrong! Please try again later.');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final userData = ref.watch(newUserProvider);
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
                  buildTextField(context, 'Name', false, (name) {
                    ref.read(newUserProvider.notifier).updateUserName(name);
                  }),
                  buildTextField(context, 'Email', false, (email) {
                    ref.read(newUserProvider.notifier).updateUserEmail(email);
                  }),
                  buildTextField(context, 'Password', true, (password) {
                    ref.read(newUserProvider.notifier).updateUserPassword(password);
                  }),
                ],
              ),
            ),
            SizedBox(
              child: Column(
                children: [
                  buildSubmitButton(
                    context,
                    'Signup',
                    userData.userPosted,
                    () => handleUserSignup(),
                  ),
                  SizedBox(height: 5.h),
                  buildBottomNavigation(context, "Already have an account? ", 'Login', () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => const Login(),
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
