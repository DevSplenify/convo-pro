import 'package:convo_pro/configs/configs.dart';
import 'package:convo_pro/statics/app_statics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class AiRecommendations extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback? onTap;

  const AiRecommendations({
    super.key,
    required this.title,
    required this.subtitle,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    App.init(context);
    return Container(
      padding: Space.all(16, 12),
      decoration: BoxDecoration(
        color: AppTheme.c.white!,
        borderRadius: UIProps.buttonRadius,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: Space.all(9),
            decoration: BoxDecoration(
              color: AppTheme.c.primary.shade200!,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: SvgPicture.asset(
              'assets/svgs/journaling.svg',
              width: 24.w,
              height: 24.h,
              colorFilter: ColorFilter.mode(
                AppTheme.c.primary.main!,
                BlendMode.srcIn,
              ),
            ),
          ),
          Space.xf(12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: AppText.inter.b2b!.w(6)),
              Space.yf(3),
              Text(
                subtitle,
                style: AppText.inter.l1!.cl(AppTheme.c.text.main!),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
          Space.xm!,
          SvgPicture.asset(AppStaticData.arrowRight, width: 24.w, height: 24.h),
        ],
      ),
    );
  }
}
