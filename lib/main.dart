import 'package:flutter/material.dart';
import 'package:medicalappsproject/diseases_screens/Broken_Leg_Page.dart';
import 'package:medicalappsproject/screens/First_Page.dart';
import 'package:medicalappsproject/login/Login_Page.dart';
import 'package:medicalappsproject/screens/Second_Page.dart';
import 'package:medicalappsproject/screens/Third_Page.dart';
import 'package:medicalappsproject/home/home_screen.dart';
import 'package:medicalappsproject/test/tesst.dart';

import 'home/home.dart';
import 'home/home_screen_xd.dart';


void  main() {
  runApp(const MedicalApp());
}


class MedicalApp extends StatelessWidget {
  const MedicalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Medical App',
      debugShowCheckedModeBanner: false,
      home:FirstPage() ,
    );
  }
}
