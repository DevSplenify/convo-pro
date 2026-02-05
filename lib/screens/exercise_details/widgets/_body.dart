part of '../exercise_details.dart';

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    _ScreenState.s(context, true);
    return Scaffold(
      appBar: const CustomAppBar(
        type: AppBarType.withText,
        title: 'Meditation Yoga',
      ),
      floatingActionButton: Padding(
        padding: Space.hf(24),
        child: AppButton(
          label: 'Mark As Completed',
          onPressed: () {
            Navigator.pop(context);
          },
          buttonType: ButtonType.outlined,
          backgroundColor: AppTheme.c.background.main,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

      body: SingleChildScrollView(
        padding: Space.hf(24).copyWith(
          bottom: MediaQuery.of(context).padding.bottom + 24.h,
          top: 16.h,
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: Image.asset(
                'assets/pngs/yoga.png',
                height: 250.h,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Space.yf(16),
            DetailsHeadings(
              title: 'Introduction',
              subtitle:
                  'There are many variations of passages of Lorem  Ipsum available, but the majority have suffered  alteration in some form, by injected humour. There are many variations of passages of Lorem  Ipsum available, but the majority have suffered  alteration in some form, by injected humour.',
            ),
            Space.yf(12),
            _builtPoints('1 set of jumping jack with rope and etc.'),
            _builtPoints('2 sets of push ups and etc.'),
            _builtPoints('3 sets of squats and etc.'),
            _builtPoints('4 sets of lunges and etc.'),
            _builtPoints('5 minutes of meditation and etc.'),
          ],
        ),
      ),
    );
  }

  Widget _builtPoints(String point) {
    return Padding(
      padding: EdgeInsetsGeometry.only(bottom: 6.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Space.xf(8),
          Icon(Icons.circle, size: 6.r, color: AppTheme.c.text.shade800),
          Space.xf(8),
          Expanded(child: Text(point, style: AppText.inter.b2!)),
        ],
      ),
    );
  }
}
