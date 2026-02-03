part of '../live_session.dart';

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    final screenState = _ScreenState.s(context, true);

    return Scaffold(
      appBar: const CustomAppBar(
        type: AppBarType.withText,
        title: 'Live Session',
      ),
      body: Padding(
        padding: Space.hf(24).copyWith(
          bottom: MediaQuery.of(context).padding.bottom + 24.h,
          top: 16.h,
        ),
        child: screenState.isSessionsEmpty
            ? _EmptyLiveSession(onTap: screenState.toggleSessionsEmpty)
            : Column(
                children: [
                  const LiveSessionCard(
                    imagePath: 'assets/pngs/pp2.png',
                    sessionBy: 'Gemma levitas',
                    sessionDateTime: '12/15/2025 at 04:00pm',
                  ),
                  Space.ym!,
                  AppButton(
                    label: 'Join Live Session',
                    onPressed: () {
                      AppRoutes.joinedLiveSession.push(context);
                    },
                    buttonType: ButtonType.primaryWithIconRight,
                    iconPath: 'assets/svgs/arrow-right2.svg',
                    iconSize: 20.w,
                  ),
                ],
              ),
      ),
    );
  }
}

class _EmptyLiveSession extends StatelessWidget {
  final VoidCallback onTap;

  const _EmptyLiveSession({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Space.xm!,
          Container(
            width: 60.w,
            height: 60.h,
            decoration: BoxDecoration(
              color: AppTheme.c.accent.red,
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Center(
              child: SvgPicture.asset(
                'assets/svgs/live.svg',
                width: 32.w,
                height: 32.h,
              ),
            ),
          ),
          SizedBox(height: 12.h),
          Text('No Live Session Available Yet !', style: AppText.b1b!),
          Space.yf(6),
          Text(
            'Live sessions will be displayed here if any are\ncurrently in progress.',
            style: AppText.inter.b2!.cl(AppTheme.c.text.main!),
            textAlign: TextAlign.center,
          ),
          Space.xm!,
          SizedBox(width: double.infinity),
        ],
      ),
    );
  }
}
