part of '../home.dart';

//////////// Custom Cards /////////
////////////////////////////////////
///
//// Custom card for Quick Actions

Widget _buildQuickActions(String title, String svgPath, VoidCallback onTap) {
  return GestureDetector(
    onTap: onTap,

    child: Container(
      padding: Space.all(12),
      decoration: BoxDecoration(
        color: AppTheme.c.primary.shade200!,
        borderRadius: UIProps.buttonRadius,
      ),
      child: Row(
        children: [
          Container(
            padding: Space.all(9),
            decoration: BoxDecoration(
              color: AppTheme.c.primary.main!,
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: SvgPicture.asset(svgPath, width: 20.w, height: 20.h),
          ),
          Space.xf(12),
          Expanded(
            child: Text(
              title,
              style: AppText.inter.l1bm,
              textAlign: TextAlign.left,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    ),
  );
}

//// Custom card for Mood Trends
///
/// //////////////////////////////////
Widget buildMoodTrends(
  String title,
  int value,
  String average,
  String bestDay,
  Color iconColor,
  String iconPath,
  Color iconBgColor,
) {
  Widget buildColumnItem(String title, String subtitle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppText.inter.l2!.cl(AppTheme.c.text.main!)),
        Text(subtitle, style: AppText.inter.l1bm!),
      ],
    );
  }

  return Container(
    decoration: BoxDecoration(
      color: AppTheme.c.white,
      borderRadius: UIProps.buttonRadius,
    ),
    padding: Space.all(12, 14),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 12.r,
              backgroundColor: iconBgColor,
              child: SvgPicture.asset(iconPath, width: 16.w, height: 16.h),
            ),
            Space.xf(8),
            Flexible(
              child: Text(
                title,
                style: AppText.inter.l1b,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
        Space.yf(16),
        SizedBox(
          width: 100.w,
          height: 100.h,
          child: Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: 100.w,
                height: 100.h,
                child: CircularProgressIndicator(
                  value: value / 100,
                  strokeWidth: 17.w,
                  backgroundColor: AppTheme.c.background.main,
                  color: iconColor,
                ),
              ),
              Text('$value', style: AppText.h3b),
            ],
          ),
        ),
        Space.yf(16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildColumnItem('Average', average),
            buildColumnItem('Best Day', bestDay),
          ],
        ),
      ],
    ),
  );
}

////Therapeutic Short courses Card
/// //////////////////////////////////
Widget _buildTherapeuticCoursesItem(
  String title,
  Color iconColor,
  Color iconBgColor,
  VoidCallback onTap,
) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      decoration: BoxDecoration(
        color: AppTheme.c.background.main,
        borderRadius: UIProps.radiusM,
      ),
      padding: Space.all(12).copyWith(top: 19.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: Space.all(9),
            decoration: BoxDecoration(
              color: iconBgColor,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: SvgPicture.asset(
              'assets/svgs/journaling.svg',
              width: 20.w,
              height: 20.h,
              colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
            ),
          ),
          Space.yf(12),
          Text(
            title,
            style: AppText.inter.l1bm,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    ),
  );
}
