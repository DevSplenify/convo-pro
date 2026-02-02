part of '../mood_tracker.dart';

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    _ScreenState.s(context, true);
    return Scaffold(
      // appBar: const CustomAppBar(
      //   type: AppBarType.withText,
      //   title: 'Mood Tracker',
      // ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: Space.hf(
              24,
            ).copyWith(bottom: 20.h, top: MediaQuery.of(context).padding.top),
            decoration: BoxDecoration(
              color: AppTheme.c.primary.main,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(16.r),
                bottomRight: Radius.circular(16.r),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Space.yf(12),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: SvgPicture.asset(
                        AppStaticData.backArrow,
                        width: 24.w,
                        height: 24.h,
                        colorFilter: ColorFilter.mode(
                          AppTheme.c.white!,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                    Space.xf(16),
                    Text('Log Mood', style: AppText.b1b!.cl(AppTheme.c.white!)),
                  ],
                ),
                Space.yf(28),
                _buildEmotionalInsightsCard(),
                Space.yf(12),
                buildMoodContainer(
                  'Your Mood Today',
                  'Sad',
                  'assets/svgs/sad.svg',
                ),
                Space.yf(12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: _buildMoodTrackerItem('Worst Day', 'Monday'),
                    ),
                    Space.xf(12),
                    Expanded(
                      child: _buildMoodTrackerItem('Best Day', 'Friday'),
                    ),
                  ],
                ),
              ],
            ),
          ),

          Expanded(
            child: SingleChildScrollView(
              padding: Space.hf(
                24,
              ).copyWith(bottom: MediaQuery.of(context).padding.bottom + 24.h),
              child: Column(
                children: [
                  Space.yf(16),
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
                    onInsightsPressed: () {
                      AppRoutes.trends.push(context);
                    }, // optional — button callback
                  ),
                  Space.yf(16),
                  SeeAllHeading(
                    title: 'Triggers & Patterns',
                    onTap: () {
                      AppRoutes.triggers.push(context);
                    },
                  ),
                  Space.yf(12),
                  GridView.builder(
                    padding: Space.z,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 12.h,
                      crossAxisSpacing: 8.w,
                      childAspectRatio: 1.65, // 👈 key for same look
                    ),
                    itemCount: triggers.length,
                    itemBuilder: (_, index) {
                      final item = triggers[index];
                      return TriggersCard(
                        title: item['title'],
                        iconPath: item['icon'],
                        iconBgColor: item['color'],
                        onTap: () {
                          AppRoutes.triggerDetails.push(context);
                        },
                      );
                    },
                  ),
                  Space.yf(16),
                  AppButton(
                    label: 'Create Log',
                    onPressed: () {
                      AppRoutes.createLog.push(context);
                    },
                  ),
                  Space.yf(16),
                  SeeAllHeading(title: 'Recent Logs', isTiltleOnly: true),
                  Space.yf(12),
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
          ),
        ],
      ),
    );
  }

  Widget _buildEmotionalInsightsCard() {
    return Container(
      padding: Space.all(12),
      decoration: BoxDecoration(
        borderRadius: UIProps.buttonRadius,
        color: AppTheme.c.primary.main!,
        border: Border.all(color: AppTheme.c.white!, width: 1.w),
      ),
      child: Column(
        children: [
          Row(
            children: [
              SvgPicture.asset(
                'assets/svgs/heart_filled.svg',
                width: 14.w,
                height: 14.h,
              ),
              Space.xf(4.2),
              Text(
                'Emotional Insights',
                style: AppText.inter.l2bm!.cl(AppTheme.c.white!),
              ),
            ],
          ),
          Space.yf(12),
          Text(
            'Your mood was higher on days with more social energy.',
            style: AppText.inter.b2b!.cl(AppTheme.c.white!),
          ),
        ],
      ),
    );
  }

  Widget _buildMoodTrackerItem(String title, String value) {
    return Container(
      padding: Space.all(12, 12.7),
      decoration: BoxDecoration(
        color: AppTheme.c.white,
        borderRadius: UIProps.buttonRadius,
        boxShadow: [
          BoxShadow(
            color: Color(0x08B4AFAD),
            blurRadius: 22.4,
            offset: const Offset(0, 11.2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: AppText.inter.l2!.cl(Color(0xFF1F3355))),
          Space.yf(5.6),
          Text(value, style: AppText.inter.l1b!.cl(Color(0xFF1F3355))),
        ],
      ),
    );
  }
}
