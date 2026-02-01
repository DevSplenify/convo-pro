import 'package:convo_pro/configs/configs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class AudioPlayerWidget extends StatelessWidget {
  final VoidCallback? onPlayPausePressed;

  const AudioPlayerWidget({super.key, this.onPlayPausePressed});

  @override
  Widget build(BuildContext context) {
    App.init(context);

    return Container(
      padding: Space.all(8, 12),
      decoration: BoxDecoration(
        color: AppTheme.c.white!,
        borderRadius: UIProps.buttonRadius,
      ),
      child: Row(
        children: [
          /// ▶️ Play button
          GestureDetector(
            onTap: onPlayPausePressed,
            child: Container(
              width: 45.w,
              height: 45.h,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppTheme.c.primary.main!,
                borderRadius: BorderRadius.circular(6.r),
              ),
              child: SvgPicture.asset(
                'assets/svgs/play.svg',
                width: 37.5.w,
                height: 37.5.h,
              ),
            ),
          ),

          Space.xf(12),

          /// 🌊 Waveform
          Row(
            children: List.generate(28, (index) {
              final heights = [
                6,
                14,
                10,
                18,
                8,
                16,
                12,
                20,
                10,
                18,
                14,
                22,
                12,
                18,
              ];

              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 1.5.w),
                child: Container(
                  width: 2.w,
                  height: heights[index % heights.length].h,
                  decoration: BoxDecoration(
                    color: AppTheme.c.black,
                    borderRadius: BorderRadius.circular(2.r),
                  ),
                ),
              );
            }),
          ),

          /// ··· Dots tail
          Row(
            children: List.generate(
              10,
              (_) => Padding(
                padding: EdgeInsets.symmetric(horizontal: 1.5.w),
                child: Container(
                  width: 2.w,
                  height: 2.w,
                  decoration: BoxDecoration(
                    color: AppTheme.c.black,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
