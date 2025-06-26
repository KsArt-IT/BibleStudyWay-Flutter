import 'package:go_router/go_router.dart';
import 'package:splash/src/ui/splash_screen.dart';

abstract final class SplashRoutes {
  static const String path = '/splash';
  static const String name = 'splash';

  static GoRoute buildRoutes() => GoRoute(
    path: path,
    name: name,
    builder: (context, state) => const SplashScreen(),
  );
}
