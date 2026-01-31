part of 'configs.dart';

abstract class UIProps {
  // Animations
  static Duration duration0 = const Duration(milliseconds: 150);
  static Duration duration = const Duration(milliseconds: 280);
  static Duration duration2 = const Duration(milliseconds: 400);

  // Paddings
  static EdgeInsets? btnPadMed;
  static EdgeInsets? btnPadSm;

  // Radius
  static double radius = 15;
  static BorderRadius? tabRadius;
  static BorderRadius? buttonRadius;
  static BorderRadius? radiusS;
  static BorderRadius? radiusM;
  static BorderRadius? radiusL;
  static BorderRadius? radiusXL;
  static BoxDecoration? borderButton;
  static BorderRadius? topBoth15;
  static BorderRadius? topBoth20;

  // Shadows
  static List<BoxShadow>? cardShadow;
  static List<BoxShadow>? buttonShadow;
  static List<BoxShadow>? bottomNavigationShadow;
  // BoxDecoration
  static BoxDecoration? boxCard;
  static BoxDecoration? popupCard;

  static void init(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(375, 812));

    initRadius(context);
    initButtons();
    initShadows();
    initBoxDecorations();
  }

  static void initRadius(BuildContext context) {
    tabRadius = BorderRadius.circular(radius * 2);
    buttonRadius = BorderRadius.circular(ScreenUtil().radius(12));

    radiusS = BorderRadius.circular(ScreenUtil().radius(8));
    radiusM = BorderRadius.circular(ScreenUtil().radius(16));
    radiusL = BorderRadius.circular(ScreenUtil().radius(25));
    radiusXL = BorderRadius.circular(ScreenUtil().radius(45));
    topBoth15 = BorderRadius.only(
      topLeft: Radius.circular(ScreenUtil().radius(15)),
      topRight: Radius.circular(ScreenUtil().radius(15)),
    );
    topBoth20 = BorderRadius.only(
      topLeft: Radius.circular(ScreenUtil().radius(20)),
      topRight: Radius.circular(ScreenUtil().radius(20)),
    );
  }

  static void initButtons() {
    borderButton = BoxDecoration(
      borderRadius: UIProps.buttonRadius,
      border: Border.all(width: 1.4, color: AppTheme.c.text.shade800!),
    );
    btnPadSm = EdgeInsets.symmetric(
      horizontal: AppDimensions.padding! * 2,
      vertical: AppDimensions.padding! * 1.0,
    );
    btnPadMed = EdgeInsets.symmetric(
      horizontal: AppDimensions.padding! * 3,
      vertical: AppDimensions.padding! * 1.5,
    );
  }

  static void initShadows() {
    cardShadow = [
      BoxShadow(color: Color(0x0D3F3C36), blurRadius: 16, offset: Offset(0, 8)),
    ];
    buttonShadow = [
      BoxShadow(
        color: AppTheme.c.primary.main!.withValues(alpha: 0.34),
        blurRadius: 17.8,
        offset: const Offset(0, 9),
      ),
    ];
    bottomNavigationShadow = [
      BoxShadow(
        color: AppTheme.c.background.shade200!,
        blurRadius: 6,
        spreadRadius: 0,
        offset: const Offset(4, 0),
      ),
    ];
  }

  static void initBoxDecorations() {
    boxCard = BoxDecoration(
      borderRadius: BorderRadius.circular(16.r),
      color: AppTheme.c.white,
      border: Border.all(color: AppTheme.c.lightGrey.main!, width: 1.w),
    );
  }
}
