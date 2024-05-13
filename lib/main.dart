import 'package:flutter/material.dart';

void main() {
  runApp(const GuguDanApp());
}

class GuguDanApp extends StatelessWidget {
  const GuguDanApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '구구단 앱',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GuguDanScreen(),
    );
  }
}

class GuguDanScreen extends StatefulWidget {
  const GuguDanScreen({super.key});

  @override
  _GuguDanScreenState createState() => _GuguDanScreenState();
}

class _GuguDanScreenState extends State<GuguDanScreen> {
  int selectedNumber = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('구구단 앱'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButton<int>(
              value: selectedNumber,
              items: List.generate(9, (index) => index + 1)
                  .map((number) => DropdownMenuItem<int>(
                value: number,
                child: Text('$number 단'),
              ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  selectedNumber = value!;
                });
              },
            ),
            const SizedBox(height: 20),
            Text(
              '$selectedNumber 단',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(
                9,
                    (index) => Text(
                  '$selectedNumber x ${index + 1} = ${selectedNumber * (index + 1)}',
                  style: const TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
