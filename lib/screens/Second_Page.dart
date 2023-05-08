import 'package:flutter/material.dart';
import 'package:medicalappsproject/home/home_screen.dart';
import '../home/home.dart';
import 'Third_Page.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

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
                  "Medical App",
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
              backgroundImage: AssetImage("asserts/medical2.jpg"),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              alignment: Alignment.center,
              child: const Text(
                "but you must also consult a doctor, and we will also give you some instructions about this disease",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  color: Color.fromARGB(255, 6, 26, 64),
                ),
              ),
            ),
            const SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  heroTag: 'page2',
                  mini: true,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const ThirdPage()));
                  },
                  child: const Icon(Icons.arrow_left,size: 40,),
                ),
                // FloatingActionButton(
                //   heroTag: 'page1agnin',
                //   mini: true,
                //   onPressed: () {
                //     Navigator.push(context,
                //         MaterialPageRoute(builder: (context) => FirstPage()));
                //   },
                //   child: Icon(Icons.arrow_right,size: 40,),
                // ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                Text(
                  'Skip',
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
          ],
        ));
  }
}
