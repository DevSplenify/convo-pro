part of '../detailed_recent_logs.dart';

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    _ScreenState.s(context, true);
    return Scaffold(
      appBar: const CustomAppBar(
        type: AppBarType.withText,
        title: '21 Dec, 2025',
      ),
      body: SingleChildScrollView(
        padding: Space.hf(24).copyWith(
          bottom: MediaQuery.of(context).padding.bottom + 24.h,
          top: 16.h,
        ),
        child: Column(
          children: [
            buildMoodContainer('Mood', 'Sad', 'assets/svgs/sad.svg'),
            Space.yf(12),
            buildMoodContainer('Confidence', 'High', 'assets/svgs/smilee.svg'),
            Space.yf(12),
            buildMoodContainer(
              'Social Energy',
              'Neutral',
              'assets/svgs/happy.svg',
            ),
            Space.yf(16),
            DeatilsHeadings(
              title: 'Your Notes',
              subtitle:
                  'There are many variations of passages of Lorem  Ipsum available, but the majority have suffered  alteration in some form, by injected humour. There are many variations of passages of Lorem  Ipsum available, but the majority have suffered  alteration in some form, by injected humour.\n\nThere are many variations of passages of Lorem  Ipsum available, but the majority have suffered  alteration in some form, by injected humour. There are many variations of passages of Lorem  Ipsum available, but the majority have suffered  alteration in some form, by injected humour.',
            ),
          ],
        ),
      ),
    );
  }
}
