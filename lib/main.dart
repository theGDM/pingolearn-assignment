import 'package:ecommerce/dashboard/dashboard.dart';
import 'package:ecommerce/signup/signup.dart';
import 'package:ecommerce/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    return ScreenUtilInit(
      builder: (context, child) => MaterialApp(
        title: 'Pingolearn Ecommerce Website',
        debugShowCheckedModeBanner: false,
        theme: appTheme,
        home: user != null ? const Signup() : const Dashboard(),
      ),
    );
  }
}
