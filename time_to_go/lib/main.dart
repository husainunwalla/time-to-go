import 'dart:developer';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'dart:async';

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
  var now = DateTime.now();
  final flight = DateTime.parse('2022-09-02 23:40:00');
  var time = 'Hello';

  @override
  void initState() {
    super.initState();

    // defines a timer
    Timer everySecond = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      setState(() {
        now = DateTime.now();
        time =
            '${flight.difference(now).inDays}D ${flight.difference(now).inHours % 24}H ${flight.difference(now).inMinutes % 60}M ${flight.difference(now).inSeconds % 60}S';
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      ConstrainedBox(
        constraints: const BoxConstraints.expand(),
        child: Image.asset(
          'assets/waves.jpg',
          fit: BoxFit.cover,
          alignment: Alignment.topLeft,
        ),
      ),
      Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
            Container(
                decoration: const BoxDecoration(
                  //Here goes the same radius, u can put into a var or function
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(0, 0, 0, 0),
                      spreadRadius: 20,
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                        child: BackdropFilter(
                            filter:
                                ImageFilter.blur(sigmaX: 100.0, sigmaY: 100.0),
                            child: Padding(
                                padding: const EdgeInsets.all(15),
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const Text(
                                        'Friday\nSEPTEMBER 2, 2022\n11:40 PM',
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                200, 255, 255, 255),
                                            fontWeight: FontWeight.w900,
                                            fontStyle: FontStyle.normal,
                                            fontFamily: 'Open Sans',
                                            fontSize: 33),
                                        textAlign: TextAlign.left,
                                      ),
                                      Image.asset(
                                        'assets/plane.gif',
                                        width: 150,
                                        height: 150,
                                      ),
                                      const Text(
                                        'Take-Off In',
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                199, 255, 164, 164),
                                            fontWeight: FontWeight.w900,
                                            fontStyle: FontStyle.normal,
                                            fontFamily: 'Open Sans',
                                            fontSize: 30),
                                      ),
                                      Text(
                                        time,
                                        style: const TextStyle(
                                            color: Color.fromARGB(
                                                200, 255, 255, 255),
                                            fontWeight: FontWeight.w900,
                                            fontStyle: FontStyle.normal,
                                            fontFamily: 'Open Sans',
                                            fontSize: 30),
                                      ),
                                    ],
                                  ),
                                ))))))
          ]))
    ]));
  }
}
