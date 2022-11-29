import 'dart:html';

import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';
import 'package:snippet_coder_utils/hex_color.dart';
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
  String? userName;
  String? password;
  bool hidePassword = true;
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ProgressHUD(
          inAsyncCall: isApiCallProcess,
          opacity: 0.3,
          key: UniqueKey(),
          child: Form(
            key: globalFormKey,
            child: _loginUI(context),
          ),
        ),
      ),
    );
  }

  Widget _loginUI(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
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
            child: FormHelper.inputFieldWidget(
              context,
              prefixIcon: const Icon(Icons.person),
              "Username",
              "Username",
              (onValidateVal) {
                if (onValidateVal.isEmpty) {
                  return 'Username can\'t be empty.';
                }

                return null;
              },
              (onSavedVal) => {
                userName = onSavedVal,
              },
              initialValue: "",
              obscureText: false,
              borderFocusColor: Color.fromARGB(255, 230, 78, 78),
              prefixIconColor: Color.fromARGB(255, 230, 78, 78),
              borderColor: Color.fromARGB(255, 230, 78, 78),
              textColor: Color.fromARGB(255, 230, 78, 78),
              hintColor: Color.fromARGB(255, 230, 78, 78),
              borderRadius: 10,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.005,
          ),
          Container(
            height: 50,
            alignment: Alignment.center,
            //margin: EdgeInsets.symmetric(horizontal: 50),
            child: FormHelper.inputFieldWidget(
              context,
              prefixIcon: const Icon(Icons.lock),
              "Password",
              "Password",
              (onValidateVal) {
                if (onValidateVal.isEmpty) {
                  return 'Password can\'t be empty.';
                }

                return null;
              },
              (onSavedVal) => {
                password = onSavedVal,
              },
              initialValue: "",
              obscureText: hidePassword,
              borderFocusColor: Color.fromARGB(255, 230, 78, 78),
              prefixIconColor: Color.fromARGB(255, 230, 78, 78),
              borderColor: Color.fromARGB(255, 230, 78, 78),
              textColor: Color.fromARGB(255, 230, 78, 78),
              hintColor: Color.fromARGB(255, 230, 78, 78),
              borderRadius: 10,
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    hidePassword = !hidePassword;
                  });
                },
                color: Color.fromARGB(255, 177, 21, 21).withOpacity(0.7),
                icon: Icon(
                  hidePassword ? Icons.visibility_off : Icons.visibility,
                ),
              ),
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
                child: FormHelper.submitButton(
                  "Sign In",
                  () {
                    print(' $userName, $password');
                    if (validateAndSave()) {
                      setState(() {
                        isApiCallProcess = true;
                      });

                      LoginRequestModel model = LoginRequestModel(
                        username: userName!,
                        password: password!,
                      );

                      APIService.login(model).then(
                        (response) {
                          setState(() {
                            isApiCallProcess = false;
                          });

                          if (response) {
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              '/home',
                              (route) => false,
                            );
                          } else {
                            FormHelper.showSimpleAlertDialog(
                              context,
                              Config.appName,
                              "Invalid Username/Password !!",
                              "OK",
                              () {
                                Navigator.of(context).pop();
                              },
                            );
                          }
                        },
                      );
                    }
                  },
                  txtColor: Color.fromARGB(255, 255, 255, 255),
                  borderRadius: 10,
                ),
              )),
        ],
      ),
    );
  }

  bool validateAndSave() {
    final form = globalFormKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }
}
