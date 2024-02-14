import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BmiCalculator(),
    );
  }
}

class BmiCalculator extends StatefulWidget {
  BmiCalculator({key}): super(key: key);

  @override
  State<BmiCalculator> createState() => _BmiCalculatorState();
}

class _BmiCalculatorState extends State<BmiCalculator>  {
  int currIndex = 0;
  String result = "";
  double height = 0, weight = 0;
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            textAlign: TextAlign.center,
              "BMI Calculator",
              style: TextStyle(
                  fontSize: 35.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
              ),
          ),
          elevation: 0.0,
          backgroundColor: Colors.white,
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.settings,
                  color: Colors.black,
                ),
            ),
          ],
        ),
        // warp all body inside a SingleScrollChild widget
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 40.0,
                ),
                Row(
                  children: [
                    radioButton("Male", Colors.blue, 0),
                    radioButton("Female", Colors.pink, 1),
                  ],
                ),
                SizedBox(
                  height: 25.0,
                ),
                // The Height
                Text(
                  "Height in Cm",
                  style: TextStyle(
                    fontSize: 27.0,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  controller: heightController,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: "Your height in Cm",
                    filled: true,
                    fillColor: Colors.grey[180],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                SizedBox(
                  height: 25.0,
                ),
                // The Weight
                Text(
                  "Weight in Kg",
                  style: TextStyle(
                    fontSize: 27.0,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  controller: weightController,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: "Your weight in Kg",
                    filled: true,
                    fillColor: Colors.grey[180],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                // Calculator Button
                Container(
                  width: double.maxFinite,
                  height: 60.0,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        height = double.parse(heightController.value.text);
                        weight = double.parse(weightController.value.text);
                      });
                      calculateBmi(height, weight);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.lightBlueAccent,
                    ),
                    child: Text(
                      "Calculate",
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Container(
                  width: double.maxFinite,
                  child: Text(
                    "Your BMI is",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 43.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                // The Result
                Container(
                  width: double.maxFinite,
                  child: Text(
                    "$result",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
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

  void calculateBmi(double height,double weight){
    double finalResult = weight / (height * height / 10000);
    String bmi = finalResult.toStringAsFixed(2);
    setState(() {
      result = bmi;
    });
  }

  void changeIndex(int index){
    setState(() {
      currIndex = index;
    });
  }
  Widget radioButton(String value, Color color,int index){
    return Expanded(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 12.0),
          height: 80.0,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: currIndex == index ? color : Colors.white70,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            onPressed: () {
              changeIndex(index);
            },
            child: Text(
              value,
              style: TextStyle(
                color: currIndex == index ? Colors.white :color,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
    );
  }
}
