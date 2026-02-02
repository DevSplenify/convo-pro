import 'package:convo_pro/configs/configs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class RecentLogsCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback? onTap;
  const RecentLogsCard({
    super.key,
    required this.title,
    required this.subtitle,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    App.init(context);
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.translucent,
      child: Container(
        padding: Space.all(16, 12),
        decoration: BoxDecoration(
          color: AppTheme.c.white!,
          borderRadius: UIProps.buttonRadius,
        ),
        child: Row(
          children: [
            Container(
              padding: Space.all(10.89),
              decoration: BoxDecoration(
                color: AppTheme.c.primary.main!,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: SvgPicture.asset(
                'assets/svgs/journaling.svg',
                width: 24.21.w,
                height: 24.21.h,
                colorFilter: ColorFilter.mode(
                  AppTheme.c.white!,
                  BlendMode.srcIn,
                ),
              ),
            ),
            Space.xf(12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppText.inter.b2b!),
                Space.yf(3),
                Text(
                  subtitle,
                  style: AppText.inter.b2!.cl(AppTheme.c.text.main!),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
