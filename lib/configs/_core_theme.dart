part of 'configs.dart';

const fontFamily = 'Aeonik';

final themeLight = ThemeData(
  appBarTheme: AppBarTheme(
    backgroundColor: AppTheme.light.background.main,
    foregroundColor: AppTheme.light.text.main,
    elevation: 0,
    iconTheme: IconThemeData(color: AppTheme.light.primary.main),
  ),
  useMaterial3: true,
  navigationBarTheme: NavigationBarThemeData(
    backgroundColor: Colors.transparent,
    indicatorColor: AppTheme.light.text.shade600,

    iconTheme: WidgetStateProperty.all(
      IconThemeData(color: AppTheme.light.primary.main),
    ),
  ),
  primaryColor: AppTheme.light.primary.main,
  brightness: Brightness.light,
  splashColor: Colors.transparent,
  highlightColor: Colors.transparent,
  scaffoldBackgroundColor: AppTheme.light.background.main,
  scrollbarTheme: ScrollbarThemeData(
    thumbColor: WidgetStateProperty.all(AppTheme.light.primary.main),
  ),
  primaryColorDark: AppTheme.light.primary.main,
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    foregroundColor: AppTheme.light.primary.main,
  ),
  pageTransitionsTheme: const PageTransitionsTheme(
    builders: {
      TargetPlatform.android: ZoomPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
    },
  ),
  colorScheme: ThemeData.light().colorScheme.copyWith(
    secondary: AppTheme.light.primary.main,
    surface: AppTheme.light.background.main,
    onSurface: AppTheme.light.text.main,
    primary: AppTheme.light.primary.main,
  ),
);
