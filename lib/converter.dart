
Map<String, int> codecConversion = {
  "meters" : 0,
  "kilometers": 1,
  "grams": 2,
  "kilograms": 3,
  "feet": 4,
  "miles": 5,
  "pounds": 6,
  "ounces": 7
};

List<List<double>> conversionRate = [
  [1, 0.0001, 0, 0, 3.28084, 0.0062, 0, 0],
  [1000, 1, 0, 0, 3280.84, 0.62137, 0, 0],
  [0, 0, 1, 0.0001, 0, 0, 0.0022, 0.03527],
  [0, 0, 1000, 1, 0, 0, 2.20462, 35.274],
  [0.3048, 0.0003, 0, 9, 1, 0.00019, 0, 0],
  [1609.34, 1.60934, 0, 0, 5280, 1, 0, 0],
  [0, 0, 453.592, 0.45359, 0, 0, 1, 16],
  [0, 0, 28.3495, 0.02835, 0, 0 , 0.0625, 1]
];


double convert(double value, String from, String to){
  var result = value * conversionRate[codecConversion[from]!][codecConversion[to]!];
  return result;
}
