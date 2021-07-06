import 'package:flutter/material.dart';

class NumeralConverter extends StatefulWidget {
  @override
  _NumeralConverterState createState() => _NumeralConverterState();
}

class _NumeralConverterState extends State<NumeralConverter> {
  final Map<int, String> _data = {
    1000: 'M',
    900: 'CM',
    500: 'D',
    400: 'CD',
    100: 'C',
    90: 'XC',
    50: 'L',
    40: 'XL',
    10: 'X',
    9: 'IX',
    5: 'V',
    4: 'IV',
    1: 'I',
  };
  List<String> _letters = [
    'M',
    'CM',
    'D',
    'CD',
    'C',
    'XC',
    'L',
    'XL',
    'X',
    'IX',
    'V',
    'IV',
    'I',
  ];
  List<int> _numbers = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1];

  int enteredNumber = 0;

  String converter(int number) {
    String roman = '';
    int digit = number;
    int arrayLength = _numbers.length;
    try {
      while (digit > 0) {
        for (var i = 0; i < arrayLength; i++) {
          if (digit >= _numbers[i]) {
            roman = roman + _letters[i];
            print(roman);
            digit = digit - _numbers[i];
            print(digit);
            break;
          }
        }
      }

      return roman;
    } catch (error, trace) {
      print(error);
      print(trace);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20),
            child: TextField(
              // controller: number,
              onChanged: (String value) {
                setState(() {
                  enteredNumber = int.parse(value);
                });
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: ' numeral ro roman',
              ),
            ),
          ),
          Text(
            'the numerical equivlent is',
          ),
          Text(
            '${converter(enteredNumber)}',
            style: Theme.of(context).textTheme.headline4,
          ),
        ]);
  }
}
