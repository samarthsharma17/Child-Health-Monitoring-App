import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:monitor_app/main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class OnBoardingPage extends StatefulWidget {
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    _storeOnboardInfo();
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => GetStats()),
    );
  }

  Widget _buildImage(String assetName) {
    return Align(
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Image.asset('assets/images/$assetName.png', width: 300.0),
      ),
      alignment: Alignment.bottomCenter,
    );
  }

  _storeOnboardInfo() async {
    print("Shared pref called");
    int isViewed = 0;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('onBoard', isViewed);
    print(prefs.getInt('onBoard'));
  }

  @override
  Widget build(BuildContext context) {

    const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: TextStyle(fontSize: 19.0),
      descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return Padding(
      padding: const EdgeInsets.only(top:28.0),
      child: IntroductionScreen(
        // curve: Curves.elasticIn,
        key: introKey,
        pages: [
          PageViewModel(
            title: "Trusted Counsellors",
            body:
            "Consult with proficient and well-versed child psychologists and counsellors, to keep a closer track of your child's mental well being.",
            image: _buildImage('image3'),
            decoration: pageDecoration,
          ),
          PageViewModel(
            title: "Nutrition Tracking",
            body:
            "Track the physical well-being of your child by monitoring the nutritional content of each meal, simply by uploading images of the meal.",
            image: _buildImage('image6'),
            decoration: pageDecoration,
          ),
          PageViewModel(
            title: "Monitor Digital Activity",
            body:
            "Everything you need to know about your kid's screen time on different apps. Assess and analyze your child's day to day digital activity.",
            image: _buildImage('image1'),
            decoration: pageDecoration,
          ),
          PageViewModel(
            title: "Age-Sensitive Media Suggestions",
            body: "Media suggestions based on age-groups so that children are raised in a healthy and clean environment digitally.",
            image: _buildImage('image4'),
            // footer: ElevatedButton(
            //   onPressed: () {
            //     introKey.currentState?.animateScroll(0);
            //   },
            //   child: const Text(
            //     'FooButton',
            //     style: TextStyle(color: Colors.white),
            //   ),
            //   style: ElevatedButton.styleFrom(
            //     primary: Colors.lightBlue,
            //     shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(8.0),
            //     ),
            //   ),
            // ),
            decoration: pageDecoration,
          ),
          PageViewModel(
            title: "Comprehensive Features",
            body: "Multiple other features to assess the overall well-being of the child and to fulfil all the needs of the parent.",
            // bodyWidget: Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: const [
            //     Text("Click on ", style: bodyStyle),
            //     Icon(Icons.edit),
            //     Text(" to edit a post", style: bodyStyle),
            //   ],
            // ),
            image: _buildImage('image2'),
            decoration: pageDecoration,
          ),
        ],
        onDone: () => _onIntroEnd(context),
        //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
        showSkipButton: true,
        skipFlex: 0,
        nextFlex: 0,
        skip: const Text('Skip', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600)),
        next: const Icon(Icons.arrow_forward),
        done: const Text('Done', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600)),
        dotsDecorator: const DotsDecorator(
          size: Size(10.0, 10.0),
          color: Color(0xFFBDBDBD),
          activeSize: Size(22.0, 10.0),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(25.0)),
          ),
        ),
        showNextButton: false,
        globalBackgroundColor: Colors.white,
      ),
    );
  }
}
