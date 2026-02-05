import 'package:convo_pro/configs/configs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ShortLessonsCard extends StatelessWidget {
  final String image;
  final String title;
  final String duration;
  final String rating;
  final int noOfReviews;
  final VoidCallback? onTap;
  final VoidCallback? onTapPlay; //missing onTap for see all

  const ShortLessonsCard({
    super.key,
    required this.image,
    required this.title,
    required this.duration,
    required this.rating,
    required this.noOfReviews,
    this.onTap,
    this.onTapPlay,
  });

  @override
  Widget build(BuildContext context) {
    App.init(context);

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.translucent,
      child: Container(
        padding: Space.all(8, 12),
        decoration: BoxDecoration(
          color: AppTheme.c.white,
          borderRadius: UIProps.radiusM,
          // boxShadow: UIProps.cardShadow,
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.r),
              child: Image.asset(
                image,
                height: 84.h,
                width: 84.w,
                fit: BoxFit.cover,
              ),
            ),

            Space.xf(11),

            /// 🔹 Content (ARGUMENTS)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppText.inter.b2bm),

                Space.yf(4),

                Text(
                  duration,
                  style: AppText.inter.l2!.cl(AppTheme.c.text.main!),
                ),

                Space.yf(12),

                /// ⭐ Rating (FIXED ICON)
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/svgs/star_rounded.svg',
                      width: 15.w,
                      height: 15.h,
                    ),
                    Space.xf(2.7),
                    Text(rating, style: AppText.inter.l2bm),
                  ],
                ),
              ],
            ),
            Space.xm!,

            /// ▶ Play Button (FIXED)
            GestureDetector(
              onTap: onTapPlay,
              behavior: HitTestBehavior.translucent,
              child: CircleAvatar(
                radius: 14.r,
                backgroundColor: AppTheme.c.primary.shade100,
                child: SvgPicture.asset(
                  'assets/svgs/play2.svg',
                  width: 16.w,
                  height: 16.h,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
