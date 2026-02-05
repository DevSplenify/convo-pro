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

          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).padding.bottom + 24.h,
              ),
              child: Column(
                children: [
                  Space.yf(20),
                  SeeAllHeading(
                    title: 'Featured Courses',
                    onTap: () {
                      AppRoutes.allCourses.push(context);
                    },
                    hasHorizontalPadding: true,
                  ),
                  Space.yf(16),
                  SizedBox(
                    height: 205.h,

                    child: ListView.separated(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.only(left: 24.w),
                      itemBuilder: (context, index) {
                        return FeaturedCoursesHorizontal(
                          image: 'assets/pngs/course2.png',
                          title: 'Speak with Confidence',
                          duration: '3h 20m',
                          rating: '4.5',
                          noOfReviews: 120,
                          onTap: () {
                            AppRoutes.courseDetails.push(context);
                          },
                        );
                      },
                      separatorBuilder: (_, _) => Space.xf(15),
                      itemCount: 5,
                    ),
                  ),
                  Space.yf(24),
                  SeeAllHeading(
                    title: 'Short Lessons',
                    onTap: () {
                      AppRoutes.allLessons.push(context);
                    },
                    hasHorizontalPadding: true,
                  ),
                  Space.yf(16),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    padding: Space.hf(24),
                    itemBuilder: (context, index) {
                      return ShortLessonsCard(
                        image: 'assets/pngs/lesson.png',
                        title: '3D Character Lumion',
                        duration: 'Duration: 1hr 20min',
                        rating: '4.9',
                        noOfReviews: 1724,
                        onTap: () {
                          AppRoutes.lessonDetails.push(context);
                        },
                        onTapPlay: () {
                          AppRoutes.lessonDetails.push(context);
                        },
                      );
                    },
                    separatorBuilder: (_, _) => Space.yf(12),
                    itemCount: 5,
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
