import 'dart:html';

import 'package:flutter/material.dart';
import 'package:healthy01/const/colors.dart';
import 'package:healthy01/screens/forgetPwScreen.dart';
import 'package:healthy01/screens/homeScreen.dart';
import 'package:healthy01/screens/register.dart';
import 'package:healthy01/utils/helper.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';
import 'package:snippet_coder_utils/hex_color.dart';
import '../services/api_service.dart';
import '../config.dart';
import '../models/login_request_model.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = "/loginScreen";
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
                Text(
                  "Login",
                  style: Helper.getTheme(context).headline6,
                ),
                Spacer(),
                Text('Add your details to login'),
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
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(26.5),
                      color: Color(0xFFFC6011),
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
                                  Navigator.of(context).pushReplacementNamed(
                                      HomeScreen.routeName);
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
                        btnColor: Color(0xFFFC6011),
                      ),
                    )),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .pushReplacementNamed(ForgetPwScreen.routeName);
                  },
                  child: Text("Forget your password?"),
                ),
                Spacer(
                  flex: 2,
                ),
                Text("or Login With"),
                Spacer(),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        Color(
                          0xFF367FC0,
                        ),
                      ),
                    ),
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          Helper.getAssetName(
                            "fb.png",
                            "virtual",
                          ),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Text("Login with Facebook")
                      ],
                    ),
                  ),
                ),
                Spacer(),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        Color(
                          0xFFDD4B39,
                        ),
                      ),
                    ),
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          Helper.getAssetName(
                            "google.png",
                            "virtual",
                          ),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Text("Login with Google")
                      ],
                    ),
                  ),
                ),
                Spacer(
                  flex: 4,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .pushReplacementNamed(RegisterScreen.routeName);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an Account?"),
                      Text(
                        "Sign Up",
                        style: TextStyle(
                          color: AppColor.orange,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                )
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
