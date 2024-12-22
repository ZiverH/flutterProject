import 'package:flutter/material.dart';
class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz,{super.key});

  final void Function() startQuiz;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(226, 83, 16, 154),
        body: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset('assets/images/quiz-logo.png',
                  width: 200,
                  color: const Color.fromARGB(150, 255, 255, 255),),
                SizedBox(height:60),
                Text('Learn Flutter the fun way!',
                  style:
                  TextStyle(
                      color: Colors.white,
                      fontSize: 25
                  ),
                ),
                SizedBox(height:40),
                OutlinedButton.icon(onPressed: startQuiz,
                    style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.white
                    ),
                    icon: Icon(Icons.arrow_right_alt),
                    label:Text('Start Quiz'))
              ],
            )
        ),
      ),
    );
  }
}
