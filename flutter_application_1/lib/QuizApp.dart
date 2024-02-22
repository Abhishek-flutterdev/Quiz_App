
import 'package:flutter/material.dart';

class MQuizApp extends StatefulWidget {
  const MQuizApp({super.key});
  @override
  State createState() => _MQuizAppState();
}

class MCAppData {
  String? question;
  List<String>? options;
  int? answerIndex;

  MCAppData({this.question, this.options, this.answerIndex});
}

class _MQuizAppState extends State {
  List allQuestions = [
    MCAppData(
      question: "Who is the founder of Microsoft?",
      options: ["Steve Jobs", "Jeff Bezos", "Bill Gates", "Elon Musk"],
      answerIndex: 2,
    ),
    MCAppData(
      question:
          "What is the term for a  digital currency that operates on a blockchain?",
      options: ["Euro", "Bitcoin", "Yen", "Dollar"],
      answerIndex: 1,
    ),
    MCAppData(
      question: "What is the currency of Japan?",
      options: ["Yuan", "Yen", "Won", "Ringgit"],
      answerIndex: 1,
    ),
    MCAppData(
      question: "Who is the founder of SpaceX?",
      options: ["Steve Jobs", "Jeff Bezos", "Bill Gates", "Elon Musk"],
      answerIndex: 3,
    ),
    MCAppData(
      question:
          "What does the acronym 'AI' stand for in the context of technology?",
      options: [
        "Artificial Intelligence",
        "Advanced Interface",
        " Automated Information",
        "Augmented Integration"
      ],
      answerIndex: 0,
    ),
  ];

  bool questionScreen = false;
  bool showCongratulation = false;
  int questionIndex = 0;
  int selectedIndex = -1;
  int score = 0;

  MaterialStateProperty<Color?> checkAnswer(int option) {
    if (selectedIndex != -1) {
      if (option == allQuestions[questionIndex].answerIndex) {
        if (option == selectedIndex) {
          score++;
        }
        return const MaterialStatePropertyAll(Colors.green);
      } else if (option == selectedIndex) {
        return const MaterialStatePropertyAll(Colors.red);
      } else {
        return const MaterialStatePropertyAll(Colors.white);
      }
    } else {
      return const MaterialStatePropertyAll(Colors.white);
    }
  }

  void pageNavigation() {
    if (selectedIndex != -1) {
      questionIndex++;
      selectedIndex = -1;
      if (questionIndex < allQuestions.length) {
        questionScreen = true;
      } else {
        questionScreen = false;
        showCongratulation = true;
      }
    }
    setState(() {});
  }

  Scaffold quizStartPage() {
    return Scaffold(
      body: Container(
        color: Colors.red[500],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(
              child: Text(
                "Welcome to",
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w700,
                    // color: Colors.brown,
                    fontStyle: FontStyle.italic,
                    color: Colors.black54),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 200,
              width: 200,
              child: Image.asset("assets/Quiz-PNG-HD.png"),
            ),
            const SizedBox(
              height: 15,
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                questionScreen = true;
                setState(() {});
              },
              style: const ButtonStyle(
                padding: MaterialStatePropertyAll(
                    EdgeInsets.symmetric(horizontal: 20, vertical: 10)),
                backgroundColor: MaterialStatePropertyAll(Colors.white),
              ),
              child: const Text(
                "Start Quiz",
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Scaffold congratulationPage() {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        //  color:const Color.fromARGB(255, 246, 221, 229),
        color: Colors.red[100],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 300,
              width: 300,
              child: Image.asset("assets/TrophyImage2.png"),
            ),
            const Text(
              "Congratulations!",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "You have completed the Quiz Successfully",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Score: $score/${allQuestions.length}",
              style: const TextStyle(fontSize: 23, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: 150,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  questionIndex = 0;
                  questionScreen = true;
                  showCongratulation = false;
                  selectedIndex - 1;
                  score = 0;
                  setState(() {});
                },
                style: ButtonStyle(
                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(60))),
                  backgroundColor: const MaterialStatePropertyAll(
                    Colors.white,
                  ),
                ),
                child: const Text(
                  "Restart",
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: 25,
                      fontWeight: FontWeight.w500),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Scaffold isQuestionScreen() {
    if (!questionScreen && !showCongratulation) {
      return quizStartPage();
    } else if (questionScreen) {
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            "POP QUIZ",
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w800,
                fontStyle: FontStyle.italic),
          ),
          backgroundColor: Colors.blue,
        ),
        body: Container(
          color: Colors.white,
          child: Column(
            children: [
              const SizedBox(
                height: 25,
                width: double.infinity,
              ),
              Text(
                "Question:${questionIndex + 1}/${allQuestions.length}",
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Container(
                margin: const EdgeInsets.only(left: 12),
                child: Text(
                  "${allQuestions[questionIndex].question}",
                  style: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              SizedBox(
                width: 360,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {
                    if (selectedIndex == -1) {
                      selectedIndex = 0;
                    }
                    setState(() {});
                  },
                  style: ButtonStyle(
                    alignment: Alignment.centerLeft,
                    padding: const MaterialStatePropertyAll(
                        EdgeInsets.only(left: 35)),
                    shape: MaterialStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(60),
                      ),
                    ),
                    backgroundColor: checkAnswer(0),
                  ),
                  child: Text("A. ${allQuestions[questionIndex].options[0]}"),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                width: 350,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {
                    if (selectedIndex == -1) {
                      selectedIndex = 1;
                    }
                    setState(() {});
                  },
                  style: ButtonStyle(
                    alignment: Alignment.centerLeft,
                    padding: const MaterialStatePropertyAll(
                        EdgeInsets.only(left: 35)),
                    shape: MaterialStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(60),
                      ),
                    ),
                    backgroundColor: checkAnswer(1),
                  ),
                  child: Text("B. ${allQuestions[questionIndex].options[1]}"),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                width: 360,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {
                    if (selectedIndex == -1) {
                      selectedIndex = 2;
                    }
                    setState(() {});
                  },
                  style: ButtonStyle(
                    alignment: Alignment.centerLeft,
                    padding: const MaterialStatePropertyAll(
                        EdgeInsets.only(left: 35)),
                    shape: MaterialStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(60),
                      ),
                    ),
                    backgroundColor: checkAnswer(2),
                  ),
                  child: Text("C. ${allQuestions[questionIndex].options[2]}"),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                width: 360,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {
                    if (selectedIndex == -1) {
                      selectedIndex = 3;
                    }
                    setState(() {});
                  },
                  style: ButtonStyle(
                    alignment: Alignment.centerLeft,
                    padding: const MaterialStatePropertyAll(
                        EdgeInsets.only(left: 35)),
                    shape: MaterialStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(60),
                      ),
                    ),
                    backgroundColor: checkAnswer(3),
                  ),
                  child: Text("D. ${allQuestions[questionIndex].options[3]}"),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            pageNavigation();
          },
          backgroundColor: Colors.blue,
          child: const Icon(Icons.navigate_next),
        ),
      );
    } else if (showCongratulation) {
      return congratulationPage();
    }
    return const Scaffold();
  }

  @override
  Widget build(BuildContext context) {
    return isQuestionScreen();
  }
}
