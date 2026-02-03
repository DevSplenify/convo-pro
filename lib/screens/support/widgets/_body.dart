part of '../support.dart';

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    _ScreenState.s(context, true);
    return Scaffold(
      appBar: const CustomAppBar(type: AppBarType.withText, title: 'Support'),
      body: SingleChildScrollView(
        padding: Space.hf(24).copyWith(
          bottom: MediaQuery.of(context).padding.bottom + 24.h,
          top: 16.h,
        ),
        child: Column(
          children: [
            _buildSupportItem(
              'Email Address',
              'usersupport123@gmail.com',
              'assets/svgs/templets.svg',
              AppTheme.c.primary.main!,
            ),
            _buildSupportItem(
              'Phone number',
              '+1 234 567 890',
              'assets/svgs/phone.svg',
              AppTheme.c.accent.yellow!,
            ),
            _buildSupportItem(
              'Website URL',
              'www.usersupport.com',
              'assets/svgs/globe.svg',
              AppTheme.c.accent.purple!,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSupportItem(
    String title,
    String subtitle,
    String iconPath,
    Color iconBgColor,
  ) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: Space.all(12).copyWith(bottom: 15.h),
      decoration: BoxDecoration(
        color: AppTheme.c.white,
        borderRadius: UIProps.radiusM,
      ),
      child: Row(
        children: [
          Container(
            width: 40.w,
            height: 40.h,
            decoration: BoxDecoration(
              color: iconBgColor,
              borderRadius: UIProps.buttonRadius,
            ),
            child: Center(
              child: SvgPicture.asset(
                iconPath,
                width: 24.w,
                height: 24.h,
                colorFilter: ColorFilter.mode(
                  AppTheme.c.white!,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
          Space.xf(10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: AppText.inter.b2!),
              Space.yf(4),
              Text(
                subtitle,
                style: AppText.inter.l1!.copyWith(color: AppTheme.c.text.main),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
