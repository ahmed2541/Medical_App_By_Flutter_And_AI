import 'package:flutter/material.dart';
import '../home/home_screen.dart';
import 'Third_Page.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  bool _showNext = false;
  bool _showSkip = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 4)).then((value) {
      setState(() {
        _showSkip = true;
      });
    });
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        _showNext = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 40, 112, 235),
        body: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(45),
                      bottomRight: Radius.circular(45))),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0, top: 13),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        _showSkip?
                          TextButton(
                              onPressed: () {
                                // ScaffoldMessenger.of(context).showSnackBar(
                                //   SnackBar(
                                //     dismissDirection: DismissDirection.horizontal,
                                //     behavior: SnackBarBehavior.floating,
                                //     duration: const Duration(seconds: 6),
                                //     backgroundColor:
                                //         Color.fromARGB(221, 25, 126, 129),
                                //     elevation: 0,
                                //     shape: RoundedRectangleBorder(
                                //         borderRadius: BorderRadius.circular(10)),
                                //     margin: const EdgeInsets.only(
                                //       bottom: 300,
                                //       right: 15,
                                //       left: 15,
                                //     ),
                                //     content: Container(
                                //       height: MediaQuery.of(context).size.height *
                                //           0.11,
                                //       child: Column(
                                //         children: const [
                                //           Text(
                                //             textAlign: TextAlign.left,
                                //             'There is no skip here,just read the f**king instructions',
                                //             style: TextStyle(
                                //                 color: Colors.white,
                                //                 fontSize: 22,
                                //                 fontStyle: FontStyle.italic,
                                //                 wordSpacing: 1,
                                //                 letterSpacing: 1.6),
                                //           ),
                                //         ],
                                //       ),
                                //     ),
                                //   ),
                                // );

                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const NewHome()));
                              },
                              child: const Text(
                                'Skip',
                                style: TextStyle(fontSize: 22),
                              )):SafeArea(child: Container(height: 24,))
                      ],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          CircleAvatar(
                            radius: 25,
                            backgroundImage: AssetImage('assets/images/logo3.png'),
                            backgroundColor: Color.fromARGB(215, 7, 125, 180),
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
                        backgroundImage: AssetImage("assets/images/medical2.jpg"),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        alignment: Alignment.center,
                        child: const Text(
                          "but you must also consult a doctor, and we will also give you some instructions about this disease",
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
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (_showNext)
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ThirdPage()));
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios_sharp,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
              ],
            ),
          ],
        ));
  }
}
