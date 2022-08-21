import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var engNumber = 4;
  var firstImage = 2;
  var secondImage = 4;
  var thirdImage = 6;
  var fourthImage = 9;

  List myanmarNumList = [1, 2, 3, 4, 5, 6, 7, 8, 9];
  var showAnswer = '';

  void getRandom() {
    myanmarNumList.shuffle();
    setState(() {
      firstImage = myanmarNumList[0];
      secondImage = myanmarNumList[1];
      thirdImage = myanmarNumList[2];
      fourthImage = myanmarNumList[3];
      var answerList = [firstImage, secondImage, thirdImage, fourthImage];
      answerList.shuffle();
      engNumber = answerList[0];
      visible = 0;
    });
  }

  var visible = 0.0;

  void checkAnswer(int cardNumber) {
    setState(() {
      if (engNumber == cardNumber) {
        scaffoldMsgSuccess();
        visible = 1;
      } else {
        scaffoldMsgFailed();
      }
    });
  }

  InkWell onTap(var image, var img) {
    return InkWell(
      onTap: () {
        checkAnswer(image);
      },
      child: Image.asset(
        'images/$img.png',
        height: 150,
        width: 150,
      ),
    );
  }

  void scaffoldMsgFailed() {
    setState(() {
      const snackBar = SnackBar(
        content: Text('Your answer is wrong'),
        duration: Duration(milliseconds: 300),
        backgroundColor: Colors.red,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    });
  }

  void scaffoldMsgSuccess() {
    setState(() {
      const snackBar = SnackBar(
        content: Text('Your answer is Correct'),
        duration: Duration(milliseconds: 1500),
        backgroundColor: Colors.green,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    });
  }

  ElevatedButton nextLesson() {
    return ElevatedButton(
        onPressed: () {
          getRandom();
        },
        child: const Text('Next Lesson'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pick a number'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Text(
              'Choose A Number Which Is Same As',
              style: GoogleFonts.roboto(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              '$engNumber',
              style: GoogleFonts.roboto(
                fontSize: 60,
                color: Colors.red,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                onTap(firstImage, firstImage),
                onTap(secondImage, secondImage)
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                onTap(thirdImage, thirdImage),
                onTap(fourthImage, fourthImage)
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Opacity(
              opacity: visible,
              child: nextLesson(),
            )
          ],
        ),
      ),
    );
  }
}
