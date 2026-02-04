part of '../course_details.dart';

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    _ScreenState.s(context);

    return Scaffold(
      appBar: CustomAppBar(
        title: 'Confident Speaking',
        type: AppBarType.withText,
        space: 16,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          top: 16.h,
          left: 24.w,
          right: 24.w,
          bottom: MediaQuery.of(context).padding.bottom + 10.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image
            ClipRRect(
              borderRadius: BorderRadius.circular(16.r),
              child: Image.asset(
                'assets/pngs/course.png',
                height: 200.h,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),

            Space.yf(16),
            Text('Confident Speaking', style: AppText.b1b),

            Space.yf(6),
            Text(
              '01:30:00',
              style: AppText.inter.b2!.cl(AppTheme.c.text.main!),
            ),
            Space.yf(6),
            RatingReviewsRow(
              rating: 4.3,
              reviews: 128,
              onReviewsTap: () {
                AppRoutes.reviews.push(context);
              },
            ),

            Space.yf(12),
            Text(
              'In this course, you will learn about the fundamentals of confident speaking and how to effectively communicate in various situations. We will cover topics such as public speaking, body language, and overcoming stage fright.',
              style: AppText.inter.l1?.copyWith(
                color: AppTheme.c.text.main,
                height: 1.5,
              ),
            ),
            Space.yf(16),
            Text('What You’ll Learn', style: AppText.inter.b2b!.w(6)),
            Space.yf(8),
            buildLearningItem(
              'How to calm nerves before and during conversations',
            ),
            buildLearningItem(
              'Techniques to speak clearly and avoid overthinking',
            ),
            buildLearningItem(
              'Building a confident mindset in social situations',
            ),
            buildLearningItem('Handling pauses, mistakes, and awkward moments'),
            Space.yf(18),
            Text('Lesson Outline', style: AppText.inter.b2b!.w(6)),
            Space.yf(8),
            LessonList(
              modules: [
                {
                  'title': 'Lesson 1',
                  'description': 'Understanding Speaking Anxiety',
                  'progress': 1.0,
                  'isCompleted': true,
                  'imagePath': 'assets/pngs/course.png',
                },
                {
                  'title': 'Lesson 2',
                  'description': 'The Confidence Mindset',
                  'progress': 0.8,
                  'isCompleted': false,
                  'imagePath': 'assets/pngs/course.png',
                },
                {
                  'title': 'Lesson 3',
                  'description': 'What you will learn in this lesson',
                  'progress': 0.5,
                  'isCompleted': false,
                  'imagePath': 'assets/pngs/course.png',
                },
              ],
              onModuleTap: (module) {
                AppRoutes.lessonDetails.push(context);
              },
            ),
            Space.yf(24),
            AppButton(label: 'Continue', onPressed: () {}),
          ],
        ),
      ),
    );
  }
}

Widget buildLearningItem(String text) {
  return Padding(
    padding: EdgeInsets.only(bottom: 8.h),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          ' • ',
          style: AppText.l1?.copyWith(color: AppTheme.c.text.main, height: 1.5),
        ),
        Space.xf(4),
        Expanded(
          child: Text(
            text,
            style: AppText.inter.l1?.copyWith(
              color: AppTheme.c.text.main,
              height: 1.5,
            ),
          ),
        ),
      ],
    ),
  );
}
