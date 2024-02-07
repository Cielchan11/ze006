import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QuizApp',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'QuizApp'), // ระบุชื่อ title ที่นี่
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key); // ปรับเปลี่ยน Key ให้ nullable และกำหนด required สำหรับ title

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _score = 0;
final List<Question> _questions = [
  Question(
    question: '1.เมืองหลวงของประเทศไทยคืออะไร?',
    answers: [
      Answer(text: 'กรุงเทพมหานคร', isCorrect: true),
      Answer(text: 'เชียงใหม่', isCorrect: false),
      Answer(text: 'ภูเก็ต', isCorrect: false),
      Answer(text: 'อุดรธานี', isCorrect: false),
    ],
  ),
  Question(
    question: '2.สัตว์ประจำชาติไทยคืออะไร?',
    answers: [
      Answer(text: 'ช้าง', isCorrect: true),
      Answer(text: 'เสือโคร่ง', isCorrect: false),
      Answer(text: 'นกกระจอกเทศ', isCorrect: false),
      Answer(text: 'วาฬเพชฌฆาต', isCorrect: false),
    ],
  ),
  Question(
    question: '3.แม่น้ำสายใดที่ยาวที่สุดในประเทศไทย?',
    answers: [
      Answer(text: 'แม่น้ำเจ้าพระยา', isCorrect: true),
      Answer(text: 'แม่น้ำโขง', isCorrect: false),
      Answer(text: 'แม่น้ำแม่กลอง', isCorrect: false),
      Answer(text: 'แม่น้ำตาปี', isCorrect: false),
    ],
  ),
  Question(
    question: '4.ประเทศไทยมีพรมแดนติดกับประเทศอะไรบ้าง?',
    answers: [
      Answer(text: 'ลาว', isCorrect: true),
      Answer(text: 'พม่า', isCorrect: true),
      Answer(text: 'มาเลเซีย', isCorrect: true),
      Answer(text: 'กัมพูชา', isCorrect: true),
      Answer(text: 'เวียดนาม', isCorrect: false),
    ],
  ),
  Question(
    question: '5.ประเทศไทยมีกี่ภาค?',
    answers: [
      Answer(text: '4 ภาค', isCorrect: false),
      Answer(text: '5 ภาค', isCorrect: true),
      Answer(text: '6 ภาค', isCorrect: false),
      Answer(text: '7 ภาค', isCorrect: false),
    ],
  ),
  Question(
    question: '6.ธงชาติไทยมีสีอะไรบ้าง?',
    answers: [
      Answer(text: 'แดง ขาว น้ำเงิน', isCorrect: true),
      Answer(text: 'เหลือง เขียว แดง', isCorrect: false),
      Answer(text: 'ขาว น้ำเงิน เหลือง', isCorrect: false),
      Answer(text: 'แดง เขียว ขาว', isCorrect: false),
    ],
  ),
  Question(
    question: '7.ดอกไม้ประจำชาติไทยคืออะไร?',
    answers: [
      Answer(text: 'ดอกบัว', isCorrect: false),
      Answer(text: 'ดอกกล้วยไม้', isCorrect: false),
      Answer(text: 'ดอกดาวเรือง', isCorrect: false),
      Answer(text: 'ดอกราชพฤกษ์', isCorrect: true),
    ],
  ),
  Question(
    question: '8.เพลงชาติไทยมีชื่อว่าอะไร?',
    answers: [
      Answer(text: 'มาร์ชราชวัลลภ', isCorrect: false),
      Answer(text: 'เพลงสรรเสริญพระบารมี', isCorrect: true),
      Answer(text: 'มาร์ชสยาม', isCorrect: false),
      Answer(text: 'เพลงเฉลิมพระเกียรติ', isCorrect: false),
    ],
  ),
  Question(
    question: '9.กวีเอกของไทยคือใคร?',
    answers: [
      Answer(text: 'สุนทรภู่', isCorrect: true),
      Answer(text: 'นายผี', isCorrect: false),
      Answer(text: 'ม.ร.ว. คึกฤทธิ์ ปราโมช', isCorrect: false),
      Answer(text: 'เสถียร โพธินันทะ', isCorrect: false),
    ],
  ),
  Question(
    question: '10.หน่วยเงินไทยคืออะไร?',
    answers: [
      Answer(text: 'บาท', isCorrect: true),
      Answer(text: 'ดอลลาร์', isCorrect: false),
      Answer(text: 'เยน', isCorrect:false),
      Answer(text: 'วอน', isCorrect:false),
    ],
  ),
];

  int _currentQuestionIndex = 0;
  bool _showAnswer = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            if (_currentQuestionIndex < _questions.length) ...[
              Text(_questions[_currentQuestionIndex].question),
              SizedBox(height: 16.0),
              for (final answer in _questions[_currentQuestionIndex].answers)
                _buildAnswerButton(answer),
              SizedBox(height: 16.0),
            ],
            if (_currentQuestionIndex == _questions.length) ...[
              Text("คะแนน: $_score/$_questions.length"),
              ElevatedButton(
                onPressed: () => setState(() => _currentQuestionIndex = 0),
                child: Text("เริ่มใหม่"),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildAnswerButton(Answer answer) {
    return ElevatedButton(
      onPressed: () => _checkAnswer(answer),
      child: Text(answer.text),
      style: ElevatedButton.styleFrom(
        primary: _showAnswer && answer.isCorrect ? Colors.green : Colors.blue,
      ),
    );
  }

  void _checkAnswer(Answer answer) {
    setState(() {
      _showAnswer = true;
      if (answer.isCorrect) {
        _score++;
      }
    });
    Future.delayed(Duration(seconds: 2), () => _nextQuestion());
  }

  void _nextQuestion() {
    setState(() {
      _currentQuestionIndex++;
      _showAnswer = false;
    });
  }
}

class Question {
  final String question;
  final List<Answer> answers;

  Question({
    required this.question,
    required this.answers,
  });
}

class Answer {
  final String text;
  final bool isCorrect;

  Answer({
    required this.text,
    required this.isCorrect,
  });
}