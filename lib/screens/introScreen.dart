import 'package:flutter/material.dart';
import 'package:healthy01/const/colors.dart';
import 'package:healthy01/screens/homeScreen.dart';
import 'package:healthy01/screens/register.dart';
import 'package:healthy01/utils/helper.dart';

class IntroScreen extends StatefulWidget {
  static const routeName = "/introScreen";

  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  var _controller;
  late int count;
  final List<Map<String, String>> _pages = [
    {
      "image": "vector1.png",
      "title": "Welcome To Healthy APP",
      "desc":
          "Welcome To Healthy APP  We Help users to have a healthy lifestyle"
    },
    {
      "image": "vector2.png",
      "title": "Find Food You Love",
      "desc": "Find Food You Love and Ease of monitoring health status"
    },
    {
      "image": "vector3.png",
      "title": "Save Money",
      "desc": "Save money with our app and ease monitoring of food fees"
    },
  ];

  @override
  void initState() {
    _controller = new PageController();
    count = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: Helper.getScreenWidth(context),
        height: Helper.getScreenHeight(context),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              children: [
                Spacer(),
                Container(
                  height: 400,
                  width: double.infinity,
                  child: PageView.builder(
                    controller: _controller,
                    onPageChanged: (value) {
                      setState(() {
                        count = value;
                      });
                    },
                    itemBuilder: (context, index) {
                      return Image.asset(Helper.getAssetName(
                          _pages[index]["image"]!, "virtual"));
                    },
                    itemCount: _pages.length,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 5,
                      backgroundColor:
                          count == 0 ? AppColor.orange : AppColor.placeholder,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    CircleAvatar(
                      radius: 5,
                      backgroundColor:
                          count == 1 ? AppColor.orange : AppColor.placeholder,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    CircleAvatar(
                      radius: 5,
                      backgroundColor:
                          count == 2 ? AppColor.orange : AppColor.placeholder,
                    )
                  ],
                ),
                Spacer(),
                Text(
                  _pages[count]["title"]!,
                  style: Helper.getTheme(context).headline6,
                ),
                Spacer(),
                Text(
                  _pages[count]["desc"]!,
                  textAlign: TextAlign.center,
                ),
                Spacer(),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {
                        if (count < 2) {
                          setState(() {
                            count = count + 1;
                          });
                          _controller.animateToPage(count,
                              duration: Duration(milliseconds: 250),
                              curve: Curves.bounceInOut);
                        } else {
                          Navigator.of(context)
                              .pushReplacementNamed(RegisterScreen.routeName);
                        }
                      },
                      child: Text("Next")),
                ),
                Spacer()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
