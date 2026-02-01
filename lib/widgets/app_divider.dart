import 'package:convo_pro/configs/configs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppDivider extends StatelessWidget {
  const AppDivider({super.key});

  @override
  Widget build(BuildContext context) {
    App.init(context);
    return Container(
      width: double.infinity,
      height: 1.h,
      color: AppTheme.c.lightGrey.main,
    );
  }
}
