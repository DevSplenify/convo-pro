part of 'configs.dart';

class AppTheme {
  static final _core = AppCoreTheme(
    // PRIMARY group
    primary: ColorShades(
      main: const Color(0xFF897DF7), // primary
      shade100: const Color(0xFFF3F2FE),
      shade200: const Color(0xFFEDECFE),
      shade300: const Color(0xFFDAD7FD),
      shade500: const Color(0xFF7B71DE),
      shade600: const Color(0xFF675EB9),
      shade700: const Color(0xFF3E386F),
      shade800: const Color(0xFF302C56),
    ),

    // ACCENT group
    accent: AccentColors(
      // orange: const Color(0xFFFFCC00),
      yellowLight: const Color(0xFFFDF4D9),
      yellow: const Color(0xFFF2B700),
      purpleLight: const Color(0xFFF8E7FD),
      purple: const Color(0xFFE9B3F7),
      red: const Color(0xFFF65555),
    ),

    // BACKGROUND group
    background: ColorShades(
      shade100: const Color(0xFFFBFBFC), //
      shade200: const Color(0xFFFDFDFE), //
      shade400: const Color(0xFFE0E0E2), //
      shade500: const Color(0xFFBBBBBC), //

      main: const Color(0xFFF9F9FB), // background
    ),

    // TEXT group
    text: ColorShades(
      main: const Color(0xFF737B98), // grey
      shade100: const Color(0xFFC1C7D0), //
      shade200: const Color(0xFFA4ACB9), //
      shade300: const Color(0xFF818898), //
      shade600: const Color(0xFF353449), //
      shade700: const Color(0xFF2A293B), //
      shade800: const Color(0xFF2A293B), //
    ),

    // LIGHT GREY group
    lightGrey: ColorShades(
      main: const Color(0xFFE8E9EC), // lightGrey
      shade300: const Color(0xFFECEFF3), //
      shade200: const Color(0xFFF6F8FA), //
      shade100: const Color(0xFFF8FAFB), //
      shade400: const Color(0xFFD9D9D9), //
    ),

    //Error Group
    error: ColorShades(main: Color(0xFFF65555), shade100: Color(0xFFFEE6E6)),

    // SINGLE COLORS (no shades)
    white: const Color(0xFFFFFFFF), //
    black: const Color(0xFF2B2A2F), //
  );

  static AppCoreTheme light = _core;
  static AppCoreTheme dark = _core;

  static late AppCoreTheme c;

  static bool isDark(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark;

  static void init(BuildContext context) {
    c = isDark(context) ? dark : light;
  }
}
