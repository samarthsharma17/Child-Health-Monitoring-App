import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:monitor_app/screens/features_screen.dart';
import 'package:monitor_app/screens/questionnaire_page.dart';
import 'package:monitor_app/screens/todo_list_screen.dart';
import 'package:monitor_app/screens/usage_stats_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/onboarding_page.dart';

int? isviewed;

void main() async {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  isviewed = prefs.getInt('onBoard');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  List<PageViewModel> getPages() {
    return [
      PageViewModel(
        image: Image.asset("assets/images/ambulance.png"),
        title: 'Ambulance',
        body: 'Subscribe here',
      ),
      PageViewModel(
          image: Image.asset("assets/images/ambulance.png"),
          title: 'Ambulance',
          body: 'Subscribe here'),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: isviewed != 0 ? OnBoardingPage() : GetStats(),
    );
  }
}

class GetStats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Container(
        color: Colors.blue,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                  child: Container(
                    height: 50,
                    width: 100,
                    color: Colors.greenAccent,
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ShowStats()));
                  }),
              GestureDetector(
                  child: Container(
                    height: 50,
                    width: 100,
                    color: Colors.brown,
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TodoApp()));
                  }),
              GestureDetector(
                  child: Container(
                    height: 50,
                    width: 100,
                    color: Colors.orange,
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => QuestionnairePage()));
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
