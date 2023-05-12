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

Widget newhomestyle({
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
                  style: const TextStyle(fontSize: 18, color: Colors.white),
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
      padding: const EdgeInsets.only(left: 87.0),
      child: Text(
        text,
        style: const TextStyle(
            fontWeight: FontWeight.bold, fontSize: 20, color: Colors.red),
      ),
    );

Widget ContentTextMessg({
  String text =
      'The accuracy is 90% and you must also consult a doctor\n\nIf the result does not appear, go back and try again.',
}) =>
    Text(text,style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500),);

Widget HomeStyleContiner({
  double height = 320,
  double width = 250,
  required String nameDisease,
  required String nameImage,
}) =>
    Container(
      height: height,
      width: width,
      child: Column(children: [
        Container(
          decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.05),
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: width,
                height: height-50,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  image: DecorationImage(
                    image: AssetImage("asserts/$nameImage.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          width: width,
          height: 50,
          decoration: const BoxDecoration(
              color: Color.fromARGB(255, 21, 139, 172),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20))),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Column(
              children: [
                Text(
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.start,
                  nameDisease,
                  style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 21,
                      color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ]),
    );

Widget NameForEachSection({required String nameSection,double textsize=22}) => Padding(
      padding: EdgeInsets.only(left: 8.0),
      child: Align(
        alignment: Alignment.topLeft,
        child: Text(
          nameSection,
          style: TextStyle(
              fontSize: textsize, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
    );
