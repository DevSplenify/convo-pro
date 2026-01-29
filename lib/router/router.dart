import 'package:convo_pro/router/routes.dart';
import 'package:convo_pro/screens/onboarding/onboarding.dart';
import 'package:convo_pro/screens/sign_in/sign_in.dart';
import 'package:convo_pro/screens/splash/splash.dart';
import 'package:flutter/material.dart';

final Map<String, Widget Function(dynamic)> appRoutes = {
  AppRoutes.splash: (_) => const SplashScreen(),
  AppRoutes.onBoarding: (_) => const OnboardingScreen(),
  AppRoutes.signIn: (_) => const SignInScreen(),
  // AppRoutes.signUp: (_) => const CreateAccountScreen(),
  // AppRoutes.forgotPassword: (_) => const ForgotPasswordScreen(),
  // AppRoutes.linkSent: (_) => const LinkSentScreen(),
  // AppRoutes.resetPassword: (_) => const ResetPasswordScreen(),
};

void navigateToScreen(BuildContext context, Widget screen) {
  Navigator.push(
    context,
    SlideRoute(
      settings: RouteSettings(name: ModalRoute.of(context)?.settings.name),
      child: screen,
    ),
  );
}

void navigateToFullScreen(
  BuildContext context,
  String routeName, {
  Object? arguments,
}) {
  Navigator.of(
    context,
    rootNavigator: true,
  ).pushNamed(routeName, arguments: arguments);
}

Route<dynamic>? onGenerateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.splash:
      return FadeRoute(settings: settings, child: const SplashScreen());
    // case AppRoutes.bottomNav:
    //   return ScaleRoute(settings: settings, child: const CustomBottomNavBar());

    default:
      return null;
  }
}

////////////////////////////////////////////////////////////////////////Custom Routes for transitions////////////////////////////////////////////////////////////////////////
class FadeRoute extends PageRouteBuilder {
  final Widget child;

  @override
  final RouteSettings settings;

  FadeRoute({required this.child, required this.settings})
    : super(
        settings: settings,
        pageBuilder: (context, ani1, ani2) => child,
        transitionsBuilder: (context, ani1, ani2, child) {
          return FadeTransition(opacity: ani1, child: child);
        },
      );
}

class ScaleRoute extends PageRouteBuilder {
  final Widget child;

  @override
  final RouteSettings settings;

  ScaleRoute({required this.child, required this.settings})
    : super(
        settings: settings,
        pageBuilder: (context, ani1, ani2) => child,
        transitionsBuilder: (context, ani1, ani2, child) {
          final scaleAnimation = Tween(begin: 0.95, end: 1.0).animate(ani1);

          return ScaleTransition(scale: scaleAnimation, child: child);
        },
      );
}

// class SlideRoute extends PageRouteBuilder {
//   final Widget child;

//   @override
//   final RouteSettings settings;

//   SlideRoute({required this.child, required this.settings})
//     : super(
//         settings: settings,
//         pageBuilder: (context, ani1, ani2) => child,
//         transitionsBuilder: (context, ani1, ani2, child) {
//           const begin = Offset(1.0, 0.0);
//           const end = Offset.zero;
//           const curve = Curves.easeInOut;

//           final tween = Tween(
//             begin: begin,
//             end: end,
//           ).chain(CurveTween(curve: curve));
//           final offsetAnimation = ani1.drive(tween);
//           final fadeAnimation = ani1.drive(CurveTween(curve: Curves.easeInOut));

//           return SlideTransition(
//             position: offsetAnimation,
//             child: FadeTransition(opacity: fadeAnimation, child: child),
//           );
//         },
//         transitionDuration: const Duration(milliseconds: 600),
//       );
// }

class SlideRoute extends PageRouteBuilder {
  final Widget child;

  @override
  final RouteSettings settings;

  SlideRoute({required this.child, required this.settings})
    : super(
        settings: settings,
        pageBuilder: (context, animation, secondaryAnimation) => child,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0); // from right to left
          const end = Offset.zero;
          const curve = Curves.easeInOut;

          final tween = Tween(
            begin: begin,
            end: end,
          ).chain(CurveTween(curve: curve));

          final offsetAnimation = animation.drive(tween);

          return SlideTransition(position: offsetAnimation, child: child);
        },
        transitionDuration: const Duration(milliseconds: 400),
      );
}
