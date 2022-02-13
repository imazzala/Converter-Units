import 'package:flutter/material.dart';
import 'converter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: "Measures Converter", home: MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _message = "";
  List<String> MeasureItems = ["meters", "kilometers", "grams", "kilograms", "feet", "miles", "pounds", "ounces"];
  String fromMeasureValue = "";
  String toMeasureValue = "";
  late double _toConvert;
  final TextStyle _style = const TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.blueGrey);


  @override
  void initState() {
    _message = "";
    fromMeasureValue = MeasureItems[0];
    toMeasureValue = MeasureItems[1];
    _toConvert = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Measures Converter"),
      ),
      body: Center(
          child: Column(
          children: [
            Padding(padding: const EdgeInsets.only(top: 30),
                    child: Text(
                      "Value",
                      style: _style,
                    ),
            ),

             SizedBox(
              width: 350,
              child: TextField(
                style: const TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.w600),
                keyboardType: TextInputType.number,
                onChanged: (text){
                  double toConvert = double.parse(text);
                  setState(() {
                    _toConvert = toConvert;
                  });
                },
              ),
            ),

            Padding(padding: EdgeInsets.all(20),
              child: Text(
                "From",
                style: _style,
              ),
            ),

             SizedBox(
              width: 350,
              child: DropdownButton(
                value: fromMeasureValue,
                style: const TextStyle(
                    color: Colors.blueAccent
                ),
                isExpanded: true,
                onChanged: (String? newValue) {
                  setState(() {
                    fromMeasureValue = newValue!;
                  });
                },
                items: MeasureItems.map((String value) {
                  return DropdownMenuItem(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),

            Padding(padding: EdgeInsets.all(20),
              child: Text(
                  "To",
                style: _style,
              ),
            ),

            SizedBox(
              width: 350,
              child: DropdownButton(
                value: toMeasureValue,
                style: const TextStyle(
                  color: Colors.blueAccent,
                ),
                isExpanded: true,
                isDense: true,
                onChanged: (String? newValue){
                  setState((){
                    toMeasureValue = newValue!;
                  });
                },
                items: MeasureItems.map((String value){
                  return DropdownMenuItem(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),


            Padding(
                padding: const EdgeInsets.all(20),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.white54,
                      onPrimary: Colors.indigoAccent,
                      textStyle: const TextStyle(
                          fontWeight: FontWeight.w500
                      )
                  ),
                  onPressed: (){
                      double result = convert(_toConvert, fromMeasureValue, toMeasureValue);
                      buildMessage(_toConvert, fromMeasureValue, toMeasureValue, result);
                    },
                  child: const Text("Convert"),
                ),
            ),

            Text(
              _message,
              style: _style,
            ),
        ],
      )),
    );
  }

  void buildMessage(var _value, String fromMeasure, String toMeasure, double result){
    var message = "$_value $fromMeasure is $result $toMeasure";
    setState(() {
      _message = message;
    });
  }

}
