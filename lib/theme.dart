import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData appTheme = ThemeData(
  useMaterial3: true,
  textTheme: TextTheme(
    displayLarge: GoogleFonts.poppins(
      fontSize: 48.sp,
      fontWeight: FontWeight.bold,
    ),
    displayMedium: GoogleFonts.poppins(
      fontSize: 32.sp,
      fontWeight: FontWeight.bold,
    ),
    displaySmall: GoogleFonts.poppins(
      fontSize: 14.sp,
      fontWeight: FontWeight.bold,
    ),
    titleLarge: GoogleFonts.poppins(
      fontSize: 24.sp,
      fontStyle: FontStyle.normal,
    ),
    titleMedium: GoogleFonts.poppins(
      fontSize: 18.sp,
      fontStyle: FontStyle.normal,
    ),
    titleSmall: GoogleFonts.poppins(
      fontSize: 16.sp,
      fontStyle: FontStyle.normal,
    ),
  ),
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color.fromARGB(255, 245, 249, 253),
    brightness: Brightness.light,
    primary: const Color.fromARGB(255, 245, 249, 253),
    secondary: const Color.fromARGB(255, 12, 84, 190),
    onPrimary: Colors.white,
    onSecondary: const Color.fromARGB(255, 128, 122, 122),
    onTertiary: const Color.fromARGB(255, 228, 223, 223),
    background: const Color.fromARGB(255, 245, 249, 253),
  ),
  canvasColor: const Color.fromARGB(255, 245, 249, 253),
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.transparent,
    elevation: 0,
    centerTitle: true,
    toolbarHeight: 0,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  ),
  bottomSheetTheme: const BottomSheetThemeData(
    backgroundColor: Colors.white,
    surfaceTintColor: Colors.white,
  ),
);
