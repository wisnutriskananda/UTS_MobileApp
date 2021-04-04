import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';
import './answer.dart';

// void main() {
//   runApp(MyApp());
// }

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final questions = const [
    {
      'questionText': 'Apa warna favorit anda?',
      'answers': ['Hitam', 'Merah', 'Hijau', 'Putih'],
    },
    {
      'questionText': 'Apa peliharaan favorit anda?',
      'answers': ['Anjing', 'kucing', 'Burung', 'Ular'],
    },
    {
      'questionText': 'Berapa jumlah peliharaan anda?',
      'answers': ['1 ekor', '2 ekor', '3 ekor', '4 ekor'],
    },
  ];
  var _questionIndex = 0;

  void _answerQuestion() {
    // var aBool = true;
    // aBool = false;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < questions.length) {
      print('Kita masih punya pertanyaan!');
    } else {
      print('tidak ada pertanyaan lagi!');
    }
  }

  @override
  Widget build(BuildContext context) {
    // var dummy = const ['Hello'];
    // dummy.add('Max');
    // print(dummy);
    // dummy = [];
    // questions = []; // does not work if questions is a const

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Aplikasi quiz'),
        ),
        body: _questionIndex < questions.length
            ? Column(
                children: [
                  Question(
                    questions[_questionIndex]['questionText'],
                  ),
                  ...(questions[_questionIndex]['answers'] as List<String>)
                      .map((answer) {
                    return Answer(_answerQuestion, answer);
                  }).toList()
                ],
              )
            : Center(
                child: Text('Anda berhasil!'),
              ),
      ),
    );
  }
}
