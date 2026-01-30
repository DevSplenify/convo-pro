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
Widget _buildMoodTrends(
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
          Text(title, style: AppText.inter.l1bm),
        ],
      ),
    ),
  );
}

/// Courses Progress Card
/// //////////////////////////////////
///
///
Widget _buildCoursesProgressCard() {
  return Container(
    padding: Space.all(10.5, 16),
    decoration: BoxDecoration(
      color: AppTheme.c.white,
      borderRadius: UIProps.buttonRadius,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Title
        Text("Overall Completion", style: AppText.inter.l1bm),

        Space.yf(4),

        /// Subtitle
        Text(
          "Keep it up, Good work",
          style: AppText.inter.l2!.cl(AppTheme.c.text.main!),
        ),

        Space.yf(12),

        /// Percentage Row
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("45%", style: AppText.h3bm),
            Space.xf(8),
            Text("Done", style: AppText.inter.l1bm!.cl(AppTheme.c.text.main!)),
          ],
        ),

        Space.yf(8),

        /// Progress Bar
        RoundedLinearProgress(
          value: 0.45,
          height: 12.h,
          backgroundColor: AppTheme.c.background.main!,
          valueColor: AppTheme.c.primary.main!,
          hasBorder: false,
        ),

        Space.yf(12),

        /// Bottom Cards
        Row(
          children: [
            _infoCard(
              bgColor: AppTheme.c.accent.yellowLight!,
              iconBg: AppTheme.c.accent.yellow!,
              icon: Icons.check_circle_outline,
              title: "Completed",
              value: "12 Lessons",
            ),
            Space.xf(12),
            _infoCard(
              bgColor: AppTheme.c.accent.purpleLight!,
              iconBg: AppTheme.c.accent.purple!,
              icon: Icons.access_time,
              title: "Time Spend",
              value: "4h 30m",
            ),
          ],
        ),
      ],
    ),
  );
}

Widget _infoCard({
  required Color bgColor,
  required Color iconBg,
  required IconData icon,
  required String title,
  required String value,
}) {
  return Expanded(
    child: Container(
      padding: Space.all(10, 10.5),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: UIProps.buttonRadius,
      ),
      child: Row(
        children: [
          Container(
            height: 32.h,
            width: 32.h,
            decoration: BoxDecoration(color: iconBg, shape: BoxShape.circle),
            child: Icon(icon, color: Colors.white, size: 18.sp),
          ),
          Space.xf(10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: AppText.inter.l2!.cl(AppTheme.c.text.main!)),
              Text(value, style: AppText.inter.l1bm),
            ],
          ),
        ],
      ),
    ),
  );
}
