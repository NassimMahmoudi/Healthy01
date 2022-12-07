import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:healthy01/config.dart';
import 'package:healthy01/const/colors.dart';
import 'package:healthy01/models/register_request_model.dart';
import 'package:healthy01/screens/homeScreen.dart';
import 'package:healthy01/screens/login.dart';
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
  bool isApiCallProcess = false;
  String? userName;
  String? password;
  String? email;
  String? phone;
  String? age;
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
                    "Email",
                    "Email",
                    (onValidateVal) {
                      if (onValidateVal.isEmpty) {
                        return 'Email can\'t be empty.';
                      }

                      return null;
                    },
                    (onSavedVal) => {
                      email = onSavedVal,
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
                  decoration: const ShapeDecoration(
                    color: AppColor.placeholderBg,
                    shape: StadiumBorder(),
                  ),
                  //margin: EdgeInsets.symmetric(horizontal: 50),
                  child: FormHelper.inputFieldWidget(
                    context,
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
                    prefixIcon: const Icon(Icons.lock),
                    initialValue: "",
                    obscureText: hidePassword,
                    borderFocusColor: AppColor.placeholderBg,
                    prefixIconColor: Color.fromARGB(255, 230, 78, 78),
                    borderColor: AppColor.placeholderBg,
                    textColor: AppColor.placeholder,
                    hintColor: AppColor.placeholder,
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
                    "Phone",
                    "Phone",
                    (onValidateVal) {
                      if (onValidateVal.isEmpty) {
                        return 'Phone can\'t be empty.';
                      }

                      return null;
                    },
                    (onSavedVal) => {
                      phone = onSavedVal,
                    },
                    borderColor: AppColor.placeholderBg,
                    borderFocusColor: AppColor.placeholderBg,
                    textColor: AppColor.placeholder,
                    hintColor: AppColor.placeholder,
                    borderRadius: 10,
                    isNumeric: true,
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
                    "Age",
                    "Age",
                    (onValidateVal) {
                      if (onValidateVal.isEmpty) {
                        return 'Age can\'t be empty.';
                      }

                      return null;
                    },
                    (onSavedVal) => {
                      age = onSavedVal,
                    },
                    borderColor: AppColor.placeholderBg,
                    borderFocusColor: AppColor.placeholderBg,
                    textColor: AppColor.placeholder,
                    hintColor: AppColor.placeholder,
                    borderRadius: 10,
                    isNumeric: true,
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
                          if (validateAndSave()) {
                            print(
                                ' $userName, $password, $email, $phone, $age');
                            setState(() {
                              isApiCallProcess = true;
                            });

                            RegisterRequestModel model = RegisterRequestModel(
                              username: userName!,
                              password: password!,
                              email: email!,
                              age: age!,
                              phone: phone!,
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
                                      Navigator.of(context)
                                          .pushReplacementNamed(
                                              LoginScreen.routeName);
                                    },
                                  );
                                } else {
                                  FormHelper.showSimpleAlertDialog(
                                    context,
                                    Config.appName,
                                    "Invalid Informations !!",
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
                        btnColor: Color(0xFFFC6011),
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
