part of '../mindfulness.dart';

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    _ScreenState.s(context, true);
    return Scaffold(
      appBar: const CustomAppBar(
        type: AppBarType.textOnlyLeft,
        title: 'Mindfulness Corner',
      ),

      body: SingleChildScrollView(
        padding: Space.hf(24).copyWith(
          bottom: MediaQuery.of(context).padding.bottom + 24.h,
          top: 16.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MindfulnessStreakCalendar(
              streakDays: 16,
              // today defaults to DateTime.now()
            ),
            Space.yf(24),
            Text('Sessions', style: AppText.b1b),
            Space.yf(12),
            Row(
              children: [
                Expanded(
                  child: _buildSessionsTypeCard(
                    'Text Sessions',
                    'assets/svgs/templets.svg',
                    AppTheme.c.accent.purple!,
                    AppTheme.c.white!,
                    () {
                      AppRoutes.textSessions.push(context);
                    },
                  ),
                ),
                Space.xf(8),
                Expanded(
                  child: _buildSessionsTypeCard(
                    'Audio Sessions',
                    'assets/svgs/smile.svg',
                    AppTheme.c.accent.yellow!,
                    AppTheme.c.white!,
                    () {
                      AppRoutes.audioSessions.push(context);
                    },
                  ),
                ),
              ],
            ),
            Space.yf(12),
            _buildSessionsTypeCard(
              'Live Sessions',
              'assets/svgs/live.svg',
              AppTheme.c.accent.red!,
              AppTheme.c.white!,
              () {
                AppRoutes.liveSession.push(context);
              },
            ),
            Space.yf(24),
            Text('Daily Exercises', style: AppText.b1b),
            Space.yf(12),
            ListView.separated(
              padding: Space.z,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: exercisesData.length,
              separatorBuilder: (_, _) => Space.yf(12),
              itemBuilder: (context, index) {
                final item = exercisesData[index];

                return ExerciseCard(
                  title: item['title'],
                  subtitle: item['subtitle'],
                  imagePath: item['image'],
                  progressPercent: item['progress'],
                  onTap: () {
                    AppRoutes.exerciseDetails.push(context);
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSessionsTypeCard(
    String title,
    String iconPath,
    Color iconBgColor,
    Color emojiColor,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.translucent,
      child: Container(
        padding: Space.all(12),
        decoration: BoxDecoration(
          color: AppTheme.c.white,
          borderRadius: UIProps.radiusM,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 38.w,
              height: 38.h,
              decoration: BoxDecoration(
                color: iconBgColor,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Center(
                child: SvgPicture.asset(iconPath, width: 20.w, height: 20.h),
              ),
            ),
            Space.yf(12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title, style: AppText.inter.b2!),
                SvgPicture.asset(
                  'assets/svgs/arrow-right.svg',
                  width: 24.w,
                  height: 24.h,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
