part of '../all_courses.dart';

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    _ScreenState.s(context, true);
    return Scaffold(
      appBar: const CustomAppBar(
        type: AppBarType.withText,
        title: 'See all Courses',
      ),

      body: SingleChildScrollView(
        padding: Space.hf(24).copyWith(
          bottom: MediaQuery.of(context).padding.bottom + 24.h,
          top: 16.h,
        ),
        child: Column(
          children: [
            SearchField(name: 'Search Courses', hint: 'Search anything...'),
            Space.yf(24),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),

              padding: Space.z,
              itemBuilder: (context, index) {
                return FeaturedCoursesVertical(
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
              separatorBuilder: (_, _) => Space.yf(12),
              itemCount: 5,
            ),
          ],
        ),
      ),
    );
  }
}
