part of '../payment_success.dart';

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    _ScreenState.s(context, true);
    return Scaffold(
      appBar: const CustomAppBar(
        type: AppBarType.withText,
        title: 'Payment Success',
      ),
      body: SingleChildScrollView(
        padding: Space.hf(24).copyWith(
          bottom: MediaQuery.of(context).padding.bottom + 24.h,
          top: 16.h,
        ),
        child: Column(
          children: [
            SvgPicture.asset(
              'assets/svgs/check round.svg',
              width: 32.w,
              height: 32.h,
            ),
            Space.yf(12),
            Text(
              'Payment Successful!',
              style: AppText.h4bm!.cl(AppTheme.c.primary.main!),
            ),
            Space.yf(8),
            Text(
              'IDR 1,000,000',
              style: AppText.h2bm,
              textAlign: TextAlign.center,
            ),
            Space.yf(24),
            Container(
              padding: Space.all(8),
              decoration: BoxDecoration(
                color: AppTheme.c.white!,
                borderRadius: UIProps.radiusM,
                boxShadow: [
                  BoxShadow(
                    color: Color(0x1FAAAAAA),
                    blurRadius: 24,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    padding: Space.vf(18),
                    decoration: BoxDecoration(
                      color: AppTheme.c.primary.shade300!,
                      borderRadius: UIProps.buttonRadius,
                    ),
                    child: Center(
                      child: Text('Payment Details', style: AppText.b1bm),
                    ),
                  ),
                  Space.yf(18),
                  _buildDetailRow('Ref Number', '000085752257'),
                  _buildDetailRow('Payment Time', '25-02-2023, 13:22:16'),
                  _buildDetailRow('Payment Method', 'Visa **** 1234'),
                  _buildDetailRow('Sender Name', 'Antonio Roberto'),
                  Space.yf(2),
                  Padding(
                    padding: Space.hf(8),
                    child: DottedLine(
                      lineThickness: 2,

                      colors: [
                        AppTheme.c.lightGrey.main!,
                        AppTheme.c.lightGrey.main!,
                      ],
                      shadowBlurRadius: 0,
                      shadowColor: Colors.transparent,
                    ),
                  ),
                  Space.yf(16),
                  _buildDetailRow('Amount', 'IDR 1,000,000'),
                  _buildDetailRow('Admin Fee', 'IDR 193.0'),
                  _buildStatusRow('Successful'),
                ],
              ),
            ),
            Space.yf(24),
            AppButton(
              label: 'Continue',
              onPressed: () {
                Navigator.of(context).popUntil(
                  (route) =>
                      route.settings.name == AppRoutes.bottomNavbar ||
                      route.isFirst,
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 7.w).copyWith(bottom: 14.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: AppText.inter.b2!.cl(AppTheme.c.text.main!)),
          Text(value, style: AppText.inter.b2bm!.w(6)),
        ],
      ),
    );
  }

  Widget _buildStatusRow(String status) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 7.w).copyWith(bottom: 14.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Payment Status',
            style: AppText.inter.b2!.cl(AppTheme.c.text.main!),
          ),
          Container(
            padding: Space.all(10, 4),
            decoration: BoxDecoration(
              color: AppTheme.c.primary.shade200!,
              borderRadius: BorderRadius.circular(20.r),
            ),
            alignment: Alignment.center,

            child: Text(
              status,
              style: AppText.inter.l2!
                  .w(6)
                  .cl(
                    status == 'Successful'
                        ? Color(0xFF34C759)
                        : AppTheme.c.accent.red!,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
