import 'package:flutter/material.dart';

import '../home/home_screen.dart';
import '../login/Login_Page.dart';


class ThirdPage extends StatelessWidget {
  const ThirdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 0, 58, 186),
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
                    children: const [
                      CircleAvatar(
                        radius: 150,
                        backgroundColor: Color.fromARGB(255, 0, 58, 186),
                        backgroundImage: AssetImage("asserts/third.jpg"),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Go Medical App",
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
                        MaterialPageRoute(
                            builder: (context) => const NewHome()),
                      );
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(45)),
                    color: const Color.fromARGB(255, 72, 132, 236),
                    splashColor: const Color.fromARGB(255, 46, 183, 221),
                    child: const Text(
                      'Let\'s Started',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                      ),
                    ),
                  ),
                  const SizedBox(
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
                                builder: (context) => LoginPag(),
                              ));
                        },
                        shape: RoundedRectangleBorder(
                            side:
                                const BorderSide(width: 1, color: Colors.white),
                            borderRadius: BorderRadius.circular(45)),
                        color: const Color.fromARGB(255, 72, 132, 236),
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
