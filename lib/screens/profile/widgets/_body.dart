part of '../profile.dart';

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    _ScreenState.s(context, true);
    return Scaffold(
      appBar: const CustomAppBar(type: AppBarType.withText, title: 'Profile'),
      floatingActionButton: Padding(
        padding: Space.hf(24),
        child: AppButton(
          label: 'Edit Profile',
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
        child: Column(children: [Text('Profile content goes here')]),
      ),
    );
  }
}
