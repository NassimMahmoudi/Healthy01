import 'dart:async';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:healthy01/screens/home_screen.dart';
import 'package:healthy01/screens/login.dart';

class OnboardingSecondScreen extends StatefulWidget {
  const OnboardingSecondScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingSecondScreen> createState() => _onboardingSecondScreenState();
}

class _onboardingSecondScreenState extends State<OnboardingSecondScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  static const List<String> list = <String>[
    'Your activity lavel',
    'Two',
    'Three',
    'Four'
  ];
  bool isChecked = false;
  bool isCheckedw = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    String dropdownValue = list.first;
    var textField = TextField(
      controller: usernameController,
      decoration: InputDecoration(
        labelText: "Username",
        filled: true, //<-- SEE HERE
        fillColor: const Color.fromARGB(255, 253, 234, 229),
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
        padding: EdgeInsets.all(32.5),
        child: ListView(
          children: [
            Container(
              height: 213,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/home1.png'),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            const Text(
              'Welcome To Healthy',
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
              'Following details will help us to estimate\nyour daily calorie needs',
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Container(
                    width: double.infinity,
                    child: CheckboxListTile(
                      checkColor: Colors.white,
                      activeColor: const Color.fromARGB(227, 207, 19, 19),
                      title: const Text("Man"),
                      value: isChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          isChecked = value!;
                        });
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    child: CheckboxListTile(
                      checkColor: Colors.white,
                      activeColor: const Color.fromARGB(227, 207, 19, 19),
                      title: const Text("Woman"),
                      value: isCheckedw,
                      onChanged: (bool? value) {
                        setState(() {
                          isCheckedw = value!;
                        });
                      },
                    ),
                  ),
                ),
                const SizedBox(width: 8),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Row(children: [
              Expanded(
                child: Container(
                  width: double.infinity,
                  height: 50,
                  alignment: Alignment.center,
                  //margin: EdgeInsets.symmetric(horizontal: 50),
                  child: TextField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.done),
                      labelText: "Height",
                      filled: true, //<-- SEE HERE
                      fillColor: const Color.fromARGB(255, 253, 234, 229),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(
                          color: Color.fromARGB(255, 253, 116, 98),
                          width: 5.0,
                        ),
                      ),
                    ),
                    obscureText: true,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  height: 50,
                  alignment: Alignment.center,
                  //margin: EdgeInsets.symmetric(horizontal: 50),
                  child: TextField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      labelText: "Weight",
                      filled: true, //<-- SEE HERE
                      fillColor: const Color.fromARGB(255, 253, 234, 229),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(
                          color: Color.fromARGB(255, 253, 116, 98),
                          width: 5.0,
                        ),
                      ),
                    ),
                    obscureText: true,
                  ),
                ),
              ),
            ]),
            SizedBox(height: size.height * 0.03),
            DropdownButton<String>(
              value: dropdownValue,
              icon: const Icon(Icons.arrow_downward),
              elevation: 16,
              style: const TextStyle(color: Colors.deepPurple),
              underline: Container(
                height: 2,
                color: Colors.deepPurpleAccent,
              ),
              onChanged: (String? value) {
                // This is called when the user selects an item.
                setState(() {
                  dropdownValue = value!;
                });
              },
              items: list.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: size.height * 0.03),
            const Text(
              'Your data is only stored on this device \nand it only accesible to this app',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Color(0xff9A9DB0),
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: size.height * 0.05),
            Align(
              alignment: Alignment.centerRight,
              child: Ink(
                decoration: const ShapeDecoration(
                  color: Color(0xFFf37552),
                  shape: CircleBorder(),
                ),
                child: IconButton(
                  icon: const Icon(Icons.navigate_next),
                  color: Color.fromARGB(255, 255, 255, 255),
                  onPressed: () {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
