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

/*


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
*/
