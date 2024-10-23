import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Paulo Saballa',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 57, 24, 114)),
        useMaterial3: true,
      ),
      home: const CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  double sum = 0;
  double difference = 0;
  double product = 0;
  String quotient = '0'; // String for handling error message

  final TextEditingController firstAddNumController = TextEditingController();
  final TextEditingController secondAddNumController = TextEditingController();
  final TextEditingController firstSubtNumController = TextEditingController();
  final TextEditingController secondSubtNumController = TextEditingController();
  final TextEditingController firstMultNumController = TextEditingController();
  final TextEditingController secondMultNumController = TextEditingController();
  final TextEditingController firstDivNumController = TextEditingController();
  final TextEditingController secondDivNumController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("[Saballa] Unit 5 Calculator"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 30),
            _createOperationRow(
              firstNumController: firstAddNumController,
              secondNumController: secondAddNumController,
              operation: '+',
              result: '$sum',
              icon: Icons.add,
              onCalculate: () {
                setState(() {
                  double num1 = double.tryParse(firstAddNumController.text) ?? 0;
                  double num2 = double.tryParse(secondAddNumController.text) ?? 0;
                  sum = num1 + num2;
                });
              },
            ),
            const SizedBox(height: 30),
            _createOperationRow(
              firstNumController: firstSubtNumController,
              secondNumController: secondSubtNumController,
              operation: '-',
              result: '$difference',
              icon: Icons.remove,
              onCalculate: () {
                setState(() {
                  double num1 = double.tryParse(firstSubtNumController.text) ?? 0;
                  double num2 = double.tryParse(secondSubtNumController.text) ?? 0;
                  difference = num1 - num2;
                });
              },
            ),
            const SizedBox(height: 30),
            _createOperationRow(
              firstNumController: firstMultNumController,
              secondNumController: secondMultNumController,
              operation: '*',
              result: '$product',
              icon: Icons.clear,
              onCalculate: () {
                setState(() {
                  double num1 = double.tryParse(firstMultNumController.text) ?? 0;
                  double num2 = double.tryParse(secondMultNumController.text) ?? 0;
                  product = num1 * num2;
                });
              },
            ),
            const SizedBox(height: 30),
            _createOperationRow(
              firstNumController: firstDivNumController,
              secondNumController: secondDivNumController,
              operation: '÷',
              result: quotient,
              icon: CupertinoIcons.divide,
              onCalculate: () {
                setState(() {
                  double num1 = double.tryParse(firstDivNumController.text) ?? 0;
                  double num2 = double.tryParse(secondDivNumController.text) ?? 1;
                  if (num2 == 0) {
                    quotient = "Divisor must not be 0";
                  } else {
                    quotient = (num1 / num2).toStringAsFixed(2);
                  }
                });
              },
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: _clearAll,
              child: const Text("Clear"),
            ),
          ],
        ),
      ),
    );
  }

  Row _createOperationRow({
    required TextEditingController firstNumController,
    required TextEditingController secondNumController,
    required String operation,
    required String result,
    required IconData icon,
    required VoidCallback onCalculate,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: TextField(
            controller: firstNumController,
            decoration: const InputDecoration(labelText: "Enter First Number"),
            keyboardType: TextInputType.number,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            operation,
            style: const TextStyle(fontSize: 20),
          ),
        ),
        Expanded(
          child: TextField(
            controller: secondNumController,
            decoration: const InputDecoration(labelText: "Enter Second Number"),
            keyboardType: TextInputType.number,
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            "=",
            style: TextStyle(fontSize: 20),
          ),
        ),
        Text(
          result,
          style: const TextStyle(fontSize: 18),
        ),
        IconButton(
          icon: Icon(icon),
          onPressed: onCalculate,
        ),
      ],
    );
  }

  void _clearAll() {
    setState(() {
      firstAddNumController.clear();
      secondAddNumController.clear();
      firstSubtNumController.clear();
      secondSubtNumController.clear();
      firstMultNumController.clear();
      secondMultNumController.clear();
      firstDivNumController.clear();
      secondDivNumController.clear();
      sum = 0;
      difference = 0;
      product = 0;
      quotient = '0';
    });
  }
}
