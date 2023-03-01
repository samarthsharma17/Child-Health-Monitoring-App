import 'package:flutter/material.dart';
import '../constants.dart';

class IconContent extends StatelessWidget {
  final String iconText;
  final IconData iconImage;

  IconContent({required this.iconText, required this.iconImage});

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            iconImage,
            size: 80.0,
          ),
          SizedBox(
            height: 20.0,
          ),
          Text(
            iconText,
            style: kSubtitleTextStyle,
          ),
        ]);
  }
}

class RoundIconButton extends StatelessWidget {

  RoundIconButton({required this.iconValue, required this.buttonPressedByUser});
  final IconData iconValue;
  final Function buttonPressedByUser;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      shape: CircleBorder(),
      elevation: 5.0,
      constraints: BoxConstraints.tightFor(
        width: 48.0,
        height: 48.0,
      ),
      fillColor: Color(0xFF4C4F5E),
      onPressed: ()=>buttonPressedByUser,
      child:Icon(iconValue),
    );
  }
}

// class BottomButton extends StatelessWidget {
//
//   BottomButton({required this.onBottomButtonTap, required this.bottomButtonText});
//
//   final Function onBottomButtonTap;
//   final String bottomButtonText;
//
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: ()=>onBottomButtonTap,
//       child: Container(
//         alignment: Alignment.center,
//         child: Text(
//           bottomButtonText,
//           style: kBottomButtonTextStyle,
//         ),
//         color: kBottomBarColor,
//         width: double.infinity,
//         margin: EdgeInsets.only(top: 10.0),
//         padding: EdgeInsets.all(15.0),
//         height: kBottomBarHeight,
//       ),
//     );
//   }
// }

class BodyContainer extends StatelessWidget {
  BodyContainer({required this.colour, required this.cardChild, required this.buttonPressed});

  final Color colour;
  final Widget cardChild;
  final Function buttonPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>buttonPressed,
      child: Container(
          margin: EdgeInsets.all(15.0),
          decoration: BoxDecoration(
            color: colour,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: cardChild),
    );
  }
}