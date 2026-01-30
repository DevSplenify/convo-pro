import 'package:convo_pro/configs/configs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RoundedLinearProgress extends StatelessWidget {
  final double value; // 0.0 to 1.0
  final double height;
  final Color backgroundColor;
  final Color valueColor;
  final double borderRadius;
  final Duration duration;
  final bool hasBorder;

  const RoundedLinearProgress({
    super.key,
    required this.value,
    this.height = 7,
    required this.backgroundColor,
    required this.valueColor,
    this.borderRadius = 40,
    this.duration = const Duration(milliseconds: 300),
    this.hasBorder = true,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final totalWidth = constraints.maxWidth;
        final progressWidth = (value.clamp(0.0, 1.0)) * totalWidth;

        return ClipRRect(
          borderRadius: BorderRadius.circular(borderRadius.r),
          child: Container(
            height: height,
            decoration: BoxDecoration(
              color: backgroundColor,
              border: hasBorder
                  ? Border.all(color: AppTheme.c.lightGrey.main!)
                  : null,
              borderRadius: BorderRadius.circular(borderRadius.r),
            ),
            alignment: Alignment.centerLeft,
            child: AnimatedContainer(
              duration: duration,
              curve: Curves.easeInOut,
              width: progressWidth,
              decoration: BoxDecoration(
                color: valueColor,
                borderRadius: BorderRadius.circular(borderRadius.r),
                border: hasBorder ? Border.all(color: valueColor) : null,
              ),
            ),
          ),
        );
      },
    );
  }
}
