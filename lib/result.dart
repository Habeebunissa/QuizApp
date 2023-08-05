import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;
  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    String resultText;
    if (resultScore <= 25) {
      resultText = 'Good choice!!';
    } else if (resultScore <= 30) {
      resultText = 'You are amazing!!!';
    } else if (resultScore <= 35) {
      resultText = 'You are outstanding!';
    } else {
      resultText = 'You have an unmatchable choice!';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        Text(
          resultPhrase,
          style: TextStyle(fontSize: 42, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        TextButton(
          child: Text('Restart quiz!'),
          style: ElevatedButton.styleFrom(backgroundColor: Colors.white10),
          onPressed: () {
            resetHandler();
          },
        ),
      ],
    ));
  }
}
