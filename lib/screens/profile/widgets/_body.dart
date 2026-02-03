part of '../profile.dart';

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    _ScreenState.s(context, true);
    return Scaffold(
      appBar: const CustomAppBar(
        type: AppBarType.textOnlyLeft,
        title: 'Profile',
      ),

      body: SingleChildScrollView(
        padding: Space.hf(24).copyWith(
          bottom: MediaQuery.of(context).padding.bottom + 24.h,
          top: 16.h,
        ),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 25.r,
                  backgroundImage: AssetImage('assets/pngs/pp.png'),
                ),
                Space.xf(10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Mufidul', style: AppText.b1bm),
                    Text(
                      'user123@gmail.com',
                      style: AppText.inter.b2!.copyWith(
                        color: AppTheme.c.text.main,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Space.yf(20),
            _buildPremiumAccessCard(),
            Space.yf(20),
            _buildNavigationItem('Edit Profile', 'assets/svgs/user_P.svg', () {
              AppRoutes.editProfile.push(context);
            }),
            _buildNavigationItem('Settings', 'assets/svgs/setting.svg', () {
              AppRoutes.settings.push(context);
            }),
            _buildNavigationItem(
              'My Achievements',
              'assets/svgs/achievements.svg',
              () {
                AppRoutes.achievements.push(context);
              },
            ),
            _buildNavigationItem(
              'Locked Journals',
              'assets/svgs/over_smile.svg',
              () {
                AppRoutes.lockedJournals.push(context);
              },
            ),
            _buildNavigationItem('Support', 'assets/svgs/exclamation .svg', () {
              AppRoutes.support.push(context);
            }),
            _buildNavigationItem('FAQ’s', 'assets/svgs/question.svg', () {
              AppRoutes.faqs.push(context);
            }),
            Space.yf(24),
            AppButton(
              label: 'Delete Account',
              onPressed: () {},
              buttonType: ButtonType.primaryWithIconLeft,
              iconPath: 'assets/svgs/bin.svg',
              iconColor: AppTheme.c.white,
              iconSize: 20.w,
            ),
            Space.yf(12),
            AppButton(
              label: 'Logout',
              onPressed: () {},
              buttonType: ButtonType.outlined,
              backgroundColor: AppTheme.c.background.main,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPremiumAccessCard() {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.c.primary.shade300,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Padding(
              padding: Space.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Premium Access', style: AppText.b1bm),
                  Space.yf(8),
                  Text(
                    'Access all advanced features in your premium access',
                    style: AppText.inter.b2,
                  ),
                  Space.yf(8),
                  Container(
                    padding: Space.all(16, 10),
                    decoration: BoxDecoration(
                      color: AppTheme.c.primary.shade500,
                      borderRadius: UIProps.buttonRadius,
                    ),
                    child: Text(
                      'Unlock Access',
                      style: AppText.inter.l1b!.copyWith(
                        color: AppTheme.c.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 8.w),
            child: SvgPicture.asset(
              'assets/svgs/crown.svg',
              width: 100.w,
              height: 100.h,
            ),
          ),
        ],
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
            Text(title, style: AppText.inter.b2!.w(6)),
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
}
