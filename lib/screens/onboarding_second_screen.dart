// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:healthy01/config.dart';
import 'package:healthy01/const/colors.dart';
import 'package:healthy01/models/details_request_model.dart';
import 'package:healthy01/screens/homeScreen.dart';
import 'package:healthy01/services/api_service.dart';
import 'package:healthy01/utils/helper.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';

class OnboardingSecondScreen extends StatefulWidget {
  static const routeName = "/onboardingSecondScreen";
  const OnboardingSecondScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingSecondScreen> createState() => _onboardingSecondScreenState();
}

class _onboardingSecondScreenState extends State<OnboardingSecondScreen> {
  bool isApiCallProcess = false;
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  String? height;
  String? weight;
  String? sexe;
  String? id;
  String? heart_Rate;
  String? body_Temp;
  static const List<String> list = <String>[
    'Sedentary',
    'Slightly active',
    'Moderately active',
    'Very active',
    'Extremely active'
  ];
  bool isChecked = false;
  bool isCheckedw = true;
  String? level;
  @override
  void initState() {
    super.initState();
    session();
    id = '638fd5909d0962df8f88482f';
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
            child: _deatilsUI(context),
          ),
        ),
      ),
    );
  }

  Widget _deatilsUI(BuildContext context) {
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
                  'We Help users to have a healthy lifestyle',
                  textAlign: TextAlign.center,
                  style: Helper.getTheme(context).headline6,
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
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: AppColor.placeholderBg,
                          border: Border.all(color: AppColor.placeholderBg),
                          borderRadius: BorderRadius.circular(20),
                        ), //BoxDecoration//BoxDecoration
                        child: CheckboxListTile(
                          checkColor: Colors.white,
                          activeColor: const Color.fromARGB(255, 255, 30, 0),
                          title: const Text("Man"),
                          value: isChecked,
                          onChanged: (bool? value) {
                            setState(() {
                              isChecked = value!;
                              isCheckedw = !value;
                              if (isChecked) {
                                sexe = 'Man';
                              } else {
                                sexe = 'Woman';
                              }
                            });
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width * 0.10,
                    ),
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: AppColor.placeholderBg,
                          border: Border.all(color: AppColor.placeholderBg),
                          borderRadius: BorderRadius.circular(20),
                        ), //BoxDecoration
                        child: CheckboxListTile(
                          checkColor: Colors.white,
                          activeColor: const Color.fromARGB(255, 255, 30, 0),
                          title: const Text("Woman"),
                          value: isCheckedw,
                          onChanged: (bool? value) {
                            setState(() {
                              isCheckedw = value!;
                              isChecked = !value;
                              if (isChecked) {
                                sexe = 'Man';
                              } else {
                                sexe = 'Woman';
                              }
                            });
                          },
                        ),
                      ),
                    ),
                  ],
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
                    "Height",
                    "Height",
                    (onValidateVal) {
                      if (onValidateVal.isEmpty) {
                        return 'Height can\'t be empty.';
                      }

                      return null;
                    },
                    (onSavedVal) => {
                      height = onSavedVal,
                    },
                    borderColor: AppColor.placeholderBg,
                    borderFocusColor: AppColor.placeholderBg,
                    textColor: AppColor.placeholder,
                    hintColor: AppColor.placeholder,
                    borderRadius: 10,
                    suffixIcon: Icon(
                      Icons.height,
                      color: Color.fromARGB(255, 255, 30, 0),
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
                    "Weight",
                    "Weight",
                    (onValidateVal) {
                      if (onValidateVal.isEmpty) {
                        return 'Weight can\'t be empty.';
                      }

                      return null;
                    },
                    (onSavedVal) => {
                      weight = onSavedVal,
                    },
                    borderColor: AppColor.placeholderBg,
                    borderFocusColor: AppColor.placeholderBg,
                    textColor: AppColor.placeholder,
                    hintColor: AppColor.placeholder,
                    borderRadius: 10,
                    suffixIcon: Icon(
                      Icons.monitor_weight,
                      color: Color.fromARGB(255, 255, 30, 0),
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
                    "Heart Rate",
                    "Heart Rate	",
                    (onValidateVal) {
                      if (onValidateVal.isEmpty) {
                        return 'Heart Rate can\'t be empty.';
                      }

                      return null;
                    },
                    (onSavedVal) => {
                      heart_Rate = onSavedVal,
                    },
                    borderColor: AppColor.placeholderBg,
                    borderFocusColor: AppColor.placeholderBg,
                    textColor: AppColor.placeholder,
                    hintColor: AppColor.placeholder,
                    borderRadius: 10,
                    suffixIcon: Icon(
                      Icons.monitor_heart,
                      color: Color.fromARGB(255, 255, 30, 0),
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
                    "Body Temp",
                    "Body Temp",
                    (onValidateVal) {
                      if (onValidateVal.isEmpty) {
                        return 'Body Temp can\'t be empty.';
                      }

                      return null;
                    },
                    (onSavedVal) => {
                      body_Temp = onSavedVal,
                    },
                    borderColor: AppColor.placeholderBg,
                    borderFocusColor: AppColor.placeholderBg,
                    textColor: AppColor.placeholder,
                    hintColor: AppColor.placeholder,
                    borderRadius: 10,
                    suffixIcon: Icon(
                      Icons.temple_hindu,
                      color: Color.fromARGB(255, 255, 30, 0),
                    ),
                  ),
                ),
                Spacer(),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                  width: 300,
                  decoration: BoxDecoration(
                      color: AppColor.placeholderBg,
                      borderRadius: BorderRadius.circular(20)),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: level,
                      icon: const Icon(
                        Icons.expand_circle_down,
                        color: Color.fromARGB(255, 255, 30, 0),
                      ),
                      elevation: 16,
                      style:
                          const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                      borderRadius: BorderRadius.circular(20),
                      underline: Container(
                        color: AppColor.placeholderBg,
                        width: 1.0,
                        height: 2.0,
                      ),
                      onChanged: (String? value) {
                        // This is called when the user selects an item.
                        setState(() {
                          level = value!;
                        });
                      },
                      hint: const Center(
                          child: Text(
                        'Select Activity Lavel',
                        style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                      )),
                      isExpanded: true,
                      items: list.map((e) {
                        return DropdownMenuItem<String>(
                          value: e,
                          child: Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              e,
                              style: const TextStyle(fontSize: 18),
                            ),
                          ),
                        );
                      }).toList(),
                      selectedItemBuilder: (BuildContext context) => list
                          .map((e) => Center(
                                child: Text(
                                  e,
                                  style: const TextStyle(
                                      fontSize: 16,
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      fontWeight: FontWeight.bold),
                                ),
                              ))
                          .toList(),
                    ),
                  ),
                ),
                Spacer(),
                const Text(
                  'Your data is only stored on this device \nand it only accesible to this app',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xff9A9DB0),
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Spacer(),
                Align(
                  alignment: Alignment.centerRight,
                  child: Ink(
                    decoration: const ShapeDecoration(
                      color: Color(0xFFFC6011),
                      shape: CircleBorder(),
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.navigate_next),
                      color: Color.fromARGB(255, 255, 255, 255),
                      onPressed: () {
                        if (validateAndSave()) {
                          print(
                              ' $id,$sexe, $height, $weight, $heart_Rate, $body_Temp, $level');
                          setState(() {
                            isApiCallProcess = true;
                          });

                          DetailsRequestModel model = DetailsRequestModel(
                            id: id!,
                            sexe: sexe!,
                            height: height!,
                            weight: weight!,
                            heartRate: heart_Rate!,
                            bodyTemp: body_Temp!,
                            level: level!,
                          );

                          APIService.addDetails(model).then(
                            (response) {
                              setState(() {
                                isApiCallProcess = false;
                              });
                              if (response.data != null) {
                                FormHelper.showSimpleAlertDialog(
                                  context,
                                  Config.appName,
                                  "Add Details Successful. Please look at the result in your Info section",
                                  "OK",
                                  () {
                                    Navigator.of(context).pushReplacementNamed(
                                        HomeScreen.routeName);
                                  },
                                );
                              } else {
                                FormHelper.showSimpleAlertDialog(
                                  context,
                                  Config.appName,
                                  "Invalid Details !!",
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
                    ),
                  ),
                ),
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

  Future<void> session() async {
    dynamic id = await SessionManager().get("id");
    print(id);
  }
}
