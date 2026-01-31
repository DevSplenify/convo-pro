part of '../invite_friends.dart';

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    _ScreenState.s(context);
    return Scaffold(
      appBar: CustomAppBar(title: 'Invite Friends', type: AppBarType.withText),
      body: Padding(
        padding: EdgeInsetsGeometry.only(
          top: 16.h,
          left: 20.w,
          right: 20.w,
          bottom: MediaQuery.of(context).padding.bottom + 10.h,
        ),
        child: Column(
          children: [
            Container(
              padding: Space.all(16, 45),
              decoration: BoxDecoration(
                color: AppTheme.c.background.shade200,
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(
                  color: AppTheme.c.lightGrey.main!,
                  width: 1.w,
                ),
              ),
              child: Column(
                children: [
                  SvgPicture.asset(
                    'assets/svgs/invite.svg',
                    width: 86.5.w,
                    height: 86.5.w,
                  ),
                  Space.yf(24),
                  Text(
                    'Invite friends to\n use Nureo',
                    style: AppText.h3bm!.w(6),
                    textAlign: TextAlign.center,
                  ),
                  Space.yf(8),
                  Text(
                    'Invite your friends to join the Nureo app and enjoy a healthier lifestyle together!',
                    textAlign: TextAlign.center,
                    style: AppText.b2!.cl(AppTheme.c.text.main!),
                  ),
                  Space.yf(24),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: Space.all(18, 17.5),
                      decoration: BoxDecoration(
                        color: AppTheme.c.primary.main!,
                        borderRadius: BorderRadius.circular(100.r),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Invite/.Nureo./app', style: AppText.b1bm!.w(6)),
                          Text(
                            'Copy',
                            style: AppText.b1bm!
                                .w(6)
                                .copyWith(
                                  decoration: TextDecoration.underline,
                                  decorationColor: AppTheme.c.text.shade800!,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
