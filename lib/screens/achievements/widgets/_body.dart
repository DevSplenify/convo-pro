part of '../achievements.dart';

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    _ScreenState.s(context, true);
    return Scaffold(
      appBar: const CustomAppBar(
        type: AppBarType.withText,
        title: 'My Achievements',
      ),

      body: SingleChildScrollView(
        padding: Space.hf(24).copyWith(
          bottom: MediaQuery.of(context).padding.bottom + 24.h,
          top: 16.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                _buildAchievementCard('Basic', 'assets/pngs/basic.png'),
                _buildAchievementCard('Advanced', 'assets/pngs/advanced.png'),
                _buildAchievementCard('Pro', 'assets/pngs/pro.png'),
              ],
            ),
            Space.yf(15),
            _buildAchievementCard('Premium', 'assets/pngs/premium.png'),
          ],
        ),
      ),
    );
  }

  Widget _buildAchievementCard(String title, String badgePath) {
    return Container(
      padding: Space.all(14, 16).copyWith(bottom: 8),
      decoration: BoxDecoration(
        color: AppTheme.c.white,
        borderRadius: UIProps.radiusM,
        border: Border.all(color: AppTheme.c.lightGrey.main!),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 25,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(title, style: AppText.inter.l1bm),
          Space.yf(8),
          Image.asset(badgePath, height: 74.h, width: 74.w),
        ],
      ),
    );
  }
}
