import 'package:flutter/cupertino.dart';

class ExampleCard extends StatelessWidget {
  final String image;
  final String question;

  const ExampleCard({
    Key? key,
    required this.image,
    required this.question,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: CupertinoColors.white,
        boxShadow: [
          BoxShadow(
            color: CupertinoColors.systemGrey.withOpacity(0.2),
            spreadRadius: 3,
            blurRadius: 7,
            offset: const Offset(0, 3),
          )
        ],
      ),
      alignment: Alignment.center,
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              question,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          SizedBox(height: 50,),
          // const Spacer(),
          SizedBox(
            height: 250,
            child: Image.asset(
              image,
              fit: BoxFit.fill,
              alignment: Alignment.topCenter,
            ),
          ),
          // const Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xFF053149),
                ),
                child: const Text(
                  "Yes",
                  style: TextStyle(
                    fontSize: 20,
                    color: CupertinoColors.white,
                  ),
                ),
                height: 50,
                width: 300,
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xFF053149),
                ),
                child: const Text(
                  "No",
                  style: TextStyle(
                    fontSize: 20,
                    color: CupertinoColors.white,
                  ),
                ),
                height: 50,
                width: 300,
              ),
            ],
          ),
          SizedBox(height: 20,),
          // const SizedBox(
          //   height: 40,
          // ),
        ],
      ),
    );
  }
}