part of '../education_hub.dart';

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    _ScreenState.s(context, true);
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 300.h,
            child: Stack(
              children: [
                Container(
                  height: 140.h,
                  width: double.infinity,
                  decoration: BoxDecoration(color: AppTheme.c.accent.purple),
                  padding: Space.hf(24).copyWith(
                    // bottom: MediaQuery.of(context).padding.bottom + 24.h,
                    top: MediaQuery.of(context).padding.top + 15.h,
                  ),
                  child: Text('Education Hub', style: AppText.b1b!),
                ),
                Positioned(
                  left: 24,
                  right: 24,
                  bottom: 0,
                  child: CoursesCompletionCard(
                    progress: 45,
                    icon2Color: AppTheme.c.accent.red!,
                    icon1Color: AppTheme.c.accent.purple!,
                    icon2bg: AppTheme.c.error.shade100!,
                    icon1bg: AppTheme.c.accent.purpleLight!,
                    coursesCompleted: 8,
                    timeSpent: '3h 20m',
                    hasBorderShadow: true,
                    horizonalPadding: 16,
                    isTextLarge: true,
                  ),
                ),
              ],
            ),
          ),
          Space.yf(20),
          Expanded(
            child: SingleChildScrollView(
              padding: Space.hf(24),
              child: Column(
                children: [
                  SeeAllHeading(
                    title: 'Featured Courses',
                    onTap: () {
                      AppRoutes.allCourses.push(context);
                    },
                  ),
                  Space.yf(16),
                  SizedBox(height: 201.h),
                  Space.yf(24),
                  SeeAllHeading(
                    title: 'Short Lessons',
                    onTap: () {
                      AppRoutes.allLessons.push(context);
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
