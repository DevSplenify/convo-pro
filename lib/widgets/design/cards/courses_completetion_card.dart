import 'package:convo_pro/configs/configs.dart';
import 'package:convo_pro/widgets/design/rounded_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Courses Progress Card
/// //////////////////////////////////
///
///
///
class CoursesCompletionCard extends StatelessWidget {
  final double progress;
  final Color? icon1Color;
  final Color? icon2Color;
  final Color? icon1bg;
  final Color? icon2bg;
  final int coursesCompleted;
  final String timeSpent;
  final bool isTextLarge;
  final bool hasBorderShadow;
  final double? horizonalPadding;
  const CoursesCompletionCard({
    super.key,
    required this.progress,
    this.icon1Color,
    this.icon2Color,
    this.icon1bg,
    this.icon2bg,
    required this.coursesCompleted,
    required this.timeSpent,
    this.isTextLarge = false,
    this.hasBorderShadow = false,
    this.horizonalPadding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Space.all(horizonalPadding ?? 10.5, 16),
      decoration: BoxDecoration(
        color: AppTheme.c.white,
        borderRadius: UIProps.buttonRadius,
        boxShadow: hasBorderShadow
            ? [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  blurRadius: 25,
                  offset: Offset(0, 4),
                ),
              ]
            : null,
        border: hasBorderShadow
            ? Border.all(color: AppTheme.c.lightGrey.main!, width: 1.w)
            : null,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Title
          Text(
            "Overall Completion",
            style: AppText.inter.l1bm!
                .s(isTextLarge ? 14.sp : 12.sp)
                .w(isTextLarge ? 7 : 5),
          ),

          Space.yf(4),

          /// Subtitle
          Text(
            "Keep it up, Good work",
            style: AppText.inter.l2!
                .cl(AppTheme.c.text.main!)
                .w(isTextLarge ? 5 : 4)
                .s(isTextLarge ? 12.sp : 10.sp),
          ),

          Space.yf(12),

          /// Percentage Row
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("${progress.toInt()}%", style: AppText.h3bm),
              Space.xf(8),
              Text(
                "Done",
                style: AppText.inter.l1bm!.cl(AppTheme.c.text.main!),
              ),
            ],
          ),

          Space.yf(8),

          /// Progress Bar
          RoundedLinearProgress(
            value: progress / 100,
            height: 12.h,
            backgroundColor: AppTheme.c.background.main!,
            valueColor: AppTheme.c.primary.main!,
            hasBorder: false,
          ),

          Space.yf(12),

          /// Bottom Cards
          Row(
            children: [
              _infoCard(
                bgColor: icon1bg ?? AppTheme.c.accent.yellowLight!,
                iconBg: icon1Color ?? AppTheme.c.accent.yellow!,
                icon: Icons.check_circle_outline,
                title: "Completed",
                value: "$coursesCompleted Lessons",
              ),
              Space.xf(12),
              _infoCard(
                bgColor: icon2bg ?? AppTheme.c.accent.purpleLight!,
                iconBg: icon2Color ?? AppTheme.c.accent.purple!,
                icon: Icons.access_time,
                title: "Time Spend",
                value: timeSpent,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _infoCard({
    required Color bgColor,
    required Color iconBg,
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Expanded(
      child: Container(
        padding: Space.all(10, 10.5),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: UIProps.buttonRadius,
        ),
        child: Row(
          children: [
            Container(
              height: 32.h,
              width: 32.h,
              decoration: BoxDecoration(color: iconBg, shape: BoxShape.circle),
              child: Icon(icon, color: Colors.white, size: 18.sp),
            ),
            Space.xf(10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppText.inter.l2!.cl(AppTheme.c.text.main!)),
                Text(value, style: AppText.inter.l1bm),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
