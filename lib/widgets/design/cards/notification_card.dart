import 'package:convo_pro/configs/configs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NotificationCard extends StatelessWidget {
  final String notificationText;
  const NotificationCard({super.key, required this.notificationText});

  @override
  Widget build(BuildContext context) {
    App.init(context);
    return Container(
      width: double.infinity,
      padding: Space.all(17, 20),
      decoration: BoxDecoration(
        color: AppTheme.c.background.shade200,
        borderRadius: UIProps.buttonRadius,
        border: Border.all(color: AppTheme.c.primary.shade200!, width: 0.85.w),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 18.6.r,
            backgroundColor: AppTheme.c.primary.shade200,
            child: SvgPicture.asset(
              'assets/svgs/notification2.svg',
              width: 24.w,
              height: 24.h,
            ),
          ),
          Space.xf(10),
          Expanded(child: Text(notificationText, style: AppText.inter.b2!)),
        ],
      ),
    );
  }
}
