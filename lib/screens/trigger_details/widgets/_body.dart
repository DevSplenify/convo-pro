part of '../trigger_details.dart';

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    _ScreenState.s(context, true);
    return Scaffold(
      appBar: CustomAppBar(
        type: AppBarType.withWidget,
        title: 'Trigger Details',
        space: 16,
        trailingWidget: Row(
          children: [
            // Edit Icon
            GestureDetector(
              onTap: () {
                AppRoutes.editTrigger.push(context);
              },
              child: SvgPicture.asset(
                'assets/svgs/edit.svg',
                width: 20.w,
                height: 20.h,
              ),
            ),
            Space.xf(10),
            // Delete Icon
            SvgPicture.asset('assets/svgs/bin.svg', width: 20.w, height: 20.h),
          ],
        ),
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
              children: [
                Container(
                  width: 40.w,
                  height: 40.h,
                  decoration: BoxDecoration(
                    color: AppTheme.c.accent.yellow,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      'assets/svgs/sleep.svg',
                      width: 20.w,
                      height: 20.h,
                    ),
                  ),
                ),
                Space.xf(12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Lack of Sleep', style: AppText.b1bm!),
                    Space.yf(2),
                    Text(
                      'Active for 3 months',
                      style: AppText.inter.b2!.cl(AppTheme.c.text.main!),
                    ),
                  ],
                ),
                Space.xm!,
                chip(
                  text: 'Mood Trigger',
                  bgColor: AppTheme.c.accent.purpleLight!,
                  textColor: AppTheme.c.text.shade800!,
                  verticalPadding: 6,
                ),
              ],
            ),
            Space.yf(16),
            _buildMoodImpactCard(
              'Anxiety',
              'Entries logged with this trigger show a 68% correlation with heightened anxiety levels.',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMoodImpactCard(String causes, String details) {
    return Container(
      padding: Space.all(16),
      decoration: BoxDecoration(
        color: AppTheme.c.white,
        borderRadius: UIProps.radiusM,
        border: Border.all(color: AppTheme.c.lightGrey.main!, width: 1.w),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Mood Impact',
            style: AppText.inter.l1bm!.cl(AppTheme.c.primary.main!),
          ),
          Space.yf(5),
          Text('Usually Causes: $causes', style: AppText.b1bm!),
          Space.yf(5),
          Text(details, style: AppText.inter.b2!.cl(AppTheme.c.text.main!)),
        ],
      ),
    );
  }
}
