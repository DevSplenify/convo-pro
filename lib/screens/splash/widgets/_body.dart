part of '../splash.dart';

class _Body extends StatefulWidget {
  const _Body();

  @override
  State<_Body> createState() => _BodyState();
}

class _BodyState extends State<_Body> {
  void _navigateToOnBoarding() {
    AppRoutes.onBoarding.pushReplace(context);
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 5000), _navigateToOnBoarding);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.c.background.main,
      extendBody: false,

      body: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).padding.bottom + 23.h,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Space.ym!,
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  AppStaticData.logo,
                  height: 101.5.h,
                  width: 77.w,
                ),
                Space.yf(9),
                Text('Convo Pro', style: AppText.h3b!.cl(AppTheme.c.black!)),
              ],
            ),
            Space.ym!,
            SizedBox(width: double.infinity),
          ],
        ),
      ),
    );
  }
}
