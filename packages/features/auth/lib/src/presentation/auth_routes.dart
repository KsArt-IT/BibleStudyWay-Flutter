import 'package:auth/src/presentation/screens/login/login_providers.dart';
import 'package:auth/src/presentation/screens/login/login_screen.dart';
import 'package:auth/src/presentation/screens/registration/registration_providers.dart';
import 'package:auth/src/presentation/screens/registration/registration_screen.dart';
import 'package:auth/src/presentation/screens/reset_password/reset_password_providers.dart';
import 'package:auth/src/presentation/screens/reset_password/reset_password_screen.dart';
import 'package:go_router/go_router.dart';

abstract final class AuthRoutes {
  static const String splashScreenName = 'splash_screen';
  static const String splashScreenPath = '/splash';

  static const String loginScreenName = 'login_screen';
  static const String loginScreenPath = '/login';

  static const String registrationScreenName = 'registration_screen';
  static const String _registrationScreenPath = '/registration';

  static const String resetPasswordScreenName = 'reset_password_screen';
  static const String _resetPasswordScreenPath = '/reset_password';

  static GoRoute buildRoutes({List<RouteBase> routes = const []}) => GoRoute(
    path: loginScreenPath,
    name: loginScreenName,
    builder: (context, state) => const LoginProviders(child: LoginScreen()),
    routes: [
      if (routes.isNotEmpty) ...routes,
      GoRoute(
        path: _registrationScreenPath,
        name: registrationScreenName,
        builder: (context, state) => const RegistrationProviders(child: RegistrationScreen()),
      ),
      GoRoute(
        path: _resetPasswordScreenPath,
        name: resetPasswordScreenName,
        builder: (context, state) => const ResetPasswordProviders(child: ResetPasswordScreen()),
      ),
    ],
  );
}
