part of '../settings.dart';

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    final screenState = _ScreenState.s(context, true);
    return Scaffold(
      appBar: const CustomAppBar(type: AppBarType.withText, title: 'Settings'),

      body: SingleChildScrollView(
        padding: Space.hf(24).copyWith(
          bottom: MediaQuery.of(context).padding.bottom + 24.h,
          top: 16.h,
        ),
        child: Column(
          children: [
            _buildNavigationItem(
              'Profile Info',
              'assets/svgs/user_P.svg',
              () {},
            ),
            _buildSwitchItem(
              'Notifications',
              'assets/svgs/notification3.svg',
              screenState.notificationsEnabled,
              (bool value) {
                screenState.toggleNotifications(value);
              },
            ),
            _buildNavigationItem(
              'Upgrade Plan',
              'assets/svgs/chart.svg',
              () {},
            ),
            _buildNavigationItem('Help Center', 'assets/svgs/info.svg', () {}),
          ],
        ),
      ),
    );
  }

  Widget _buildNavigationItem(
    String title,
    String iconPath,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.translucent,
      child: Container(
        margin: EdgeInsets.only(bottom: 12.h),
        padding: Space.all(6, 5).copyWith(right: 10.5.w),
        decoration: BoxDecoration(
          color: AppTheme.c.white,
          borderRadius: UIProps.radiusM,
        ),
        child: Row(
          children: [
            Container(
              width: 42.w,
              height: 42.h,
              decoration: BoxDecoration(
                color: AppTheme.c.primary.shade200,
                borderRadius: UIProps.buttonRadius,
              ),
              child: Center(
                child: SvgPicture.asset(iconPath, width: 24.w, height: 24.h),
              ),
            ),
            Space.xf(12),
            Text(title, style: AppText.inter.b2!),
            Spacer(),
            SvgPicture.asset(
              'assets/svgs/arrow_right.svg',
              width: 24.w,
              height: 24.h,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSwitchItem(
    String title,
    String iconPath,
    bool value,
    ValueChanged<bool> onChanged,
  ) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: Space.all(6, 5).copyWith(right: 10.5.w),
      decoration: BoxDecoration(
        color: AppTheme.c.white,
        borderRadius: UIProps.radiusM,
      ),
      child: Row(
        children: [
          Container(
            width: 42.w,
            height: 42.h,
            decoration: BoxDecoration(
              color: AppTheme.c.primary.shade200,
              borderRadius: UIProps.buttonRadius,
            ),
            child: Center(
              child: SvgPicture.asset(iconPath, width: 24.w, height: 24.h),
            ),
          ),
          Space.xf(12),
          Text(title, style: AppText.inter.b2!),
          const Spacer(),
          SizedBox(
            width: 33.33.w,
            height: 20.h,
            child: Transform.scale(
              scale: 0.7,
              child: Switch(
                value: value,
                onChanged: onChanged,
                thumbColor: WidgetStateProperty.all(AppTheme.c.white!),
                trackOutlineColor: WidgetStateProperty.all(Colors.transparent),
                inactiveTrackColor: AppTheme.c.lightGrey.main!,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
