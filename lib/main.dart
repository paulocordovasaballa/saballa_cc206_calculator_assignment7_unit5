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
  double quotient = 0;

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
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 30),
            _buildOperationRow(
              firstNumController: firstAddNumController,
              secondNumController: secondAddNumController,
              operation: '+',
              result: '$sum',
              icon: Icons.add,
              onCalculate: () {
                setState(() {
                  double firstNum = double.tryParse(firstAddNumController.text) ?? 0;
                  double secondNum = double.tryParse(secondAddNumController.text) ?? 0;
                  sum = firstNum + secondNum;
                });
              },
            ),
            const SizedBox(height: 30),
            _buildOperationRow(
              firstNumController: firstSubtNumController,
              secondNumController: secondSubtNumController,
              operation: '-',
              result: '$difference',
              icon: Icons.remove,
              onCalculate: () {
                setState(() {
                  double firstNum = double.tryParse(firstSubtNumController.text) ?? 0;
                  double secondNum = double.tryParse(secondSubtNumController.text) ?? 0;
                  difference = firstNum - secondNum;
                });
              },
            ),
            const SizedBox(height: 30),
            _buildOperationRow(
              firstNumController: firstMultNumController,
              secondNumController: secondMultNumController,
              operation: '*',
              result: '$product',
              icon: Icons.clear,
              onCalculate: () {
                setState(() {
                  double firstNum = double.tryParse(firstMultNumController.text) ?? 0;
                  double secondNum = double.tryParse(secondMultNumController.text) ?? 0;
                  product = firstNum * secondNum;
                });
              },
            ),
            const SizedBox(height:30),
            _buildOperationRow(
              firstNumController: firstDivNumController,
              secondNumController: secondDivNumController,
              operation: '÷',
              result: quotient.toStringAsFixed(2),
              icon: CupertinoIcons.divide,
              onCalculate: () {
                setState(() {
                  double firstNum = double.tryParse(firstDivNumController.text) ?? 0;
                  double secondNum = double.tryParse(secondDivNumController.text) ?? 1;
                  quotient = secondNum != 0 ? firstNum / secondNum : 0;
                });
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _clearAll,
              child: const Text("Clear"),
            ),
          ],
        ),
      ),
    );
  }

  Row _buildOperationRow({
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
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
          style: const TextStyle(fontSize: 24),
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
      quotient = 0;
    });
  }
}