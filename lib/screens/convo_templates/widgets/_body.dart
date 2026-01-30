part of '../convo_templates.dart';

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    _ScreenState.s(context, true);
    return Scaffold(
      appBar: CustomAppBar(
        type: AppBarType.withWidget,
        title: 'Convo Templates',
        space: 16,
        trailingWidget: SvgPicture.asset(
          'assets/svgs/heart.svg',
          width: 20.w,
          height: 20.h,
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          left: 24.w,
          right: 24.w,
          top: 16.h,
          bottom: MediaQuery.of(context).padding.bottom + 10.h,
        ),
        child: Column(
          children: [
            SearchField(name: 'Search Templates', hint: 'Search Categories'),
            Space.yf(16),
          ],
        ),
      ),
    );
  }
}
