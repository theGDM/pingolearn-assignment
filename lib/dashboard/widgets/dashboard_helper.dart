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
          child: Image.network(
            imageUrl,
            height: 155.h,
            fit: BoxFit.cover,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\$$originalPrice',
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: const Color.fromARGB(255, 128, 128, 128),
                        fontStyle: FontStyle.italic,
                        fontSize: 13.sp,
                      ),
                ),
                Text(
                  '\$499',
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
