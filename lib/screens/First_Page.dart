import 'package:flutter/material.dart';
import 'package:medicalappsproject/home/home_screen.dart';
import 'package:medicalappsproject/screens/Second_Page.dart';
import '../home/home.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right:10.0),
              child: TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const NewHome()));
                  },
                  child: const Text(
                    'Skip',
                    style: TextStyle(fontSize: 22),
                  )),
            ),
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage('asserts/medical5.jpg'),
                  backgroundColor: Colors.white,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Healthy App",
                  style: TextStyle(
                    fontSize: 40,
                    color: Color.fromARGB(255, 3, 83, 164),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const CircleAvatar(
              radius: 170,
              backgroundColor: Colors.white,
              backgroundImage: AssetImage("asserts/medical.jpg"),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              alignment: Alignment.center,
              child: const Text(
                "In our application, we will help you diagnose some diseases, and by a large percentage, the diagnosis will be correct ",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  height: 1.2,
                  color: Color.fromARGB(255, 6, 26, 64),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  heroTag: 'page1',
                  mini: true,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const SecondPage()));
                  },
                  child: const Icon(Icons.arrow_left,size: 40,),
                ),
              ],
            ),
          ],
        ));
  }
}
