part of '../detail_audio_session.dart';

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    _ScreenState.s(context, true);
    return Scaffold(
      appBar: CustomAppBar(title: 'Session Topic 1', type: AppBarType.withText),
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
            Text('Session Topic 1', style: AppText.h4b),
            Space.yf(4),
            Text(
              'By Robert Alfredo',
              style: AppText.inter.l1!.cl(AppTheme.c.text.main!),
            ),
            Space.yf(12),

            AudioPlayerWidget(
              onPlayPausePressed: () {
                debugPrint('Play/Pause pressed');
              },
            ),
            Space.yf(12),
            Padding(
              padding: Space.hf(8.5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Audio Duration',
                    style: AppText.inter.l2!.cl(AppTheme.c.text.main!),
                  ),
                  Text(
                    '2:32/5:55',
                    style: AppText.inter.l2!.cl(AppTheme.c.text.main!),
                  ),
                ],
              ),
            ),
            Space.yf(12),
            DeatilsHeadings(
              title: 'Transcript',
              subtitle:
                  'There are many variations of passages of Lorem  Ipsum available, but the majority have suffered  alteration in some form, by injected humour. There are many variations of passages of Lorem  Ipsum available, but the majority have suffered  alteration in some form, by injected humour.There are many variations of passages of Lorem  Ipsum available, but the majority have suffered  alteration in some form, by injected humour. There are many variations of passages...',
            ),
          ],
        ),
      ),
    );
  }
}
