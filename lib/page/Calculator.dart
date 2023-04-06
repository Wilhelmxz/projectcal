import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String _output = '0';
  double _num1 = 0;
  double _num2 = 0;
  String _operator = '';
  String _prevOperator = '';
  bool _isDecimal = false;

  void _buttonPressed(String buttonText) {
    if (buttonText == 'C') {
      _output = '0';
      _num1 = 0;
      _num2 = 0;
      _operator = '';
      _prevOperator = '';
      _isDecimal = false;
    } else if (buttonText == '+' || buttonText == '-' || buttonText == '*' || buttonText == '/') {
      _operator = buttonText;
      _prevOperator = buttonText;
      _num1 = double.parse(_output);
      _output = '0';
      _isDecimal = false;
    } else if (buttonText == '.') {
      if (!_isDecimal) {
        _output += '.';
        _isDecimal = true;
      }
    } else if (buttonText == '=') {
      _num2 = double.parse(_output);
      if (_operator == '+') {
        _output = (_num1 + _num2).toString();
      } else if (_operator == '-') {
        _output = (_num1 - _num2).toString();
      } else if (_operator == '*') {
        _output = (_num1 * _num2).toString();
      } else if (_operator == '/') {
        _output = (_num1 / _num2).toString();
      }
      _operator = '';
      _prevOperator = '';
      _num1 = 0;
      _num2 = 0;
      _isDecimal = false;
    } else {
      if (_prevOperator == '') {
        if (_output == '0') {
          _output = buttonText;
        } else {
          _output += buttonText;
        }
      } else {
        _output = buttonText;
        _prevOperator = '';
        _isDecimal = false;
      }
    }


    setState(() {});
  }

  Widget _buildButton(String buttonText, double buttonWidth, double buttonHeight) {
    return Container(
      width: buttonWidth,
      height: buttonHeight,
      child: ElevatedButton(
        onPressed: () {
          _buttonPressed(buttonText);
        },
        child: Text(
          buttonText,
          style: const TextStyle(fontSize: 32),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double buttonWidth = MediaQuery.of(context).size.width / 4;
    double buttonHeight = MediaQuery.of(context).size.height / 7;

    return Scaffold(
        appBar: AppBar(
        title: const Text('Calculator'),
    ),
    body: Column(
    children: [
    Container(
    alignment: Alignment.centerRight,
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
    child: Text(
    _output,
    style: const TextStyle(fontSize: 48),
    ),
    ),
    Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
    _buildButton('C', buttonWidth*3, buttonHeight),
    _buildButton('/', buttonWidth, buttonHeight),
    ],
    ),
    Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
    _buildButton('7', buttonWidth, buttonHeight),
        _buildButton('8', buttonWidth, buttonHeight),
        _buildButton('9', buttonWidth, buttonHeight),
        _buildButton('*', buttonWidth, buttonHeight),
    ],
    ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildButton('4', buttonWidth, buttonHeight),
          _buildButton('5', buttonWidth, buttonHeight),
          _buildButton('6', buttonWidth, buttonHeight),
          _buildButton('-', buttonWidth, buttonHeight),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildButton('1', buttonWidth, buttonHeight),
          _buildButton('2', buttonWidth, buttonHeight),
          _buildButton('3', buttonWidth, buttonHeight),
          _buildButton('+', buttonWidth, buttonHeight),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildButton('0', buttonWidth * 2, buttonHeight),
          _buildButton('.', buttonWidth, buttonHeight),
          _buildButton('=', buttonWidth, buttonHeight),
        ],
      ),
    ],
    ),
    );
  }
}
