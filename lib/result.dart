import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback resetHandler;

  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    String resultText;

    if (resultScore <= 50 && resultScore >= 37) {
      resultText = "You are perfect ...\n Your score is $resultScore";
    } else if (resultScore < 37 && resultScore >= 25) {
      resultText = "Almost you got me !! \n Your score is $resultScore";
    } else if (resultScore < 25 && resultScore >= 10) {
      resultText = "Not bad but work hard \n Your score is $resultScore";
    } else {
      resultText = "You are so bad \n Your score is $resultScore";
    }

    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          ElevatedButton(
            child: Text(
              'Restart Quiz!',
            ),
            onPressed: resetHandler,
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.purple),
                textStyle: MaterialStateProperty.all(TextStyle(fontSize: 24))),
          ),
        ],
      ),
    );
  }
}
