import 'package:convo_pro/configs/configs.dart';
import 'package:convo_pro/widgets/app_divider.dart';
import 'package:convo_pro/widgets/design/rounded_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class LessonList extends StatelessWidget {
  final List<Map<String, dynamic>> modules;
  final void Function(Map<String, dynamic> module) onModuleTap;

  const LessonList({
    super.key,
    required this.modules,
    required this.onModuleTap,
  });

  @override
  Widget build(BuildContext context) {
    App.init(context);
    return ListView.separated(
      shrinkWrap: true,
      padding: Space.z,
      itemCount: modules.length,
      separatorBuilder: (_, _) => Space.yf(12),
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final module = modules[index];
        return GestureDetector(
          onTap: () => onModuleTap(module),

          child: Container(
            padding: Space.all(12),
            decoration: BoxDecoration(
              color: AppTheme.c.white,
              borderRadius: UIProps.radiusM,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Avatar
                    Container(
                      width: 40.w,
                      height: 40.h,
                      decoration: BoxDecoration(
                        color: AppTheme.c.lightGrey.main,
                        borderRadius: BorderRadius.circular(8.r),
                        image: module['imagePath'] != null
                            ? DecorationImage(
                                image: AssetImage(module['imagePath']),
                                fit: BoxFit.cover,
                              )
                            : null,
                      ),
                      alignment: Alignment.center,
                      child: SvgPicture.asset(
                        'assets/svgs/video-square.svg',
                        width: 16.w,
                        height: 16.h,
                      ),
                    ),
                    Space.xf(10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            module['title'] ?? '',
                            style: AppText.inter.l1bm,
                          ),
                          Space.yf(2),
                          Text(
                            module['description'] ?? '',
                            style: AppText.inter.l1!.cl(AppTheme.c.text.main!),
                          ),
                        ],
                      ),
                    ),
                    // if (module['locked'] == true)
                    //   SvgPicture.asset(
                    //     'assets/svgs/lock.svg',
                    //     width: 18.w,
                    //     height: 18.h,
                    //     colorFilter: ColorFilter.mode(
                    //       AppTheme.c.accent.red!,
                    //       BlendMode.srcIn,
                    //     ),
                    //   ),
                  ],
                ),
                Space.yf(16),
                AppDivider(),
                Space.yf(8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      module['isCompleted'] == true
                          ? 'Completed'
                          : 'Incompleted',
                      style: AppText.inter.l1bm!.s(12.sp),
                    ),
                    Text(
                      module['duration'] ?? '03:00',
                      style: AppText.inter.l1!.cl(AppTheme.c.text.main!),
                    ),
                  ],
                ),
                Space.yf(12),
                RoundedLinearProgress(
                  value: module['progress'] ?? 0.0,
                  height: 8.6,
                  backgroundColor: AppTheme.c.background.main!,
                  valueColor: AppTheme.c.primary.main!,
                  hasBorder: false,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
