import 'package:flutter/material.dart';

Widget defaultElvaButyon({
  double width = double.infinity,
  double height = 60,
  Color backcolor = Colors.red,
  double radius = 0.0,
  required String text,
  required Function function,
}) =>
    Container(
      width: width,
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backcolor,
          textStyle: const TextStyle(
            fontSize: 8,
          ),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius)),
        ),
        onPressed: function()
        //  () {
        // print(emailController.text);
        // print(passwordController.text);
        //   Navigator.push(
        //       context,
        //       MaterialPageRoute(
        //           builder: (context) => HomeScreen()));
        // }
        ,
        child: Text(
          text,
          style: const TextStyle(fontSize: 28, color: Colors.white),
        ),
      ),
    );

// Widget defaultTextButton(){
//     required String text,
//     required Function function,
// } => TextButton(
//     onPressed = function,
//     child =  Text(
//       text,
//       style: const TextStyle(fontSize: 22),
//     )) {
//       // TODO: implement TextButton
//       throw UnimplementedError();
//     }

Widget HomeStyle({
  double width = 250,
  double heightContainer = 320,
  Color color = const Color.fromARGB(255, 21, 139, 172),
  double radiusContainer = 30,
  double radiusText = 20,
  double heightImg = 270,
  Function? touchTex,
  Function? touchCont,
  required String image,
  required String text,
}) =>
    Container(
      height: heightContainer,
      width: width,
      decoration: BoxDecoration(
          color: color, borderRadius: BorderRadius.circular(radiusContainer)),
      child: Column(children: [
        Container(
          decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(radiusContainer)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: touchCont!(),
                child: Container(
                  width: width,
                  height: heightImg,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(radiusText),
                        topRight: Radius.circular(radiusText)),
                    image: DecorationImage(
                      image: AssetImage("asserts/$image.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        TextButton(
          onPressed: touchCont(),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Column(
              children: [
                Text(
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.start,
                  "${text.toString()}",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ]),
    );

Widget TitleTextMessg({
  String text = 'Warring',
}) =>
    Padding(
      padding: EdgeInsets.only(left: 87.0),
      child: Text(
        text,
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 20, color: Colors.red),
      ),
    );

Widget ContentTextMessg({
  String text = 'The accuracy is 89% and you must also consult a doctor\nIf the result does not appear, go back and try again',
}) =>
    Text(text);

