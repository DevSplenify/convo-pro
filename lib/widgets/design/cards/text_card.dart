import 'package:convo_pro/configs/configs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class TextCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback? onTap;
  final VoidCallback? onReadPressed;
  const TextCard({
    super.key,
    required this.title,
    required this.subtitle,
    this.onTap,
    this.onReadPressed,
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
          color: AppTheme.c.white!,
          borderRadius: UIProps.buttonRadius,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 45.w,
              height: 45.h,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppTheme.c.primary.main!,
                borderRadius: BorderRadius.circular(5.r),
              ),
              child: SvgPicture.asset(
                'assets/svgs/text.svg',
                width: 37.5.w,
                height: 37.5.h,
              ),
            ),
            Space.xf(12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppText.inter.b2b!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    subtitle,
                    style: AppText.inter.l2!.cl(AppTheme.c.text.main!),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            Space.xf(16),
            GestureDetector(
              onTap: onReadPressed,
              child: Container(
                padding: Space.all(16, 10),
                decoration: BoxDecoration(
                  color: AppTheme.c.background.main!,
                  borderRadius: UIProps.buttonRadius,
                  border: Border.all(
                    color: AppTheme.c.primary.main!,
                    width: 1.w,
                  ),
                ),
                child: Text(
                  'Read Now',
                  style: AppText.inter.l1b!.cl(AppTheme.c.primary.main!),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
