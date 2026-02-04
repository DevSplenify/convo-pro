part of '../quiz_completed.dart';

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    _ScreenState.s(context, true);

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).padding.bottom + 24.h,
          top: MediaQuery.of(context).padding.top + 140.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/svgs/completed.svg', height: 283.h),

            Space.yf(10),

            // Congratulations text
            Text(
              'Your Score',
              style: AppText.h4bm!.cl(AppTheme.c.text.main!),

              textAlign: TextAlign.center,
            ),

            Space.yf(10),

            Text('09 / 10', style: AppText.h1b, textAlign: TextAlign.center),

            Space.yf(10),

            Text('Congratulations', style: AppText.h3bm),
            Space.yf(10),
            Text(
              'Great job, Rumi Aktar! You Did It',
              style: AppText.b1bm!.cl(AppTheme.c.text.main!),
              textAlign: TextAlign.center,
            ),
            Space.ym!,
            Padding(
              padding: Space.hf(24),
              child: AppButton(
                label: 'Back to home',
                onPressed: () {
                  // Option 2: If you want to go back to lesson details specifically, use:
                  Navigator.of(context).popUntil(
                    (route) =>
                        route.settings.name == AppRoutes.lessonDetails ||
                        route.isFirst,
                  );

                  // Option 3: If you want to replace with lesson details:
                  // Navigator.of(context).popUntil((route) => route.isFirst);
                  // AppRoutes.lessonDetails.push(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
