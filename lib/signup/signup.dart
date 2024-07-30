import 'package:ecommerce/common/widgets/common_helper_widget.dart';
import 'package:ecommerce/login/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
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
                buildHeadingText(context),
              ],
            ),
            SizedBox(
              child: Column(
                children: [
                  buildTextField(context, 'Name', false, (name) {}),
                  buildTextField(context, 'Email', false, (email) {}),
                  buildTextField(context, 'Password', true, (passowrd) {}),
                ],
              ),
            ),
            SizedBox(
              child: Column(
                children: [
                  buildSubmitButton(context, 'Signup', false, () {}),
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
