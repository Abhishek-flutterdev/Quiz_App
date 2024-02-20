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
      question: "Who is the founder of Apple?",
      options: ["Steve Jobs", "Jeff Bezos", "Bill Gates", "Elon Musk"],
      answerIndex: 0,
     ),

     MCAppData(
      question: "Who is the founder of Amazon?",
      options: ["Steve Jobs", "Jeff Bezos", "Bill Gates", "Elon Musk"],
      answerIndex: 1,
     ),

     MCAppData(
      question: "Who is the founder of Spacex?",
      options: ["Steve Jobs", "Jeff Bezos", "Bill Gates", "Elon Musk"],
      answerIndex: 3,
     ),

     MCAppData(
      question: "Who is the founder of Google?",
      options: ["Steve Jobs", "Larry Page", "Bill Gates", "Elon Musk"],
      answerIndex: 1,
     ),

   ];

   bool questionScreen = true;
   int questionIndex = 0;
   int selectedIndex = -1;
   int score = 0;

   MaterialStateProperty<Color?> checkAnswer(int option) {
    if(selectedIndex != -1) {
      if(option == allQuestions[questionIndex].answerIndex) {
        if(option == selectedIndex) {
          score++;
        }
        return const MaterialStatePropertyAll(Colors.green);
      }else if (option == selectedIndex) {
        return const MaterialStatePropertyAll(Colors.red);
      }
      else {
        return const MaterialStatePropertyAll(Colors.white);
      }
    } else {
      return const MaterialStatePropertyAll(Colors.white);
    }
   }

   void pageNevigation() {
    if(selectedIndex != -1) {
      questionIndex++;
      selectedIndex = -1;
      if(questionIndex > allQuestions.length-1) {
        questionScreen = false;
      }
    }
    setState(() {});
   }

   Scaffold isQuestionScreen() {
    if(questionScreen) {
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Quiz App",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w800,
            ),
          ),
          backgroundColor: Colors.blue,
        ),

        body: Column(
          children: [
           const SizedBox(
              height: 25,
            ),

            Text("Question:${questionIndex+1}/${allQuestions.length}",
             style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w600,
             ),
            ),

            const SizedBox(
              height: 50,
            ),
            
           Container(
            margin: const EdgeInsets.only(left:12),
            child: Text("${allQuestions[questionIndex].question}",
             style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w600
             ),
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
                if(selectedIndex == -1) {
                  selectedIndex = 0;
                }
                setState(() {
                  
                });
              },
              style: ButtonStyle(
                alignment: Alignment.centerLeft,
                padding: const MaterialStatePropertyAll(
                  EdgeInsets.only(left: 35)
                ),
                shape: MaterialStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(60),
                  ),
                ),
                backgroundColor: checkAnswer(0),
              ),
              child: Text(
                "A. ${allQuestions[questionIndex].options[0]}"
              ),
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
                if(selectedIndex == -1) {
                  selectedIndex = 1;
                }
                setState(() {
                  
                });
              },
               style: ButtonStyle(
                alignment: Alignment.centerLeft,
                padding: const MaterialStatePropertyAll(
                  EdgeInsets.only(left: 35)
                ),
                shape: MaterialStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(60),
                  ),
                ),
                backgroundColor: checkAnswer(1),
              ),
              child: Text(
                "B. ${allQuestions[questionIndex].options[1]}"
              ),
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
                if(selectedIndex == -1) {
                  selectedIndex = 2;
                }
                setState(() {
                  
                });
              },
               style: ButtonStyle(
                alignment: Alignment.centerLeft,
                padding: const MaterialStatePropertyAll(
                  EdgeInsets.only(left: 35)
                ),
                shape: MaterialStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(60),
                  ),
                ),
                backgroundColor: checkAnswer(2),
              ),
              child: Text(
                "C. ${allQuestions[questionIndex].options[2]}"
              ),
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
                if(selectedIndex == -1) {
                  selectedIndex = 3;
                }
                setState(() {
                  
                });
              },
               style: ButtonStyle(
                alignment: Alignment.centerLeft,
                padding: const MaterialStatePropertyAll(
                  EdgeInsets.only(left: 35)
                ),
                shape: MaterialStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(60),
                  ),
                ),
                backgroundColor: checkAnswer(3),
              ),
              child: Text(
                "D. ${allQuestions[questionIndex].options[3]}"
              ),
            ),
           ),
           
          ],
        ),

        floatingActionButton: FloatingActionButton(onPressed: ()
         {
          pageNevigation();
         },
         backgroundColor: Colors.blue,
         child: const Icon(Icons.navigate_next),
         ),
      );
    } else {
      return Scaffold(
        body: Container(
          alignment: Alignment.center,
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [ 
              SizedBox(
                height: 300,
                width: 300,
                child: Image.asset("assetsImage/Trophy_Image.jpg"),
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
              style: const TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.w600
              ),
             ),

             const SizedBox(
              height: 10,
             ),

             SizedBox(
              width: 150,
              height: 50,
              child: ElevatedButton(onPressed: ()
              {
                questionIndex = 0;
                questionScreen = true;
                selectedIndex-1;
                score = 0;
                setState(() {
                  
                });
              }, 
              style: ButtonStyle(
                shape: MaterialStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(60))
                ),
                backgroundColor: const MaterialStatePropertyAll(
                  Colors.blue,
                ),
              ),
              
              child: const Text(
                "Restart",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.w500
                ),
               ),  
              ),
             )
            ],
          )
        ),
      );
    }
   }

   @override
   Widget build(BuildContext context) {
    return isQuestionScreen();
   }
}