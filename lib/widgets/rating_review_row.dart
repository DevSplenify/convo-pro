import 'package:convo_pro/configs/configs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RatingReviewsRow extends StatelessWidget {
  final double rating;
  final int reviews;
  final int starCount;
  final double starSize;
  final VoidCallback? onReviewsTap;

  const RatingReviewsRow({
    super.key,
    required this.rating,
    required this.reviews,
    this.starCount = 5,
    this.starSize = 15,
    this.onReviewsTap,
  });

  @override
  Widget build(BuildContext context) {
    final int filledStars = rating.round();

    return Row(
      children: [
        /// Rating value
        Text(
          rating.toStringAsFixed(1),
          style: AppText.inter.b2!.cl(AppTheme.c.accent.orange!),
        ),

        Space.xf(5),

        /// Stars
        Row(
          children: List.generate(
            starCount,
            (index) => Padding(
              padding: EdgeInsets.only(right: 2.w),
              child: SvgPicture.asset(
                'assets/svgs/star.svg',
                width: starSize.sp,
                height: starSize.sp,
                colorFilter: ColorFilter.mode(
                  index < filledStars
                      ? AppTheme.c.accent.orange!
                      : Colors.grey[300]!,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
        ),

        Space.xf(8),

        /// Reviews text
        GestureDetector(
          onTap: onReviewsTap,
          child: Text(
            '($reviews Reviews)',
            style: AppText.inter.b2!
                .cl(AppTheme.c.text.shade800!)
                .copyWith(
                  decoration: TextDecoration.underline,
                  decorationColor: AppTheme.c.text.shade800!,
                ),
          ),
        ),
      ],
    );
  }
}
