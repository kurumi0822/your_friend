import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.yomogiTextTheme(),
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    QuestionScreen(),
    Text(
      'メニュー2',
      style: GoogleFonts.yomogi(fontSize: 25.0),
    ),
    Text(
      'メニュー3',
      style: GoogleFonts.yomogi(fontSize: 25.0),
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Friend"),
        titleTextStyle: GoogleFonts.yomogi(fontSize: 20),
        backgroundColor: Color(0xFFFFC5AD),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.question_answer),
            label: 'おはなし',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'おへや',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'おもいで',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}

class QuestionScreen extends StatefulWidget {
  @override
  _QuestionScreenState createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  String question = "あおいちゃんは、\n犬と猫どっちが好き？";
  List<String> answers = ["犬が好き", "猫が好き"];
  String imagePath = 'images/usagihatena.PNG';

  void _updateQuestion(String answer) {
    setState(() {
      if (answer == '犬が好き' || answer == '猫が好き') {
        if (answer == '犬が好き') {
          question = "犬が好きなんだね！\nどうして犬が好きなの？";
          answers = ["散歩が好き", "芸ができる\nのが好き"];
        } else {
          question = "猫が好きなんだね！\nどうして猫が好きなの？";
          answers = ["自由なところが好き", "柔らかいところが好き"];
        }
      } else {
        question = "教えてくれてありがとう！";
        answers = [];
        imagePath = 'images/usagi.PNG';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFFFFF8F5), Color(0xFFFFD5C3)],
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "おはなし しよう！",
                style: GoogleFonts.yomogi(
                  fontSize: 30.0,
                ),
              ),
            ),
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Image(
                  image: AssetImage('images/hukidasi.PNG'),
                  height: 150,
                ),
                Text(
                  question,
                  style: GoogleFonts.yomogi(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            Image(
              image: AssetImage(imagePath),
              height: 220,
            ),
            Stack(
              children: [
                Container(
                  height: 300,
                  color: Color(0xFFFFC5AD),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Center(
                    child: Column(
                      children: answers.map((answer) {
                        return SizedBox(
                          width: 300,
                          height: 120,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                shape: const StadiumBorder(),
                                side: const BorderSide(
                                    color: Color.fromARGB(255, 255, 122, 112), width: 3),
                              ),
                              onPressed: () {
                                _updateQuestion(answer);
                              },
                              child: Text(
                                answer,
                                style: GoogleFonts.yomogi(
                                  fontSize: 30.0,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
