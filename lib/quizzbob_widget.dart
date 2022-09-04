import 'package:flutter/material.dart';
import 'package:quizzbob_app/quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class QuizzbobWidget extends StatefulWidget {
  const QuizzbobWidget({super.key});

  @override
  State<QuizzbobWidget> createState() => _QuizzbobWidgetState();
}

class _QuizzbobWidgetState extends State<QuizzbobWidget> {
  /*
  The black box in a plane is black /False - they're actually orange
  Marrakesh is the capital of Morocco
  There are two parts of the body that can't heal themselves /False - there's only one: the teeth.
The Great Wall of China is longer than the distance between London and Beijing //True - London to Beijing is only 8,136 km, The Great Wall of China is 21,196.18 km


  */
  // List<String> questions = [
  //   'The black box in a plane is black',
  //   'Marrakesh is the capital of Morocco',
  //   'There are two parts of the body that can\'t heal themselves',
  //   'The Great Wall of China is longer than the distance between London and Beijing'
  // ];

  QuizBrain quizBrain = QuizBrain();
  // List<bool> responses = [false, false, false, true];
  List<Widget> scoreKeeper = [];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 5,
            child: Center(
              child: Text(
                quizBrain.getQuestion(),
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 25, color: Colors.white),
              ),
            ),
          ),
          Expanded(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
              ),
              onPressed: () {
                updateElements(context, true);
              },
              child: const Text(
                'True',
                style: TextStyle(fontSize: 25, color: Colors.white),
              ),
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Expanded(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
              ),
              onPressed: () {
                updateElements(context, false);
              },
              child: const Text(
                'False',
                style: TextStyle(fontSize: 25, color: Colors.white),
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: scoreKeeper,
            ),
          )
        ],
      ),
    );
  }

  int calculScore() {
    return ((quizBrain.correctAnswersCounter() / 17) * 100).round();
  }

  updateElements(BuildContext context, bool buttonClicked) {
    setState(() {
      if (!quizBrain.isFinished()) {
        if (quizBrain.getAnswer() == buttonClicked) {
          scoreKeeper.add(const Icon(
            Icons.check,
            color: Colors.green,
          ));
          quizBrain.updateCorrectAnswersCounter();
        } else {
          scoreKeeper.add(const Icon(
            Icons.close,
            color: Colors.red,
          ));
          quizBrain.updateFalseAnswersCounter();
        }
      } else {
        var score = calculScore();
        Alert(
            context: context,
            type: AlertType.info,
            title: 'Congrats!',
            desc:
                '$score% Score \nCorrect ${quizBrain.correctAnswersCounter()} \n False ${quizBrain.falseAnswersCounters()}',
            buttons: [
              DialogButton(
                  color: Colors.red,
                  child: const Text(
                    'reset',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      quizBrain.reset();
                      scoreKeeper.clear();
                    });

                    Navigator.pop(context);
                  }),
            ]).show();
      }
      quizBrain.nextQuestion();
    });
  }
}
