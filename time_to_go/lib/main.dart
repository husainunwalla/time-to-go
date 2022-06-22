import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int daysBetween(DateTime from, DateTime to) {
    from = DateTime(from.year, from.month, from.day);
    to = DateTime(to.year, to.month, to.day);
    return (to.difference(from).inHours / 24).round();
  }

  final now = DateTime.now();
  final flight = DateTime.parse('2022-09-02 23:40:00');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      ConstrainedBox(
        constraints: const BoxConstraints.expand(),
        child: Image.asset(
          'assets/golden_gate.png',
          fit: BoxFit.cover,
          alignment: Alignment.topLeft,
        ),
      ),
      Center(
          child: ClipRect(
              child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                  child: Container(
                      width: 375,
                      height: 375,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade200.withOpacity(0.5)),
                      child: Center(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/plane.gif',
                                width: 150,
                                height: 150,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    '${flight.difference(now).inDays}D',
                                    style: TextStyle(
                                        color: Colors.grey[800],
                                        fontWeight: FontWeight.w900,
                                        fontStyle: FontStyle.italic,
                                        fontFamily: 'Open Sans',
                                        fontSize: 40),
                                  ),
                                  Text(
                                    '${flight.difference(now).inHours % 24}H',
                                    style: TextStyle(
                                        color: Colors.grey[800],
                                        fontWeight: FontWeight.w900,
                                        fontStyle: FontStyle.italic,
                                        fontFamily: 'Open Sans',
                                        fontSize: 40),
                                  ),
                                  Text(
                                    '${flight.difference(now).inMinutes % 60}M',
                                    style: TextStyle(
                                        color: Colors.grey[800],
                                        fontWeight: FontWeight.w900,
                                        fontStyle: FontStyle.italic,
                                        fontFamily: 'Open Sans',
                                        fontSize: 40),
                                  )
                                ],
                              )
                            ]),
                      )))))
    ]));
  }
}
