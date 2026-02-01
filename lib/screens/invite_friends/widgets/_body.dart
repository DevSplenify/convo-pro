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
                borderRadius: UIProps.buttonRadius,
                border: Border.all(
                  color: AppTheme.c.lightGrey.main!,
                  width: 1.w,
                ),
              ),
              child: Column(
                children: [
                  Image.asset('assets/pngs/Group.png', width: 165.5.h),
                  // Space.yf(24),
                  Text(
                    'Invite your friends',
                    style: AppText.h4bm!,
                    textAlign: TextAlign.center,
                  ),
                  Space.yf(4),
                  Text(
                    'Invite your friends to join the Convo Pro app',
                    textAlign: TextAlign.center,
                    style: AppText.inter.b2!,
                  ),
                  Space.yf(24),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: Space.all(18, 16),
                      decoration: BoxDecoration(
                        color: AppTheme.c.primary.main!,
                        borderRadius: UIProps.buttonRadius,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'invite./convopro./app',
                            style: AppText.inter.b2!.cl(AppTheme.c.white!),
                          ),
                          Text(
                            'Copy',
                            style: AppText.inter.b2b!.copyWith(
                              decoration: TextDecoration.underline,
                              decorationColor: AppTheme.c.white!,
                              color: AppTheme.c.white!,
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
