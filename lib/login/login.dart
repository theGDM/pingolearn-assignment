import 'package:ecommerce/common/widgets/common_helper_widget.dart';
import 'package:ecommerce/signup/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
                  buildTextField(context, 'Email', false, (email) {}),
                  buildTextField(context, 'Password', true, (passowrd) {}),
                ],
              ),
            ),
            SizedBox(
              child: Column(
                children: [
                  buildSubmitButton(context, 'Login', false, () {}),
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
