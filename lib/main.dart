import 'package:flutter/material.dart';
import 'package:medical_app/screens/First_Page.dart';
import 'package:medical_app/login/Login_Page.dart';
import 'package:medical_app/screens/Second_Page.dart';
import 'package:medical_app/screens/Third_Page.dart';
import 'package:medical_app/test/Broken_Leg_Page.dart';
import 'package:medical_app/test/tesst.dart';

import 'home/home_screen.dart';


void  main() {
  runApp(const MedicalApp());
}


class MedicalApp extends StatelessWidget {
  const MedicalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return    const MaterialApp(
      title: 'Medical App',
      debugShowCheckedModeBanner: false,
      home:FirstPage() ,
    );
  }
}
