import 'package:go_router/go_router.dart';
import 'package:school_erp/ui/screens/calendar_screen.dart';
import 'package:school_erp/ui/screens/create_pin_screen.dart';
import 'package:school_erp/ui/screens/dashboard_screen.dart';
import 'package:school_erp/ui/screens/home_screen.dart';
import 'package:school_erp/ui/screens/login_screen.dart';
import 'package:school_erp/ui/screens/splash_screen.dart';
import 'package:school_erp/ui/screens/verification_screen.dart';

GoRouter appRouter = GoRouter(
  initialLocation: "/",
  routes: [
    GoRoute(path: "/", builder: (context, state) => SplashScreen()),
    GoRoute(path: "/login/Screen", builder: (context, state) => LoginScrenn()),
    GoRoute(
      path: "/Verificatin/Screen",
      builder: (context, state) => VerificationScreen(),
    ),
    GoRoute(path: "/home/Screen",
    builder: (context, state) => HomeScreen(),
    ),
    GoRoute(
      path: "/CreatePin/Screen",
      builder: (context, state) => CreatePinScreen(),
    ),
    GoRoute(
      path: "/dashbord/screen",
      builder: (context, state) => DashboardScreen(),
    ),
    GoRoute(
      path: "/calendar/Screen",
      builder: (context, state) => CalanderScreen(),
    ),
  ],
);
