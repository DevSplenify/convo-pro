part of '../detailed_convo_templates.dart';

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    final state = _ScreenState.s(context, true);
    return Scaffold(
      backgroundColor: AppTheme.c.background.main,
      extendBody: false,
      body: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).padding.bottom + 23.h,
        ),
        child: Center(
          child: Text(
            'Detailed Convo Templates',
            style: AppText.h3b!.cl(AppTheme.c.black!),
          ),
        ),
      ),
    );
  }
}
