part of '../home.dart';

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    _ScreenState.s(context, true);
    return Scaffold(
      backgroundColor: AppTheme.c.background.main,
      extendBody: false,
      body: Column(children: [_UserHeader()]),
    );
  }
}
