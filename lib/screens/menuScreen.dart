import 'package:flutter/material.dart';
import 'package:healthy01/const/colors.dart';
import 'package:healthy01/screens/dessertScreen.dart';
import 'package:healthy01/screens/login.dart';
import 'package:healthy01/screens/onboarding_second_screen.dart';

import '../utils/helper.dart';
import '../widgets/customNavBar.dart';
import '../widgets/searchBar.dart';

class MenuScreen extends StatelessWidget {
  static const routeName = "/menuScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "User Informations",
                        style: Helper.getTheme(context).headline5,
                      ),
                      Material(
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context)
                                .pushReplacementNamed(LoginScreen.routeName);
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Image.asset(Helper.getAssetName(
                                "user_filled.png", "virtual")),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                    height: Helper.getScreenHeight(context) * 0.6,
                    width: Helper.getScreenWidth(context),
                    child: Stack(
                      children: [
                        Container(
                          height: double.infinity,
                          width: 100,
                          decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(30),
                                  bottomRight: Radius.circular(30),
                                ),
                              ),
                              color: AppColor.orange),
                        ),
                        ListView(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const MenuCard(
                                    name: "Gender",
                                    count: "Man",
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  const MenuCard(
                                    name: "Height",
                                    count: "179 cm",
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  const MenuCard(
                                    name: "Weight",
                                    count: "79 kg",
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  const MenuCard(
                                    name: "heart Rate",
                                    count: "70",
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.of(context)
                                          .pushNamed(DessertScreen.routeName);
                                    },
                                    child: const MenuCard(
                                      name: "body Temperature",
                                      count: "37°C",
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  const MenuCard(
                                    name: "Activity Lavel",
                                    count: "Very active",
                                  ),
                                ],
                              ),
                            ])
                      ],
                    )),
                const SizedBox(
                  height: 35,
                ),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      MenuCard(
                        name: "Calories Day",
                        count: "379 calorie",
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Ink(
                    decoration: const ShapeDecoration(
                      color: Color(0xFFFC6011),
                      shape: CircleBorder(),
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.edit_note),
                      color: Color.fromARGB(255, 255, 255, 255),
                      onPressed: () {
                        Navigator.of(context).pushReplacementNamed(
                            OnboardingSecondScreen.routeName);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: CustomNavBar(
              menu: true,
            ),
          )
        ],
      ),
    );
  }
}

class MenuCard extends StatelessWidget {
  const MenuCard({
    key,
    required String name,
    required String count,
  })  : _name = name,
        _count = count,
        super(key: key);

  final String _name;
  final String _count;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 80,
          width: double.infinity,
          margin: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 80,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50),
              bottomLeft: Radius.circular(50),
              topRight: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: AppColor.placeholder,
                offset: Offset(0, 5),
                blurRadius: 10,
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _name,
                style: Helper.getTheme(context).headline4?.copyWith(
                      color: AppColor.primary,
                    ),
              ),
              SizedBox(
                height: 5,
              ),
              Text("$_count")
            ],
          ),
        ),
      ],
    );
  }
}

class CustomTriangle extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Offset controlpoint = Offset(size.width * 0, size.height * 0.5);
    Offset endpoint = Offset(size.width * 0.2, size.height * 0.85);
    Offset controlpoint2 = Offset(size.width * 0.33, size.height);
    Offset endpoint2 = Offset(size.width * 0.6, size.height * 0.9);
    Offset controlpoint3 = Offset(size.width * 1.4, size.height * 0.5);
    Offset endpoint3 = Offset(size.width * 0.6, size.height * 0.1);
    Offset controlpoint4 = Offset(size.width * 0.33, size.height * 0);
    Offset endpoint4 = Offset(size.width * 0.2, size.height * 0.15);

    Path path = new Path()
      ..moveTo(size.width * 0.2, size.height * 0.15)
      ..quadraticBezierTo(
        controlpoint.dx,
        controlpoint.dy,
        endpoint.dx,
        endpoint.dy,
      )
      ..quadraticBezierTo(
        controlpoint2.dx,
        controlpoint2.dy,
        endpoint2.dx,
        endpoint2.dy,
      )
      ..quadraticBezierTo(
        controlpoint3.dx,
        controlpoint3.dy,
        endpoint3.dx,
        endpoint3.dy,
      )
      ..quadraticBezierTo(
        controlpoint4.dx,
        controlpoint4.dy,
        endpoint4.dx,
        endpoint4.dy,
      );

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

class CustomDiamond extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(size.width * 0.1000000, size.height * 0.4400000);
    path.quadraticBezierTo(size.width * 0.0243800, size.height * 0.5247000,
        size.width * 0.1000000, size.height * 0.6000000);
    path.quadraticBezierTo(size.width * 0.3550000, size.height * 0.8250000,
        size.width * 0.4400000, size.height * 0.9000000);
    path.quadraticBezierTo(size.width * 0.5140600, size.height * 0.9574800,
        size.width * 0.5800000, size.height * 0.9000000);
    path.quadraticBezierTo(size.width * 0.8200000, size.height * 0.6450000,
        size.width * 0.9000000, size.height * 0.5600000);
    path.quadraticBezierTo(size.width * 0.9500400, size.height * 0.5009400,
        size.width * 0.9000000, size.height * 0.4200000);
    path.quadraticBezierTo(size.width * 0.6450000, size.height * 0.1800000,
        size.width * 0.5600000, size.height * 0.1000000);
    path.quadraticBezierTo(size.width * 0.5029400, size.height * 0.0446800,
        size.width * 0.4200000, size.height * 0.1000000);
    path.quadraticBezierTo(size.width * 0.3400000, size.height * 0.1850000,
        size.width * 0.1000000, size.height * 0.4400000);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
