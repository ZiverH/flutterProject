import 'package:flutter/material.dart';
import 'package:untitled1/questions_summary/summary_item.dart';

class QuestionsSummary extends StatelessWidget {
   QuestionsSummary(this.summaryData,{super.key});

  List<Map<String,Object>> summaryData;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data){
            return SummaryItem(data);
          }).toList(),
        ),
      ),
    );
  }
}
