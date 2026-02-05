part of '../all_lessons.dart';

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    _ScreenState.s(context, true);
    return Scaffold(
      appBar: const CustomAppBar(
        type: AppBarType.withText,
        title: 'Short Lessons',
      ),

      body: SingleChildScrollView(
        padding: Space.hf(24).copyWith(
          bottom: MediaQuery.of(context).padding.bottom + 24.h,
          top: 16.h,
        ),
        child: Column(
          children: [
            SearchField(name: 'Search Lessons', hint: 'Search anything...'),
            Space.yf(24),
            ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              padding: Space.z,
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
    );
  }
}
