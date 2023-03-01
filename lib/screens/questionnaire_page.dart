import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:monitor_app/widgets/example_card.dart';

class QuestionnairePage extends StatefulWidget {
  const QuestionnairePage({Key? key}) : super(key: key);

  @override
  State<QuestionnairePage> createState() => _ExamplePageState();
}

class _ExamplePageState extends State<QuestionnairePage> {
  final AppinioSwiperController controller = AppinioSwiperController();

  List<ExampleCard> images = [];
  List<String> text = [
    'assets/images/image1.png',
    'assets/images/image2.png',
    'assets/images/image3.png',
    'assets/images/image4.png',
    'assets/images/image6.png',
  ];

  @override
  void initState() {
    _loadCards();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xFFE9EFF2),
        body: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.85,
              child: AppinioSwiper(
                controller: controller,
                cards: images,
                onSwipe: _swipe,
                padding: const EdgeInsets.only(
                  left: 25,
                  right: 25,
                  top: 50,
                  bottom: 20,
                ),
                onEnd: _end,
              ),
            ),
            // CupertinoButton(
            //   child: const Text("unswipe"),
            //   color: const Color(0xFF053149),
            //   onPressed: () => controller.unswipe(),
            // ),
          ],
        ),
      ),
    );
  }

  void _end(){
    Navigator.pop(context);
  }

  void _swipe(int index) {
    //print("swipe");
  }

  void _loadCards() {
    for (var i = 0 ; i < text.length; i++) {
      var questionText="";
      if(i==0){questionText="Are you getting bullied in school or somewhere else?";}
      else if(i==1){questionText="Do you feel safe in your neighbourhood?";}
      else if(i==2){questionText="Did you complete your activities and homework for today?";}
      else if(i==3){questionText="Do you feel uncomfortable around anyone?";}
      else if(i==4){questionText="Are your parents listening to you, and giving you attention?";}
      images.add(ExampleCard(image: text[i], question: questionText,));
    }
  }
}
