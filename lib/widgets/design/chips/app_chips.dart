import 'package:convo_pro/configs/configs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget chip({
  required String text,
  required Color bgColor,
  required Color textColor,
  double? verticalPadding,
}) {
  return Container(
    padding: Space.all(10, verticalPadding ?? 4),
    decoration: BoxDecoration(
      color: bgColor,
      borderRadius: BorderRadius.circular(20.r),
      boxShadow: UIProps.cardShadow,
    ),
    child: Text(text, style: AppText.inter.l1bm!.cl(textColor)),
  );
}
