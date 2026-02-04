part of '../lesson_details.dart';

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    _ScreenState.s(context, true);
    return Scaffold(
      appBar: const CustomAppBar(
        type: AppBarType.withText,
        title: 'Gratitude Practice',
      ),

      body: SingleChildScrollView(
        padding: Space.hf(24).copyWith(
          bottom: MediaQuery.of(context).padding.bottom + 24.h,
          top: 16.h,
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
            Text('Gratitude Practice', style: AppText.b1b),

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
              'This lesson helps you overcome social anxiety and build the confidence to speak naturally in everyday conversations. Through simple psychology-backed lessons and practical exercises, you’ll learn how to manage nervousness, organize your thoughts, and communicate with clarity in any social or professional setting.',
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
            Space.yf(24),
            AppButton(
              label: 'Start Quiz',
              onPressed: () {
                AppRoutes.quiz.push(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
