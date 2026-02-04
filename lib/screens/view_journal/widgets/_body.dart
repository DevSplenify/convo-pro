part of '../view_journal.dart';

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    _ScreenState.s(context, true);
    return Scaffold(
      appBar: const CustomAppBar(
        type: AppBarType.withText,
        title: 'View Journal',
      ),

      body: SingleChildScrollView(
        padding: Space.hf(24).copyWith(
          bottom: MediaQuery.of(context).padding.bottom + 24.h,
          top: 16.h,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 38.13.w,
                  height: 38.13.h,
                  decoration: BoxDecoration(
                    color: AppTheme.c.accent.purpleLight,
                    borderRadius: UIProps.radiusM,
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      'assets/svgs/calendar.2svg.svg',
                      width: 20.w,
                      height: 20.h,
                      colorFilter: ColorFilter.mode(
                        AppTheme.c.accent.purple!,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
                Space.xf(14),
                Text('5 May 2019', style: AppText.inter.b2!.w(6)),
              ],
            ),
            Space.yf(16),

            /// Time
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '9:45 AM',
                        style: AppText.inter.l1bm!.copyWith(
                          color: AppTheme.c.text.main,
                        ),
                      ),

                      Space.yf(5),

                      /// Title
                      Text('First day on the new job', style: AppText.b1bm),
                    ],
                  ),
                ),
                Container(
                  padding: Space.all(10, 8),
                  decoration: BoxDecoration(
                    color: AppTheme.c.primary.main,
                    borderRadius: BorderRadius.circular(50.r),
                  ),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/svgs/happy2.svg',
                        width: 14.w,
                        height: 14.h,
                      ),
                      Space.xf(4),
                      Text('Happy Day', style: AppText.inter.l1bm),
                    ],
                  ),
                ),
              ],
            ),
            Space.yf(16),
            Text(
              'Consequat dolore dolor cupidatat laborum. Enim exercitation ullamco minim est est cillum. Consequat aliquip dolor proident ad laborum sunt deserunt velit incididunt veniam in esse et nostrud.\n\nAd esse cillum laboris magna est in fugiat laborum irure sunt. Laborum ad aliqua sint in ut occaecat proident ut. Aliquip fugiat minim duis sit cillum lorem.\n\nMinim elit commodo minim fugiat. Exercitation et ea occaecat dolor ut. Id dolore proident minim culpa nulla minim irure excepteur sint minim.',
              style: AppText.inter.l1!.cl(AppTheme.c.text.main!),
            ),
          ],
        ),
      ),
    );
  }
}
