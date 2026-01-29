part of '../onboarding.dart';

class _Body extends StatefulWidget {
  const _Body();

  @override
  State<_Body> createState() => _BodyState();
}

class _BodyState extends State<_Body> {
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();

    /// 🔥 PRE-CACHE IMAGES
    WidgetsBinding.instance.addPostFrameCallback((_) {
      for (final item in onboardingData) {
        precacheImage(AssetImage(item['image']!), context);
      }
    });
  }

  void _nextPage() {
    if (_currentIndex < onboardingData.length - 1) {
      setState(() {
        _currentIndex++;
      });
    } else {
      AppRoutes.signUp.push(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentItem = onboardingData[_currentIndex];

    return Scaffold(
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            /// 🔵 Progress bar
            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top + 16.h,
                left: 16.w,
                right: 16.w,
              ),
              child: RoundedLinearProgress(
                value: (_currentIndex + 1) / onboardingData.length,
                height: 9.h,
                backgroundColor: AppTheme.c.white!,
                valueColor: AppTheme.c.primary.main!,
              ),
            ),

            Space.yf(32),

            /// 🖼 IMAGE BELOW PROGRESS BAR
            Image.asset(
              currentItem['image']!,
              height: 272.5.h,
              fit: BoxFit.contain,
            ),

            /// 🔥 Center content
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Space.yf(32),
                SvgPicture.asset(
                  AppStaticData.logo,
                  height: 78.h,
                  width: 59.5.w,
                ),
                Space.yf(24),

                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 250),
                  switchInCurve: Curves.easeOut,
                  switchOutCurve: Curves.easeIn,
                  child: Column(
                    key: ValueKey(currentItem['title']),
                    children: [
                      Text(
                        currentItem['title']!,
                        textAlign: TextAlign.center,
                        style: AppText.h3b,
                      ),
                      Space.yf(12),
                      Padding(
                        padding: Space.hf(24),
                        child: Text(
                          currentItem['subtitle']!,
                          textAlign: TextAlign.center,
                          style: AppText.inter.b2?.copyWith(
                            color: AppTheme.c.text.main,
                            height: 1.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            /// 🔥 Bottom buttons
            Padding(
              padding: EdgeInsets.only(
                left: 24.w,
                right: 24.w,
                bottom: MediaQuery.of(context).padding.bottom + 16.h,
              ),
              child: Column(
                children: [
                  Space.yf(18.5),
                  AppButton(
                    label: "Get Started",
                    onPressed: _nextPage,
                    hasShadow: true,
                  ),
                  Space.yf(12),
                  AppButton(
                    label: 'Sign Up',
                    onPressed: () {
                      AppRoutes.signUp.push(context);
                    },
                    buttonType: ButtonType.outlined,
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
