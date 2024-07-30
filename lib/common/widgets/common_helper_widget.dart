import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget buildHeadingText(BuildContext context) {
  return Text(
    'e-shops',
    style: Theme.of(context).textTheme.titleLarge!.copyWith(
          color: Theme.of(context).colorScheme.secondary,
          fontWeight: FontWeight.w700,
        ),
  );
}

Widget buildTextField(BuildContext context, String hintText, bool isPassword, void Function(String value) func) {
  return Container(
    margin: EdgeInsets.only(bottom: 10.h),
    height: 35.h,
    child: TextFormField(
      onChanged: (value) => func(value),
      cursorColor: Theme.of(context).colorScheme.secondary,
      enableSuggestions: false,
      autocorrect: false,
      obscureText: isPassword,
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.transparent,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(10.r),
          ),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
        counterText: '',
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.transparent,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(10.r),
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.transparent,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(10.r),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.transparent,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(10.r),
          ),
        ),
        hintStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
              color: Theme.of(context).colorScheme.onSecondary,
              fontSize: 15.sp,
            ),
      ),
      style: Theme.of(context).textTheme.titleSmall!.copyWith(
            color: Theme.of(context).colorScheme.onSecondary,
            fontSize: 15.sp,
          ),
    ),
  );
}

Widget buildSubmitButton(BuildContext context, String title, bool dataPosted, void Function() func) {
  return GestureDetector(
    onTap: () => func(),
    child: Container(
      width: 231.w,
      height: 49.h,
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      margin: EdgeInsets.only(bottom: 8.h),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.all(
          Radius.circular(10.r),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold,
                  fontSize: 15.sp,
                ),
          ),
        ],
      ),
    ),
  );
}

Widget buildBottomNavigation(BuildContext context, String title, String subTitle, void Function() func) {
  return GestureDetector(
    onTap: () => func(),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: Theme.of(context).colorScheme.onSecondary,
                fontWeight: FontWeight.normal,
                fontSize: 16.sp,
              ),
        ),
        Text(
          subTitle,
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: Theme.of(context).colorScheme.secondary,
                fontWeight: FontWeight.w800,
              ),
        ),
      ],
    ),
  );
}
