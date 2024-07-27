import 'package:flutter/material.dart';

Widget buildBackButtonHeader(String title, Function backPressed) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              debugPrint("back button is pressed");
              backPressed();
            },
            child: Center(
              child: Container(
                padding: const EdgeInsets.all(12),
                child: Image.asset(
                  "./assets/images/left_arrow.png",
                  width: 35,
                ),
              ),
            ),
          ),
        ],
      ),
      Container(
        width: double.infinity,
        height: 1,
        color: hexToColor("#4F346B"),
      )
    ],
  );
}

Widget buildButton(
  String title,
  Function onPressed, {
  double leftMargin = 30,
  double rightMargin = 30,
  double topMargin = 0,
  double bottomMargin = 40,
  double fontSize = 20,
  double height = 65,
  double width = double.infinity,
  String backgroundColor = '#D658E6',
  String firstGradientColor = '#D658E6',
  String secondGradientColor = '#5B3C7C',
  String textColor = "#FFFFFF",
  var isButtonVisible = true,
  var isProgressBarVisible = false,
}) {
  return Stack(
    alignment: Alignment.center,
    children: [
      Container(
        width: width,
        height: height,
        margin: EdgeInsets.fromLTRB(
          leftMargin,
          topMargin,
          rightMargin,
          bottomMargin,
        ),
        child: Visibility(
          visible: isButtonVisible,
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  hexToColor(firstGradientColor),
                  hexToColor(secondGradientColor),
                ], // Example gradient colors
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: ElevatedButton(
              onPressed: () {
                onPressed();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent, // Transparent background
                elevation: 0, // No shadow
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: FittedBox(
                child: Text(
                  title,
                  style: TextStyle(
                    color: hexToColor(textColor),
                    fontWeight: FontWeight.bold,
                    fontSize: fontSize,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      Visibility(
        visible: isProgressBarVisible,
        child: const CircularProgressIndicator(color: Color(0xFF4F346B)),
      ),
    ],
  );
}

Color hexToColor(String code) {
  return Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
}
