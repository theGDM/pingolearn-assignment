import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget buildProductCard(
  BuildContext context,
  String title,
  String description,
  double originalPrice,
  double discountPercentage,
  String imageUrl,
) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10.r),
    ),
    padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10.r),
          child: CachedNetworkImage(
            imageUrl: imageUrl,
            height: 155.h,
            fit: BoxFit.cover,
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                  ),
              maxLines: 1,
              overflow: TextOverflow.clip,
            ),
            SizedBox(height: 4.h),
            Text(
              description,
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Colors.black,
                  ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 8.h),
            Wrap(
              spacing: 5.w,
              children: [
                Text(
                  '\$$originalPrice',
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: const Color.fromARGB(255, 128, 128, 128),
                        fontStyle: FontStyle.italic,
                        fontSize: 13.sp,
                        decoration: TextDecoration.lineThrough,
                      ),
                ),
                Text(
                  '\$${(originalPrice - originalPrice * discountPercentage * 0.01).toStringAsFixed(2)}',
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: Colors.black,
                        fontStyle: FontStyle.italic,
                        fontSize: 13.sp,
                      ),
                ),
                Text(
                  '${discountPercentage.toStringAsFixed(2)}% off',
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: const Color.fromARGB(255, 21, 249, 17),
                        fontStyle: FontStyle.italic,
                        fontSize: 13.sp,
                      ),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  );
}

Widget buildSearchField(BuildContext context, void Function(String value) func) {
  return Container(
    margin: EdgeInsets.only(bottom: 10.h),
    height: 35.h,
    child: TextFormField(
      onChanged: (value) => func(value),
      cursorColor: Theme.of(context).colorScheme.secondary,
      enableSuggestions: false,
      autocorrect: false,
      decoration: InputDecoration(
        hintText: 'Search products',
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
