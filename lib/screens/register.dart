import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:healthy01/screens/home_screen.dart';

import 'onboarding_screen.dart';
import 'onboarding_second_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _registerScreenState();
}

class _registerScreenState extends State<RegisterScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  bool isChecked = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(32.5),
        child: ListView(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Container(
              height: 213,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/register.png'),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            const Text(
              'Welcome To Healthy APP \n We Help users to have a healthy lifestyle',
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
              'Ease of monitoring health status',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Color(0xff9A9DB0),
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Container(
              height: 50,
              alignment: Alignment.center,
              //margin: EdgeInsets.symmetric(horizontal: 50),
              child: TextField(
                controller: usernameController,
                decoration: InputDecoration(
                  labelText: "Username",
                  filled: true, //<-- SEE HERE
                  fillColor: Color.fromARGB(255, 253, 234, 229),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 253, 116, 98),
                      width: 5.0,
                    ),
                  ),
                ),
                obscureText: false,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Container(
              height: 50,
              alignment: Alignment.center,
              //margin: EdgeInsets.symmetric(horizontal: 50),
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: "Email",
                  filled: true, //<-- SEE HERE
                  fillColor: Color.fromARGB(255, 253, 234, 229),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 253, 116, 98),
                      width: 5.0,
                    ),
                  ),
                ),
                obscureText: false,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Container(
              height: 50,
              alignment: Alignment.center,
              //margin: EdgeInsets.symmetric(horizontal: 50),
              child: TextField(
                controller: passwordController,
                decoration: InputDecoration(
                  labelText: "Password",
                  filled: true, //<-- SEE HERE
                  fillColor: Color.fromARGB(255, 253, 234, 229),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 253, 116, 98),
                      width: 5.0,
                    ),
                  ),
                ),
                obscureText: true,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Container(
              height: 50,
              alignment: Alignment.center,
              //margin: EdgeInsets.symmetric(horizontal: 50),
              child: TextField(
                controller: phoneController,
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                decoration: InputDecoration(
                  labelText: "Phone",
                  filled: true, //<-- SEE HERE
                  fillColor: Color.fromARGB(255, 253, 234, 229),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 253, 116, 98),
                      width: 5.0,
                    ),
                  ),
                ),
                obscureText: false,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Container(
              height: 50,
              alignment: Alignment.center,
              //margin: EdgeInsets.symmetric(horizontal: 50),
              child: TextField(
                controller: ageController,
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                decoration: InputDecoration(
                  labelText: "Age",
                  filled: true, //<-- SEE HERE
                  fillColor: Color.fromARGB(255, 253, 234, 229),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 253, 116, 98),
                      width: 5.0,
                    ),
                  ),
                ),
                obscureText: false,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            CheckboxListTile(
              checkColor: Colors.white,
              activeColor: Color.fromARGB(227, 207, 19, 19),
              title: const Text(
                  "I agree with terms conditions and privacy policy"),
              value: isChecked,
              onChanged: (bool? value) {
                setState(() {
                  isChecked = value!;
                });
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
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
                            builder: (context) =>
                                const OnboardingSecondScreen()),
                      );
                    },
                    child: const Text(
                      'Sign Up',
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
