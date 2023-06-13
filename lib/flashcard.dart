class Flashcard {
  final String question;
  final String answer;

  Flashcard({required this.question, required this.answer});
}

flashcard() {
  List<Flashcard> _flashcards = [
    Flashcard(question: "1", answer: "1"),
    Flashcard(question: "2", answer: "2"),
    Flashcard(question: "3", answer: "3"),
    Flashcard(question: "4", answer: "4"),
    Flashcard(question: "5", answer: "5"),
  ];
}
