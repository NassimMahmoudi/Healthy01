import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:healthy01/config.dart';
import 'package:healthy01/const/colors.dart';
import 'package:healthy01/models/register_request_model.dart';
import 'package:healthy01/screens/homeScreen.dart';
import 'package:healthy01/screens/home_screen.dart';
import 'package:healthy01/services/api_service.dart';
import 'package:healthy01/utils/helper.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';

import 'onboarding_screen.dart';
import 'onboarding_second_screen.dart';

class RegisterScreen extends StatefulWidget {
  static const routeName = "/register";
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
  bool isApiCallProcess = false;
  String? userName;
  String? password;
  bool hidePassword = true;
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  bool isChecked = false;

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
            child: _registerUI(context),
          ),
        ),
      ),
    );
  }

  Widget _registerUI(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Helper.getScreenHeight(context),
        width: Helper.getScreenWidth(context),
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 40,
              vertical: 30,
            ),
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Text(
                  'Welcome To Healthy APP \n We Help users to have a healthy lifestyle',
                  textAlign: TextAlign.center,
                  style: Helper.getTheme(context).headline6,
                ),
                Spacer(),
                const Text(
                  'Add your details to register in our app',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xff9A9DB0),
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Spacer(),
                Container(
                  width: double.infinity,
                  height: 50,
                  // ignore: prefer_const_constructors
                  decoration: ShapeDecoration(
                    color: AppColor.placeholderBg,
                    shape: const StadiumBorder(),
                  ),
                  //margin: EdgeInsets.symmetric(horizontal: 50),
                  child: FormHelper.inputFieldWidget(
                    context,
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
                    borderColor: AppColor.placeholderBg,
                    borderFocusColor: AppColor.placeholderBg,
                    textColor: AppColor.placeholder,
                    hintColor: AppColor.placeholder,
                    borderRadius: 10,
                  ),
                ),
                Spacer(),
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
                Spacer(),
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
                Spacer(),
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
                Spacer(),
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
                Spacer(),
                Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(26.5),
                      color: Color(0xFFFC6011),
                    ),
                    child: Center(
                      child: FormHelper.submitButton(
                        "Sign Up",
                        () {
                          print(' $userName, $password');
                          if (validateAndSave()) {
                            setState(() {
                              isApiCallProcess = true;
                            });

                            RegisterRequestModel model = RegisterRequestModel(
                              username: userName!,
                              password: password!,
                              email: password!,
                              age: password!,
                              phone: password!,
                            );

                            APIService.register(model).then(
                              (response) {
                                setState(() {
                                  isApiCallProcess = false;
                                });
                                if (response.data != null) {
                                  FormHelper.showSimpleAlertDialog(
                                    context,
                                    Config.appName,
                                    "Registration Successful. Please login to the account",
                                    "OK",
                                    () {
                                      Navigator.pushNamedAndRemoveUntil(
                                        context,
                                        '/',
                                        (route) => false,
                                      );
                                    },
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
          ),
        ),
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
