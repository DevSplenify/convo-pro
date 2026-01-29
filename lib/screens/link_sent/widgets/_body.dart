part of '../link_sent.dart';

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: CustomAppBar(),
      body: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).padding.bottom + 10.h,
          left: 24.w,
          right: 24.w,
          top: 16.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(
              'assets/svgs/mail.svg',
              width: 54.5.w,
              height: 54.5.h,
            ),
            Space.yf(16),
            // AppHeadings(
            //   title: 'Password link has sent!',
            //   subtitle:
            //       'Check your inbox to get the password link and reset your password.',
            //   isCentered: false,
            // ),
            // Space.ym!,
            // AppButton(
            //   label: 'Check Inbox',
            //   onPressed: () {
            //     AppRoutes.resetPassword.push(context);
            //   },
            //   buttonType: ButtonType.primaryWithIconRight,
            //   iconPath: 'assets/svgs/sms_out.svg',
            // ),
          ],
        ),
      ),
    );
  }
}
