part of '../detail_text_session.dart';

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    _ScreenState.s(context, true);
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Session Topic 1',
        type: AppBarType.withWidget,
        space: 16,
        trailingWidget: SvgPicture.asset(
          'assets/svgs/3_dots.svg',
          height: 24.h,
          width: 24.w,
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          top: 16.h,
          left: 24.w,
          right: 24.w,
          bottom: MediaQuery.of(context).padding.bottom + 10.h,
        ),
        child: Column(
          children: [
            DeatilsHeadings(
              title: 'Overview',
              subtitle:
                  'There are many variations of passages of Lorem  Ipsum available, but the majority have suffered  alteration in some form, by injected humour. There are many variations of passages of Lorem  Ipsum available, but the majority have suffered  alteration in some form, by injected humour.',
            ),
            Space.yf(16),
            DeatilsHeadings(
              title: 'Main Concept',
              subtitle:
                  'There are many variations of passages of Lorem  Ipsum available, but the majority have suffered  alteration in some form, by injected humour. There are many variations of passages of Lorem  Ipsum available, but the majority have suffered  alteration in some form, by injected humour.',
            ),
            Space.yf(16),
            DeatilsHeadings(
              title: 'Climax',
              subtitle:
                  'There are many variations of passages of Lorem  Ipsum available, but the majority have suffered  alteration in some form, by injected humour. There are many variations of passages of Lorem  Ipsum available, but the majority have suffered  alteration in some form, by injected humour.',
            ),
          ],
        ),
      ),
    );
  }
}
