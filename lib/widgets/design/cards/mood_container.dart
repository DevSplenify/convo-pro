import 'package:convo_pro/configs/configs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

Widget buildMoodContainer(String title, String value, String moodIconPath) {
  return Container(
    padding: Space.all(12, 12.7),
    decoration: BoxDecoration(
      color: AppTheme.c.white,
      borderRadius: UIProps.buttonRadius,
      boxShadow: [
        BoxShadow(
          color: Color(0x08B4AFAD),
          blurRadius: 22.4,
          offset: const Offset(0, 11.2),
        ),
      ],
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: AppText.inter.l2!.cl(Color(0xFF1F3355))),
            Space.yf(5.6),
            Text(value, style: AppText.inter.b2b!.cl(Color(0xFF1F3355))),
          ],
        ),
        SvgPicture.asset(moodIconPath, width: 40.w, height: 40.h),
      ],
    ),
  );
}
