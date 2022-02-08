import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: "Measures Converter", home: MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _username = "";
  String _fruit = "";
  String _message = "";
  var fruits = ["Organge", "Apple", "Banana", "Strawberry"];
  var MeasureItems = ["meters", "kilometers", "grams", "kilograms", "feet", "miles", "pounds", "ounces"];
  String fromMeasureValue = "";
  String toMeasureValue = "";


  @override
  void initState() {
    _username = "";
    _fruit = "";
    _message = "";
    fromMeasureValue = MeasureItems[0];
    toMeasureValue = MeasureItems[1];
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
            const Padding(padding: EdgeInsets.only(top: 30),
                    child: Text(
                      "Value",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.blueGrey),
                    ),
            ),

             const SizedBox(
              width: 350,
              child: TextField(
                style: TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.w600),
              ),
            ),

            const Padding(padding: EdgeInsets.all(20),
              child: Text(
                "From",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.blueGrey),
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
                    print(fromMeasureValue);
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

            const Padding(padding: EdgeInsets.all(20),
              child: Text(
                  "To",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.blueGrey),
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
                    if(_username.isEmpty || _fruit.isEmpty){
                      return;
                    } else {
                      buildMessage(_username, _fruit);
                    }
                  },
                  child: const Text("Convert"),
                ),
            ),

            Text(_message),
        ],
      )),
    );
  }

  void buildMessage(String nombre, String fruta){
    var message = "Hola $nombre, fruta favorita: $fruta";
    setState(() {
      _message = message;
    });
  }

}
