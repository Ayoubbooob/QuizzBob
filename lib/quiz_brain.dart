import 'question.dart';

class QuizBrain {
  bool _isQuizFinished = false;
  int _questionNumber = 0;
  int _correctAnswersCounter = 0;
  int _falseAnswersCounter = 0;
  final List<Question> _questionBank = [
    Question('The black box in a plane is black', false),
    Question('Marrakesh is the capital of Morocco', false),
    Question(
        'There are two parts of the body that can\'t heal themselves', false),
    Question(
        'The Great Wall of China is longer than the distance between London and Beijing',
        true),
    Question('Some cats are actually allergic to humans', true),
    Question('You can lead a cow down stairs but not up stairs.', false),
    Question('Approximately one quarter of human bones are in the feet.', true),
    Question('A slug\'s blood is green.', true),
    Question('Buzz Aldrin\'s mother\'s maiden name was Moon.', true),
    Question('It is illegal to pee in the Ocean in Portugal.', true),
    Question(
        'No piece of square dry paper can be folded in half more than 7 times.',
        false),
    Question('Google was originally called Backrub.', true),
    Question(
        'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
        true),
    Question(
        'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
        true),
  ];

  String getQuestion() {
    return _questionBank[_questionNumber].question;
  }

  bool getAnswer() {
    return _questionBank[_questionNumber].answer;
  }

  void nextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    } else {
      _isQuizFinished = true;
    }
  }

  bool isFinished() {
    return _isQuizFinished;
  }

  void reset() {
    _questionNumber = 0;
    _isQuizFinished = false;
    _correctAnswersCounter = 0;
    _falseAnswersCounter = 0;
  }

  int correctAnswersCounter() {
    return _correctAnswersCounter;
  }

  int falseAnswersCounters() {
    return _falseAnswersCounter;
  }

  void updateCorrectAnswersCounter() {
    _correctAnswersCounter++;
  }

  void updateFalseAnswersCounter() {
    _falseAnswersCounter++;
  }
}
