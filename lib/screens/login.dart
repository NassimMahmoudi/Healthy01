import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../config.dart';
import '../models/login_request_model.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<LoginScreen> {
  bool isApiCallProcess = false;
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var textField = TextField(
      controller: usernameController,
      cursorColor: Color.fromARGB(255, 0, 0, 0),
      decoration: InputDecoration(
        hintText: "Username",
        filled: true, //<-- SEE HERE

        fillColor: const Color.fromARGB(255, 253, 234, 229),
        icon: Icon(Icons.person),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(
            color: Color.fromARGB(255, 253, 116, 98),
            width: 1.0,
          ),
        ),
      ),
    );
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(32.5),
        child: ListView(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            Container(
              height: 213,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/login.png'),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            const Text(
              'Welcome To Healthy APP',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                color: Color(0xFF0E0E2D),
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            const Text(
              'We Help users to have a healthy lifestyle',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Color(0xff9A9DB0),
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Container(
              height: 50,
              alignment: Alignment.center,
              //margin: EdgeInsets.symmetric(horizontal: 50),
              child: textField,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.005,
            ),
            Container(
              height: 50,
              alignment: Alignment.center,
              //margin: EdgeInsets.symmetric(horizontal: 50),
              child: TextField(
                controller: passwordController,
                cursorColor: Color.fromARGB(255, 0, 0, 0),
                decoration: InputDecoration(
                  icon: Icon(Icons.lock),
                  hintText: "Password",
                  filled: true, //<-- SEE HERE
                  fillColor: const Color.fromARGB(255, 253, 234, 229),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                      color: const Color.fromARGB(255, 253, 116, 98),
                      width: 5.0,
                    ),
                  ),
                ),
                obscureText: true,
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              // ignore: prefer_const_constructors
              child: Text(
                "Forget your password?",
                // ignore: prefer_const_constructors
                style: TextStyle(
                    fontFamily: 'Montserrat Regular',
                    fontSize: 15,
                    color: Color.fromARGB(255, 230, 78, 78)),
              ),
            ),
            SizedBox(height: size.height * 0.05),
            Container(
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(26.5),
                  gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFFf6925c),
                      Color(0xFFf37552),
                    ],
                  ),
                ),
                child: Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 5,
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()),
                      );
                    },
                    child: const Text(
                      'Sign In',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
