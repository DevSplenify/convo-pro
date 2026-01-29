part of '../link_sent.dart';

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).padding.bottom + 16.h,
          left: 24.w,
          right: 24.w,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(
              'assets/svgs/email.svg',
              width: 56.72.w,
              height: 56.72.h,
            ),
            Space.yf(16),
            AppHeadings(
              title: 'Check Your Email',
              subtitle:
                  'Click On The Reset Password Link Sent To Your Email aya*****@gmail.com',
              isCentered: false,
              spacingBetweenTitleAndSubtitle: 8,
            ),
            Space.ym!,
            AppButton(
              label: 'Reset Password',
              onPressed: () {
                AppRoutes.resetPassword.push(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
