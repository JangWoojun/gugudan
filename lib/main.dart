import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '구구단 앱',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const MyHomePage(title: '우준이의 구구단!'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _number = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: const TextStyle(color: Colors.white),
        ),
        elevation: 4,
        backgroundColor: Colors.deepPurple,
      ),
      backgroundColor: Colors.grey[200],
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              '몇 단을 할지 입력해주세요 :',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(color: Colors.deepPurple, width: 2.0),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: TextField(
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    setState(() {
                      _number = int.tryParse(value) ?? 1;
                    });
                  },
                  decoration: const InputDecoration(
                    hintText: '숫자를 입력하세요',
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                child: MultiplicationTable(number: _number),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MultiplicationTable extends StatelessWidget {
  final int number;

  const MultiplicationTable({Key? key, required this.number}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(
        9,
        (index) => Container(
          decoration: BoxDecoration(
            color: index % 2 == 0 ? Colors.white : Colors.grey[100],
            borderRadius: BorderRadius.circular(8.0),
          ),
          margin: EdgeInsets.symmetric(vertical: 4.0),
          padding: EdgeInsets.all(8.0),
          child: Text(
            '${number} x ${index + 1} = ${number * (index + 1)}',
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}
