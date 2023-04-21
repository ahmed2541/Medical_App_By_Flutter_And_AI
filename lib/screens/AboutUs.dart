import 'package:flutter/material.dart';
class AboutUs extends StatefulWidget {
  const AboutUs({super.key});

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Align(
        alignment: Alignment.topRight,
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0, top: 30),
          child: FloatingActionButton(
              elevation: 0,
              mini: true,
              backgroundColor: const Color.fromARGB(55, 24, 38, 63).withOpacity(0.2),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              )),
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 17, 18, 24),
          // image: DecorationImage(
          //     image: AssetImage(
          //         'asserts/pexels-eberhard-grossgasteiger-2098427.jpg'),
          //     fit: BoxFit.fill)
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 8.0, top: 25),
                    child: Text(
                      'About Us',
                      style: TextStyle(
                          color: Color.fromARGB(255, 105, 128, 190),
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Padding(
                    padding:
                        EdgeInsetsDirectional.only(start: 5, end: 230),
                    child: Divider(
                      thickness: 1,
                      color: Colors.grey,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        const CircleAvatar(
                          backgroundColor: Color.fromARGB(155, 1, 28, 51),
                          radius: 30,
                          child: Text(
                            "Eng",
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text(
                              "Ahmed Hamdy",
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(189, 255, 255, 255)),
                            ),
                            Text(
                              "Flutter",
                              style: TextStyle(
                                  fontSize: 18, color: Colors.grey[500]),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        const CircleAvatar(
                          backgroundColor: Color.fromARGB(155, 1, 28, 51),
                          radius: 30,
                          child: Text(
                            "Eng",
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text(
                              "Esraa Rafat",
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(189, 255, 255, 255)),
                            ),
                            Text(
                              "Flutter",
                              style: TextStyle(
                                  fontSize: 18, color: Colors.grey[500]),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        const CircleAvatar(
                          backgroundColor: Color.fromARGB(155, 1, 28, 51),
                          radius: 30,
                          child: Text(
                            "Eng",
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text(
                              "Ahmed Farag",
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(189, 255, 255, 255)),
                            ),
                            Text(
                              "AI",
                              style: TextStyle(
                                  fontSize: 18, color: Colors.grey[500]),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'About App',
                    style: TextStyle(
                        color: Color.fromARGB(255, 105, 128, 190),
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsetsDirectional.only(start: 5, end: 200),
                child: Divider(
                  thickness: 1,
                  color: Colors.grey,
                ),
              ),
              Container(
                width: 320,
                height: 480,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(top: 8.0),
                      child: Text(
                        'Medical Application\nWith Flutter and AI ',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(166, 255, 255, 255)),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Our application will help many people, whether patients or doctors.',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(113, 255, 255, 255)),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Medicine field one of the most important science in our life and what about if we mix it with engineering ?, this is our plan that we designed the app, medical application deployed in flutter to give the application artificial mentality to diagnose multiple diseases with out human interaction and with high accuracy over humans using deep leaning and computer vision techniques.',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(113, 255, 255, 255)),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'But again, you must not rely entirely on the diagnosis of the disease from the application because it is still in the development stage, so you must also consult a doctor.',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(113, 255, 255, 255)),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
