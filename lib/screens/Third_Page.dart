import 'package:flutter/material.dart';

import '../home/home_screen.dart';
import '../login/Login_Page.dart';

class ThirdPage extends StatelessWidget {
  const ThirdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.73,
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Color.fromARGB(255, 0, 58, 186),
                    Color.fromARGB(255, 160, 166, 179),
                  ]),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.elliptical(250, 160),
                    bottomRight: Radius.elliptical(250, 160),
                  )),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Container(
                      height: 400,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/images/thri-rm.png"),
                              fit: BoxFit.contain)),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
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
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.27,
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Color.fromARGB(255, 0, 58, 186),
                    Color.fromARGB(255, 92, 108, 143),
                  ]),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(150),
                    topRight: Radius.circular(150),
                  )),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
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
            ),
          ],
        ));
  }
}
