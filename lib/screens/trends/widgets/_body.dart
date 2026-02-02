part of '../trends.dart';

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    _ScreenState.s(context, true);
    return Scaffold(
      appBar: CustomAppBar(
        type: AppBarType.withWidget,
        title: 'Trends',
        space: 16,
        trailingWidget: SvgPicture.asset(
          'assets/svgs/filter.svg',
          width: 20.w,
          height: 20.h,
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          top: 16.h,
          left: 24.w,
          right: 24.w,
          bottom: MediaQuery.of(context).padding.bottom + 10.h,
        ),
        child: Column(
          children: [
            WeeklyMoodPatternWidget(
              moodData: [
                FlSpot(0, 4.0),
                FlSpot(1, 3.5),
                FlSpot(2, 2.8),
                FlSpot(3, 4.2),
                FlSpot(4, 3.0),
                FlSpot(5, 4.5),
                FlSpot(6, 2.5),
              ], // optional — omit for sample data
              hasInsightsButton: false,
            ),
            Space.yf(24),
            Row(
              children: [
                Expanded(
                  child: buildMoodTrends(
                    'Confidence Level',
                    40,
                    'Slightly Low',
                    'Monday',
                    AppTheme.c.accent.yellow!,
                    'assets/svgs/confidence.svg',
                    AppTheme.c.accent.yellowLight!,
                  ),
                ),
                Space.xf(10),
                Expanded(
                  child: buildMoodTrends(
                    'Social Energy',
                    80,
                    'High',
                    'Friday',
                    AppTheme.c.accent.purple!,
                    'assets/svgs/time.svg',
                    AppTheme.c.accent.purpleLight!,
                  ),
                ),
              ],
            ),
            Space.yf(24),
            ListView.separated(
              shrinkWrap: true,
              padding: Space.z,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (_, index) {
                return RecentLogsCard(
                  title: 'Saturday',
                  subtitle: 'Dec 21, 2025',
                  onTap: () {
                    AppRoutes.detailedRecentLogs.push(context);
                  },
                );
              },
              separatorBuilder: (_, _) {
                return Space.yf(12);
              },
              itemCount: 3,
            ),
          ],
        ),
      ),
    );
  }
}
