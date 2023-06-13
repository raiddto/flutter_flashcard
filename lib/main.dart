import 'package:flashcard_quiz/flashcard.dart';
import 'package:flashcard_quiz/flashcard_view.dart';
import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<Flashcard> _flashcards = [
    Flashcard(question: "1", answer: "1"),
    Flashcard(question: "2", answer: "2"),
    Flashcard(question: "3", answer: "3"),
    Flashcard(question: "4", answer: "4"),
    Flashcard(question: "5", answer: "5"),
  ];

  int _currIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('FlashCard Quiz')),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 250,
              height: 250,
              child: FlipCard(
                  front: FlashcardView(text: _flashcards[_currIndex].question),
                  back: FlashcardView(text: _flashcards[_currIndex].answer)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                OutlinedButton.icon(
                  onPressed: previousCard,
                  icon: const Icon(Icons.chevron_left),
                  label: const Text('Prev'),
                ),
                OutlinedButton.icon(
                  onPressed: nextCard,
                  icon: const Icon(Icons.chevron_right),
                  label: const Text('Next'),
                ),
              ],
            )
          ],
        )),
      ),
    );
  }

  void nextCard() {
    setState(() {
      _currIndex = (_currIndex + 1 < _flashcards.length) ? _currIndex + 1 : 0;
    });
  }

  void previousCard() {
    setState(() {
      _currIndex =
          (_currIndex - 1 >= 0) ? _currIndex - 1 : _flashcards.length - 1;
    });
  }
}
