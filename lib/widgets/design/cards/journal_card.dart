import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:convo_pro/configs/configs.dart';
import 'package:flutter_svg/svg.dart';
import 'package:readmore/readmore.dart';

class JournalCard extends StatelessWidget {
  final String date;
  final String time;
  final String title;
  final String description;
  final Color indicatorColor;
  final Color iconBgColor;
  final VoidCallback? onTap;

  const JournalCard({
    super.key,
    required this.date,
    required this.time,
    required this.title,
    required this.description,
    required this.indicatorColor,
    required this.iconBgColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    App.init(context);

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.translucent,
      child: Container(
        padding: Space.all(15, 19).copyWith(left: 0),
        decoration: BoxDecoration(
          color: AppTheme.c.white,
          borderRadius: UIProps.buttonRadius,
        ),
        child: Row(
          children: [
            /// Timeline Indicator
            Container(
              width: 3.81.w,
              height: 36.3.h,
              decoration: BoxDecoration(
                color: indicatorColor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(3.r),
                  bottomRight: Radius.circular(3.r),
                ),
              ),
            ),

            Space.xf(13.19),

            /// Content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Date
                  Row(
                    children: [
                      Container(
                        width: 38.13.w,
                        height: 38.13.h,
                        decoration: BoxDecoration(
                          color: iconBgColor,
                          borderRadius: UIProps.radiusM,
                        ),
                        child: Center(
                          child: SvgPicture.asset(
                            'assets/svgs/calendar.2svg.svg',
                            width: 20.w,
                            height: 20.h,
                            colorFilter: ColorFilter.mode(
                              indicatorColor,
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                      ),
                      Space.xf(14),
                      Text(date, style: AppText.inter.b2!.w(6)),
                    ],
                  ),

                  Space.yf(18),

                  /// Time
                  Text(
                    time,
                    style: AppText.inter.l1bm!.copyWith(
                      color: AppTheme.c.text.main,
                    ),
                  ),

                  Space.yf(5),

                  /// Title
                  Text(title, style: AppText.b1bm),

                  Space.yf(17.87),

                  /// Description with ReadMore
                  ReadMoreText(
                    description,
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'See details',
                    trimExpandedText: 'See less',
                    moreStyle: AppText.inter.l1!.copyWith(
                      color: AppTheme.c.text.shade800,
                      decoration: TextDecoration.underline,
                      decorationColor: AppTheme.c.text.shade800,
                    ),
                    lessStyle: AppText.inter.l1!.copyWith(
                      color: AppTheme.c.text.shade800,
                      decoration: TextDecoration.underline,
                      decorationColor: AppTheme.c.text.shade800,
                    ),

                    style: AppText.inter.l1!.copyWith(
                      color: AppTheme.c.text.main,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
