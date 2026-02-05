import 'package:convo_pro/configs/configs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FeaturedCoursesVertical extends StatelessWidget {
  final String image;
  final String title;
  final String duration;
  final String rating;
  final int noOfReviews;
  final VoidCallback? onTap; //missing onTap

  const FeaturedCoursesVertical({
    super.key,
    required this.image,
    required this.title,
    required this.duration,
    required this.rating,
    required this.noOfReviews,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    App.init(context);

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.translucent,
      child: Container(
        padding: Space.all(10),
        decoration: BoxDecoration(
          color: AppTheme.c.white,
          borderRadius: UIProps.buttonRadius,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// 🔹 Image
            ClipRRect(
              borderRadius: BorderRadius.circular(6.r),
              child: Image.asset(
                image,
                width: double.infinity,
                fit: BoxFit.cover,
                height: 121.h, //missing height
              ),
            ),

            Space.yf(10),

            /// 🔹 Content
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Title + Arrow
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(title, style: AppText.inter.b2?.w(6)),
                    Space.xm!,

                    /// Arrow Button
                    Container(
                      height: 28.h,
                      width: 28.h,
                      decoration: BoxDecoration(
                        color: AppTheme.c.primary.shade100,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: SvgPicture.asset(
                          'assets/svgs/arrow_right3.svg',
                          width: 16.w,
                          height: 16.h,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ],
                ),

                Space.yf(10),

                /// Rating + Duration
                Row(
                  children: [
                    Text(
                      duration,
                      style: AppText.inter.l1!.cl(AppTheme.c.text.main!),
                    ),

                    Space.xm!,

                    SvgPicture.asset(
                      'assets/svgs/star_rounded.svg',
                      width: 15.w,
                      height: 15.h,
                    ),

                    Space.xf(5),

                    Text(
                      " $rating (${noOfReviews.toString()})",
                      style: AppText.inter.l1bm,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
