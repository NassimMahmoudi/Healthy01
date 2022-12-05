import 'package:flutter/material.dart';
import 'package:healthy01/screens/aboutScreen.dart';
import 'package:healthy01/screens/changeAddressScreen.dart';
import 'package:healthy01/screens/checkoutScreen.dart';
import 'package:healthy01/screens/dessertScreen.dart';
import 'package:healthy01/screens/forgetPwScreen.dart';
import 'package:healthy01/screens/homeScreen.dart';
import 'package:healthy01/screens/inboxScreen.dart';
import 'package:healthy01/screens/individualItem.dart';
import 'package:healthy01/screens/introScreen.dart';
import 'package:healthy01/screens/login.dart';
import 'package:healthy01/screens/menuScreen.dart';
import 'package:healthy01/screens/moreScreen.dart';
import 'package:healthy01/screens/myOrderScreen.dart';
import 'package:healthy01/screens/newPwScreen.dart';
import 'package:healthy01/screens/notificationScreen.dart';
import 'package:healthy01/screens/offerScreen.dart';
import 'package:healthy01/screens/onboarding_second_screen.dart';
import 'package:healthy01/screens/paymentScreen.dart';
import 'package:healthy01/screens/profileScreen.dart';
import 'package:healthy01/screens/register.dart';
import 'package:healthy01/screens/sentOTPScreen.dart';
import 'package:healthy01/services/shared_service.dart';
import 'const/colors.dart';
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
        fontFamily: "Metropolis",
        primarySwatch: Colors.red,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              AppColor.orange,
            ),
            shape: MaterialStateProperty.all(
              const StadiumBorder(),
            ),
            elevation: MaterialStateProperty.all(0),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(
              AppColor.orange,
            ),
          ),
        ),
        // ignore: prefer_const_constructors
        textTheme: TextTheme(
          headline3: TextStyle(
            color: AppColor.primary,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          headline4: TextStyle(
            color: AppColor.secondary,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
          headline5: TextStyle(
            color: AppColor.primary,
            fontWeight: FontWeight.normal,
            fontSize: 25,
          ),
          // ignore: prefer_const_constructors
          headline6: TextStyle(
            color: AppColor.primary,
            fontSize: 25,
          ),
          bodyText2: TextStyle(
            color: AppColor.secondary,
          ),
        ),
      ),
      routes: {
        RegisterScreen.routeName: (context) => const RegisterScreen(),
        OnboardingSecondScreen.routeName: (context) =>
            const OnboardingSecondScreen(),
        LoginScreen.routeName: (context) => const LoginScreen(),
        OnboardingScreen.routeName: (context) => const OnboardingScreen(),
        ForgetPwScreen.routeName: (context) => ForgetPwScreen(),
        SendOTPScreen.routeName: (context) => SendOTPScreen(),
        NewPwScreen.routeName: (context) => NewPwScreen(),
        IntroScreen.routeName: (context) => IntroScreen(),
        HomeScreen.routeName: (context) => HomeScreen(),
        MenuScreen.routeName: (context) => MenuScreen(),
        OfferScreen.routeName: (context) => OfferScreen(),
        ProfileScreen.routeName: (context) => ProfileScreen(),
        MoreScreen.routeName: (context) => MoreScreen(),
        DessertScreen.routeName: (context) => DessertScreen(),
        IndividualItem.routeName: (context) => IndividualItem(),
        PaymentScreen.routeName: (context) => PaymentScreen(),
        NotificationScreen.routeName: (context) => NotificationScreen(),
        AboutScreen.routeName: (context) => AboutScreen(),
        InboxScreen.routeName: (context) => InboxScreen(),
        MyOrderScreen.routeName: (context) => MyOrderScreen(),
        CheckoutScreen.routeName: (context) => CheckoutScreen(),
        ChangeAddressScreen.routeName: (context) => ChangeAddressScreen(),
      },
      home: const OnboardingScreen(),
    );
  }
}
