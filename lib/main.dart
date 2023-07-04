import 'package:calculator/components/mybutton.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  var userinput = '';
  var ans = '';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: Colors.black,
          // appBar: AppBar(
          //   title: const Center(child: Text('Calculator')),
          // ),
          appBar: AppBar(
            backgroundColor: Colors.black,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        userinput.toString(),
                        style:
                            const TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      Text(
                        ans.toString(),
                        style:
                            const TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          MyButton(
                            title: 'AC',
                            onpress: () {
                              userinput = '';
                              ans = '';
                              setState(() {});
                            },
                          ),
                          MyButton(
                            title: '+/-',
                            onpress: () {},
                          ),
                          MyButton(
                            title: '%   ',
                            onpress: () {
                              userinput += '%';
                              setState(() {});
                            },
                          ),
                          MyButton(
                            title: '/',
                            onpress: () {
                              userinput += '/';
                              setState(() {});
                            },
                            color: Colors.amberAccent,
                          )
                        ],
                      ),
                      Row(
                        children: [
                          MyButton(
                            title: '7',
                            onpress: () {
                              userinput += '7';
                              setState(() {});
                            },
                          ),
                          MyButton(
                            title: '8',
                            onpress: () {
                              userinput += '8';
                              setState(() {});
                            },
                          ),
                          MyButton(
                            title: '9',
                            onpress: () {
                              userinput += '9';
                              setState(() {});
                            },
                          ),
                          MyButton(
                            title: '*',
                            onpress: () {
                              userinput += '*';
                              setState(() {});
                            },
                            color: Colors.amberAccent,
                          )
                        ],
                      ),
                      Row(
                        children: [
                          MyButton(
                            title: '4',
                            onpress: () {
                              userinput += '4';
                              setState(() {});
                            },
                          ),
                          MyButton(
                            title: '5',
                            onpress: () {
                              userinput += '5';
                              setState(() {});
                            },
                          ),
                          MyButton(
                            title: '6',
                            onpress: () {
                              userinput += '6';
                              setState(() {});
                            },
                          ),
                          MyButton(
                            title: '-',
                            onpress: () {
                              userinput += '-';
                              setState(() {});
                            },
                            color: Colors.amberAccent,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          MyButton(
                            title: '1',
                            onpress: () {
                              userinput += '1';
                              setState(() {});
                            },
                          ),
                          MyButton(
                            title: '2',
                            onpress: () {
                              userinput += '2';
                              setState(() {});
                            },
                          ),
                          MyButton(
                            title: '3',
                            onpress: () {
                              userinput += '3';
                              setState(() {});
                            },
                          ),
                          MyButton(
                            title: '+',
                            onpress: () {
                              userinput += '+';
                              setState(() {});
                            },
                            color: Colors.amberAccent,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          MyButton(
                            title: '0',
                            onpress: () {
                              userinput += '0';
                              setState(() {});
                            },
                          ),
                          MyButton(
                            title: '.',
                            onpress: () {
                              userinput += '.';
                              setState(() {});
                            },
                          ),
                          MyButton(
                            title: 'DEL',
                            onpress: () {
                              userinput =
                                  userinput.substring(0, userinput.length - 1);
                              setState(() {});
                            },
                          ),
                          MyButton(
                            title: '=',
                            onpress: () {
                              equalpress();
                              setState(() {});
                            },
                            color: Colors.amberAccent,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }

  void equalpress() {
    Parser p = Parser();
    Expression expression = p.parse(userinput);
    ContextModel contextModel = ContextModel();
    double eval = expression.evaluate(EvaluationType.REAL, contextModel);
    ans = eval.toString();
  }
}
