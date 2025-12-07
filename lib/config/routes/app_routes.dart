import 'package:x_deal/features/authentication/presentation/screens/add_phone_screen.dart';
import 'package:x_deal/features/authentication/presentation/screens/success_phone.dart';
import 'package:x_deal/features/forget_password/presentation/screens/enter_code_screen.dart';
import 'package:x_deal/features/forget_password/presentation/screens/forget_password_screen.dart';
import 'package:x_deal/features/forget_password/presentation/screens/success_password.dart';
import 'package:x_deal/features/authentication/presentation/screens/otp_screen.dart';
import 'package:x_deal/features/authentication/presentation/screens/sign_up_by_phone_or_email.dart';
import 'package:x_deal/features/authentication/presentation/screens/sign_up_screen.dart';
import 'package:x_deal/features/on_boarding/presentation/screens/onboarding_screen.dart';

import 'package:nested/nested.dart';

import '../../exports.dart';

import '../../features/authentication/presentation/widgets/gift_pop_up.dart';
import '../../features/authentication/presentation/screens/login_screen.dart';
import '../../features/forget_password/presentation/screens/reset_password.dart';
import '../../features/splash_screen/presentation/screens/splash_screen.dart';
import '../../features/store_details/presentation/screens/store_details_screen.dart';

class RouteGenerator {
  AnimationType? pageRouteAnimationGlobal;
  static Duration pageRouteTransitionDurationGlobal = 400.milliseconds;
  static Route<T>? generateRoute<T>(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splashScreen:
        return buildPageRoute<T>(
          child: SplashScreen(),
          routeSettings: routeSettings,
        );
      case Routes.onBoardingRoute:
        return buildPageRoute<T>(
          child: OnboardingScreen(),
          routeSettings: routeSettings,
        );
      case Routes.signUpByPhoneOrEmail:
        return buildPageRoute<T>(
          child: SignUpByPhoneOrEmail(),
          providers: [
            BlocProvider(create: (BuildContext context) => ErrorCubit()),
          ],
          routeSettings: routeSettings,
        );
      case Routes.signUp:
        return buildPageRoute<T>(
          child: SignUpScreen(),
          providers: [
            BlocProvider(create: (BuildContext context) => ErrorCubit()),
          ],
          routeSettings: routeSettings,
        );
      case Routes.otpRoute:
        return buildPageRoute<T>(
          child: OtpScreen(),
          providers: [
            BlocProvider(create: (BuildContext context) => ErrorCubit()),
          ],
          routeSettings: routeSettings,
        );
      case Routes.loginRoute:
        return buildPageRoute<T>(
          providers: [
            BlocProvider<ErrorCubit>(create: (context) => ErrorCubit()),
          ],
            child: LoginScreen(),
          routeSettings: routeSettings,
        );
        case Routes.forgetPasswordRoute:
        return buildPageRoute<T>(
          providers: [
            BlocProvider<ErrorCubit>(create: (context) => ErrorCubit()),
          ],
            child: ForgetPasswordScreen(),
          routeSettings: routeSettings,
        );
        case Routes.enterCodeRoute:
        return buildPageRoute<T>(
          providers: [
            BlocProvider<ErrorCubit>(create: (context) => ErrorCubit()),
          ],
            child: EnterCodeScreen(),
          routeSettings: routeSettings,
        );
        case Routes.resetPasswordRoute:
        return buildPageRoute<T>(
          providers: [
            BlocProvider<ErrorCubit>(create: (context) => ErrorCubit()),
          ],
            child: ResetPasswordScreen(),
          routeSettings: routeSettings,
        );
        case Routes.successPassword:
        return buildPageRoute<T>(
            child: SuccessPassword(),
          routeSettings: routeSettings,
        );
        case Routes.successPhone:
        return buildPageRoute<T>(
            child: SuccessPhone(),
          routeSettings: routeSettings,
        );
        case Routes.addPhone:
        return buildPageRoute<T>(
          providers: [
            BlocProvider<ErrorCubit>(create: (context) => ErrorCubit()),
          ],
            child: AddPhoneScreen(),
          routeSettings: routeSettings,
        );
        case Routes.storeDetails:
        return buildPageRoute<T>(

            child: StoreDetailsScreen(),
          routeSettings: routeSettings,
        );


      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(
              child: Text("No route defined for ${routeSettings.name}"),
            ),
          ),
        );
    }
  }

  static Route<T> buildPageRoute<T>({
    required Widget child,
    AnimationType? pageRouteAnimation = AnimationType.fade,
    Duration? duration,
    RouteSettings? routeSettings,
    List<SingleChildWidget>? providers,
  }) {
    if (providers.isNotNullOrEmpty) {
      child = MultiBlocProvider(providers: providers!, child: child);
    }
    if (pageRouteAnimation == AnimationType.rotate) {
      return PageRouteBuilder<T>(
        settings: routeSettings,
        pageBuilder: (context, a1, a2) => child,
        transitionsBuilder: (c, anim, a2, child) {
          return RotationTransition(
            child: child,
            turns: ReverseAnimation(anim),
          );
        },
        transitionDuration: duration ?? pageRouteTransitionDurationGlobal,
      );
    } else if (pageRouteAnimation == AnimationType.scale) {
      return PageRouteBuilder<T>(
        settings: routeSettings,
        pageBuilder: (context, a1, a2) => child,
        transitionsBuilder: (c, anim, a2, child) {
          return ScaleTransition(child: child, scale: anim);
        },
        transitionDuration: duration ?? pageRouteTransitionDurationGlobal,
      );
    } else if (pageRouteAnimation == AnimationType.slide) {
      return PageRouteBuilder<T>(
        settings: routeSettings,
        pageBuilder: (context, a1, a2) => child,
        transitionsBuilder: (c, anim, a2, child) {
          return SlideTransition(
            child: child,
            position: Tween(
              begin: const Offset(1.0, 0.0),
              end: const Offset(0.0, 0.0),
            ).animate(anim),
          );
        },
        transitionDuration: duration ?? pageRouteTransitionDurationGlobal,
      );
    } else if (pageRouteAnimation == AnimationType.slideBottomTop) {
      return PageRouteBuilder<T>(
        settings: routeSettings,
        pageBuilder: (context, a1, a2) => child,
        transitionsBuilder: (c, anim, a2, child) {
          return SlideTransition(
            position: Tween(
              begin: const Offset(0.0, 1.0),
              end: const Offset(0.0, 0.0),
            ).animate(anim),
            child: child,
          );
        },
        transitionDuration: duration ?? pageRouteTransitionDurationGlobal,
      );
    }

    return PageRouteBuilder<T>(
      settings: routeSettings,
      transitionDuration: duration ?? pageRouteTransitionDurationGlobal,
      reverseTransitionDuration: const Duration(milliseconds: 50),
      pageBuilder: (context, a1, a2) => child,
      transitionsBuilder: (c, anim, a2, child) {
        return FadeTransition(opacity: anim, child: child);
      },
    );
  }
}
