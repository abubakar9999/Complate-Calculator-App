import 'package:flutter/material.dart';
import 'package:new_calculator_app/buttons.dart';
import 'package:math_expressions/math_expressions.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> buttons = [
    'c',
    'DEL',
    '%',
    '/',
    '9',
    '8',
    '7',
    'x',
    '6',
    '5',
    '4',
    '-',
    '3',
    '2',
    '1',
    '+',
    '0',
    '.',
    'ans',
    '=',
  ];
  late var userQuesion = '';
  late var userAnswer = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[10],
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Text(
                  'Abu-Bakar Calculator',
                  style: TextStyle(
                      color: Colors.blueAccent,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
            Expanded(
                flex: 2,
                child: Container(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(20),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        userQuesion,
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      alignment: Alignment.centerRight,
                      child: Text(
                        userAnswer,
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ],
                ))),
            Expanded(
              flex: 6,
              child: Container(
                child: GridView.builder(
                  itemCount: buttons.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4),
                  itemBuilder: (context, index) {
                    //clrar button
                    if (index == 0) {
                      return Bouttons(
                        ontab: () {
                          setState(() {
                            userQuesion = '';
                          });
                        },
                        color: Colors.green,
                        txtColor: Colors.white,
                        bouttonText: buttons[index],
                      );
                    }
                    //delete button
                    else if (index == 1) {
                      return Bouttons(
                        ontab: () {
                          setState(() {
                            userQuesion = userQuesion.substring(
                                0, userQuesion.length - 1);
                          });
                        },
                        color: Colors.red,
                        txtColor: Colors.white,
                        bouttonText: buttons[index],
                      );
                    }

                    //equel button

                    else if (index == buttons.length - 1) {
                      return Bouttons(
                        ontab: () {
                          setState(() {
                            equelPressed();
                          });
                        },
                        color: Colors.deepPurple,
                        txtColor: Colors.white,
                        bouttonText: buttons[index],
                      );
                    } else {
                      return Bouttons(
                          ontab: () {
                            setState(() {
                              userQuesion += buttons[index];
                            });
                          },
                          color: isOprator(buttons[index])
                              ? Colors.deepPurple
                              : Colors.deepPurple[50],
                          txtColor: isOprator(buttons[index])
                              ? Colors.white
                              : Colors.deepPurple,
                          bouttonText: buttons[index]);
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool isOprator(String x) {
    if (x == "%" || x == "/" || x == "x" || x == "-" || x == "+" || x == "=") {
      return true;
    }
    return false;
  }

  void equelPressed() {
    String finlanlQuestion = userQuesion;
    finlanlQuestion.replaceAll('x', '*');
    Parser p = Parser();
    Expression exp = p.parse(finlanlQuestion);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    userAnswer = eval.toString();
  }
}
