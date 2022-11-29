import 'package:flutter/material.dart';
import 'package:healthy01/screens/home_screen.dart';
import 'package:healthy01/screens/login.dart';
import 'package:healthy01/screens/register.dart';
import 'package:healthy01/services/shared_service.dart';
import 'screens/onboarding_screen.dart';

Widget _defaultHome = const LoginScreen();
void main() {
  /* async
  WidgetsFlutterBinding.ensureInitialized();

  // Get result of the login function.
  bool _result = await SharedService.isLoggedIn();
  if (_result) {
    _defaultHome = const HomeSreen();
  }*/

  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'SFProText',
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: Colors.orange,
        ),
      ),
      routes: {
        '/home': (context) => const HomeSreen(),
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
      },
      home: const OnboardingScreen(),
    );
  }
}
