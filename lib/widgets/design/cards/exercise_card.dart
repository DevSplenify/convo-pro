import 'package:convo_pro/configs/configs.dart';
import 'package:convo_pro/widgets/design/rounded_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExerciseCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imagePath;
  final int progressPercent;
  final Color? progressColor;
  final VoidCallback? onTap;

  const ExerciseCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.imagePath,
    required this.progressPercent,
    this.progressColor,
    this.onTap,
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
          borderRadius: UIProps.buttonRadius,
        ),
        child: Row(
          children: [
            // Image
            Container(
              height: 90.w,
              width: 90.w,
              decoration: BoxDecoration(
                color: AppTheme.c.accent.yellow,
                borderRadius: BorderRadius.circular(12.r),
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            Space.xf(12),

            // Content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: AppText.inter.b2!.w(6)),
                  Space.yf(4),
                  Text(
                    subtitle,
                    style: AppText.inter.l2!.cl(AppTheme.c.text.main!),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Space.yf(6),

                  /// Percentage Row
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,

                    children: [
                      Text("$progressPercent%", style: AppText.inter.b2b!),
                      Space.xf(8),
                      Text(
                        "Completed",
                        style: AppText.inter.l2!.cl(AppTheme.c.text.main!),
                      ),
                    ],
                  ),

                  Space.yf(4),

                  /// Progress Bar
                  RoundedLinearProgress(
                    value: progressPercent / 100,
                    height: 12.h,
                    backgroundColor: AppTheme.c.background.main!,
                    valueColor: AppTheme.c.primary.main!,
                    hasBorder: false,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
