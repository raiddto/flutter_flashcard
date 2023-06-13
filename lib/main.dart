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
  int _currIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('FlashCard Quiz')),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 250,
              height: 250,
              child: FlipCard(
                  front: FlashcardView(
                      text: flashcard()._flashcards[_currIndex].question),
                  back: FlashcardView(
                      text: flashcard()._flashcards[_currIndex].answer)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                OutlinedButton.icon(
                  onPressed: previousCard,
                  icon: Icon(Icons.chevron_left),
                  label: Text('Prev'),
                ),
                OutlinedButton.icon(
                  onPressed: nextCard,
                  icon: Icon(Icons.chevron_right),
                  label: Text('Next'),
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
      _currIndex = (_currIndex + 1 < flashcard()._flashcards.length)
          ? _currIndex + 1
          : 0;
    });
  }

  void previousCard() {
    setState(() {
      _currIndex = (_currIndex - 1 >= 0)
          ? _currIndex - 1
          : flashcard()._flashcards.length - 1;
    });
  }
}
