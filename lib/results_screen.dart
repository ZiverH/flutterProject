import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled1/data/question.dart';
import 'package:untitled1/questions_summary/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key,required List<String> this.chosenAnswers,required this.onRestart});

  final List<String> chosenAnswers;
  final void Function() onRestart;

  List<Map<String,Object>> getResult(){
    List<Map<String,Object>> summary=[];
    for(int i=0;i<chosenAnswers.length;i++){
      summary.add({
        'question-index':i,
        'question':questions[i].text,
        'correct_answer':questions[i].answers[0],
        'user_answer':chosenAnswers[i]
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData=getResult();
    final countQuestions=questions.length;
    final countcorrectAnswers=summaryData.where((data){
      return data['user_answer'] == data['correct_answer'];
    }).length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                  Text("You answered $countcorrectAnswers out of $countQuestions questions correctly!",
                  style: GoogleFonts.lato(
                    color: const Color.fromARGB(255, 230, 200, 253),
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 30,),
                  QuestionsSummary(summaryData),
                  SizedBox(height: 30,),
                  TextButton.icon(
                      onPressed: onRestart,
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.white
                      ),
                      icon: const Icon(Icons.refresh),
                      label: Text("Restart Quiz!"))
            ],
          ),
      ),
    );

  }
}
