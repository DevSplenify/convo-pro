import 'package:convo_pro/configs/configs.dart';
import 'package:convo_pro/statics/app_statics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomsheetHeader extends StatelessWidget {
  final String? title;
  final bool hasBackAction;
  final VoidCallback? onBackPressed;
  const BottomsheetHeader({
    super.key,
    this.title,
    this.hasBackAction = false,
    this.onBackPressed,
  });

  @override
  Widget build(BuildContext context) {
    App.init(context);
    return Container(
      padding: Space.vf(24).copyWith(bottom: 16.5.h),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: AppTheme.c.lightGrey.main!, width: 1.w),
        ),
      ),
      child: Row(
        mainAxisAlignment: hasBackAction
            ? MainAxisAlignment.start
            : MainAxisAlignment.spaceBetween,
        children: [
          if (hasBackAction) ...[
            GestureDetector(
              onTap: onBackPressed ?? () => Navigator.pop(context),
              child: SvgPicture.asset(
                AppStaticData.backArrow,
                width: 20.w,
                height: 20.h,
              ),
            ),
            Space.xf(16),
          ],
          if (title != null)
            Text(title!, style: AppText.b1b!.copyWith(height: 1.0)),
          if (title == null || hasBackAction) Space.xm!,
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: SvgPicture.asset(
              AppStaticData.cross,
              width: 20.w,
              height: 20.h,
            ),
          ),
        ],
      ),
    );
  }
}
