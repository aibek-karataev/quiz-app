import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Quiz(),
    );
  }
}

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  final successIcon = const Icon(Icons.check, color: Colors.green);
  final errorIcon = const Icon(Icons.clear, color: Colors.red);
  int count = 0;
  int totalCorrect = 0;

  List<Icon> listIcons = [];
  List<Map<String, dynamic>> questionsList = [
    {"text": "1) Кыргыз республикасынын борбор шаары Бишкек.", "correct": true},
    {"text": "2) Автсриянын борбор шаары Канбера.", "correct": false},
    {"text": "3) Ирак мамлекетинин борбор шаары Тегеран.", "correct": false},
    {
      "text": "4) Колумбия мамлекетинин борбор шаары Сантьяго.",
      "correct": false
    },
    {
      "text": "5) Жаңы зеландия мамлекетинин борбор шаары Гамильтон.",
      "correct": false
    },
  ];

  void checkAnswer(bool isCorrect) {
    setState(() {
      if (questionsList.length > count) {
        if (questionsList[count]['correct'] == isCorrect) {
          totalCorrect++;
          listIcons.add(successIcon);
        } else {
          listIcons.add(errorIcon);
        }
      }
      count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(10, 0, 31, 1),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: questionsList.length > count
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Center(
                      child: Text(
                        questionsList[count]['text'],
                        style:
                            const TextStyle(color: Colors.white, fontSize: 25),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        ElevatedButton(
                          onPressed: () => checkAnswer(true),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(20),
                            child: Text(
                              'Туура',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15.0),
                        ElevatedButton(
                          onPressed: () => checkAnswer(false),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(20),
                            child: Text(
                              'Туура эмес',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15.0),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Wrap(
                              spacing: 5.0,
                              runSpacing: 5.0,
                              children: listIcons),
                        ),
                      ],
                    ),
                  ],
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        totalCorrect > 0
                            ? totalCorrect == questionsList.length
                                ? "Куттуктайбыз! \n Сиз берилген суроолорго толук түрдө туура жооп бердиңиз."
                                : "Азаматсыз! \n Сиз $totalCorrect суроого туура жооп бердиңиз."
                            : 'Тилеке каршы сиз бир да суроого туура жооп бербедиңиз.',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    Center(
                      child: SizedBox(
                        width: 200.0,
                        height: 50.0,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const MainApp(),
                              ),
                            );
                          },
                          child: const Text(
                            "Башкы бетке",
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
        ));
  }
}
