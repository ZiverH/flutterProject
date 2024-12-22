import 'package:flutter/material.dart';
import 'package:untitled1/data/question.dart';
import 'package:untitled1/questions_screen.dart';
import 'package:untitled1/results_screen.dart';
import 'package:untitled1/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState(){
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {

  Widget ?activeScreen;

   List<String> selectedAnswers=[];


   void restartQuiz(){
     setState(() {
       selectedAnswers=[];
       activeScreen=QuestionsScreen(onSelectAnswer: chooseAnswer);
     });
   }


  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if(selectedAnswers.length==questions.length){
      setState(() {
        // selectedAnswers=[];
        activeScreen=ResultsScreen(chosenAnswers: selectedAnswers,onRestart: restartQuiz);
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    activeScreen=StartScreen(switchScreen);
  }

  void switchScreen(){
    setState(() {
      activeScreen = QuestionsScreen(onSelectAnswer: chooseAnswer);
    });
  }
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(226, 83, 16, 154),
        body: Center(
            child: activeScreen
        ),
      ),
    );
  }


}
