mport 'package:flutter/material.dart';
 
import './quiz.dart';
import './result.dart';
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
 final _questions = const [
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
   if (_questionIndex < _questions.length) {
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
       body: _questionIndex < _questions.length
           ? Quiz(
               answerQuestion: _answerQuestion,
               questionIndex: _questionIndex,
               questions: _questions,
             )
           : Result(),
     ),
   );
 }
}