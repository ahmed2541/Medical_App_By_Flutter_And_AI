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
