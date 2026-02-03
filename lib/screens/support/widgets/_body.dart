part of '../support.dart';

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    _ScreenState.s(context, true);
    return Scaffold(
      appBar: const CustomAppBar(type: AppBarType.withText, title: 'Support'),
      floatingActionButton: Padding(
        padding: Space.hf(24),
        child: AppButton(
          label: 'Contact Support',
          onPressed: () {},
          buttonType: ButtonType.primaryWithIconLeft,
          iconPath: 'assets/svgs/plus.svg',
          iconSize: 20,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SingleChildScrollView(
        padding: Space.hf(24).copyWith(
          bottom: MediaQuery.of(context).padding.bottom + 24.h,
          top: 16.h,
        ),
        child: Column(children: [Text('Support content goes here')]),
      ),
    );
  }
}
