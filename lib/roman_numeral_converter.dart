import 'package:flutter/material.dart';

class RomanNumeralConverter extends StatefulWidget {
  @override
  _RomanNumeralConverterState createState() => _RomanNumeralConverterState();
}

class _RomanNumeralConverterState extends State<RomanNumeralConverter> {
  final Map<String, int> _data = {
    'M': 1000,
    'D': 500,
    'C': 100,
    'L': 50,
    'X': 10,
    'V': 5,
    'I': 1
  };

  final List<String> romans = ['M', 'L', "D", "C", 'X', 'V', 'I'];
  String _roman = '';
  int _sum = 0;
  List<int> _array = [];
  final List<int> _checkArray = [
    1000,
    900,
    500,
    400,
    100,
    90,
    50,
    40,
    10,
    9,
    5,
    4,
    1
  ];

  String converter(String romanNum) {
    List<String> numerals = romanNum.split('');
    _sum = 0;
    _array = [];
    List<bool> isNumberTrue = [];
    List<bool> isStringTrue = [];

    try {
      for (var i = 0; i < numerals.length; i++) {
        int firstNum = _data[numerals[i]];
        int c = i;
        isStringTrue.add(romans.contains(numerals[i]));
        print(isStringTrue);
        if (isStringTrue.contains(false)) return 'not the right letters';

        /// if there is one numeral
        if (numerals.length == i + 1) {
          _array.add(firstNum);
        }

        if (i + 1 < numerals.length) {
          int nextNum = _data[numerals[i + 1]];

          if (firstNum < nextNum) {
            i++;
            print('subtrackted');
            _array.add(nextNum - firstNum);
          }

          /// checks to see if equal to or larger than next number , if it is adds to array
          if (firstNum >= nextNum) {
            _array.add(firstNum);
          }

          ///checks to see if next number is larger than previous, if it is takes away. then adds to array

          /// this should see if the array has any of the aloud numbers for a roman numeral if it doesnt
          /// then it will y NOT A ROMAN NUMERAL
          if (c < _array.length) {
            isNumberTrue.add(_checkArray.contains(_array[c]));
          }
          if (isNumberTrue.contains(false)) return 'not a roman numeral';
        }
      }
    } catch (error, trace) {
      print(error);
      print(trace);
    }

    // print('line 61');
    // print(_array);
    _array.forEach((e) => _sum += e);
    return _sum.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20),
            child: TextField(
              // controller: myController,
              onChanged: (String value) {
                setState(() {
                  _roman = value.toUpperCase();
                });
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Roman numeral',
              ),
            ),
          ),
          Text(
            'the numerical equivlent is',
          ),
          Text(
            '${converter(_roman)}',
            style: Theme.of(context).textTheme.headline4,
          ),
        ]);
  }
}
