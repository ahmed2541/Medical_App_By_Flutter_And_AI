import 'package:flutter/material.dart';
import 'package:medicalappsproject/home/home.dart';
import 'package:medicalappsproject/login/Login_Page.dart';
import 'package:medicalappsproject/modules/Second_Page.dart';
import 'package:medicalappsproject/home/home_screen.dart';

class ThirdPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 0,58,186),
        body: Container(
          width: double.infinity,
          padding: const EdgeInsets.only(top: 10),
          decoration: const BoxDecoration(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 150,
                        backgroundColor: Color.fromARGB(255, 0,58,186),
                        backgroundImage: AssetImage("asserts/third.jpg"),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Go Healthy App",
                    style: TextStyle(
                        shadows: [Shadow(offset: Offset.infinite)],
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 221, 227, 227)),
                  )
                ],
              ),
              Column(
                children: [
                  MaterialButton(
                    height: 55,
                    minWidth: 250,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Home()),
                      );
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(45)),
                    color: Color.fromARGB(255, 72, 132, 236),
                    splashColor: Color.fromARGB(255, 46, 183, 221),
                    child: const Text(
                      'Let\'s Started',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      MaterialButton(
                        height: 45,
                        minWidth: 160,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()),
                          );
                        },
                        shape: RoundedRectangleBorder(
                            side: BorderSide(width: 1, color: Colors.white),
                            borderRadius: BorderRadius.circular(45)),
                        color: Color.fromARGB(255, 72, 132, 236),
                        child: const Text(
                          'Login',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
