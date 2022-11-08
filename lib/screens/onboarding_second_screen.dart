import 'package:flutter/material.dart';

class OnboardingSecondScreen extends StatefulWidget {
  const OnboardingSecondScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingSecondScreen> createState() => _onboardingSecondScreenState();
}

class _onboardingSecondScreenState extends State<OnboardingSecondScreen> {
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  static const List<String> list = <String>[
    'Sedentary',
    'Slightly active',
    'Moderately active',
    'Very active',
    'Extremely active'
  ];
  bool isChecked = false;
  bool isCheckedw = true;
  String? dropdownValue;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

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
              height: MediaQuery.of(context).size.height * 0.02,
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
              height: MediaQuery.of(context).size.height * 0.04,
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
                          isCheckedw = !value;
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
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
                          isChecked = !value;
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
                    controller: heightController,
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
                    controller: weightController,
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
            SizedBox(height: size.height * 0.04),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
              width: 300,
              decoration: BoxDecoration(
                  color: Color.fromARGB(252, 224, 182, 156),
                  borderRadius: BorderRadius.circular(30)),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: dropdownValue,
                  icon: const Icon(
                    Icons.expand_circle_down,
                    color: Color.fromARGB(255, 253, 116, 98),
                  ),
                  elevation: 16,
                  style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                  borderRadius: BorderRadius.circular(30),
                  underline: Container(
                    color: Color.fromARGB(255, 253, 116, 98),
                    width: 1.0,
                    height: 2.0,
                  ),
                  onChanged: (String? value) {
                    // This is called when the user selects an item.
                    setState(() {
                      dropdownValue = value!;
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
                                  fontSize: 18,
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.bold),
                            ),
                          ))
                      .toList(),
                ),
              ),
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
