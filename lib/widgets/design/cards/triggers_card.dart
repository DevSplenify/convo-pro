import 'package:convo_pro/configs/configs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TriggersCard extends StatelessWidget {
  final String iconPath;
  final String title;
  final Color iconBgColor;
  final VoidCallback? onTap;
  const TriggersCard({
    super.key,
    required this.iconPath,
    required this.title,
    required this.iconBgColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.translucent,
      child: Container(
        padding: Space.all(12),
        decoration: BoxDecoration(
          color: AppTheme.c.white,
          borderRadius: UIProps.radiusM,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 38.w,
              height: 38.h,
              decoration: BoxDecoration(
                color: iconBgColor,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Center(
                child: SvgPicture.asset(iconPath, width: 20.w, height: 20.h),
              ),
            ),
            Space.yf(12),
            Text(title, style: AppText.inter.b2!),
          ],
        ),
      ),
    );
  }
}
