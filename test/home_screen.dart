// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../lib/test/Broken_Leg_Page.dart';
import '../lib/models/model_home.dart';

List<String> names_Disease = [
  'Bine Fracture Detection',
  'Leg Detection',
  'Brain Tomour Detection',
  'Alzeimer Detection',
  'Hert Disease Detection',
  'Hip Fracture Detection',
];

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<DetectionModel> detection = [
    DetectionModel(
      name: names_Disease[0],
      image: 'arm+pain.jpeg',
      page: HomeScreen(),
    ),
    DetectionModel(
        name: names_Disease[1], image: 'leg1.jpg', page: BrokenLeg()),
    DetectionModel(
        name: names_Disease[2], image: 'images.jpg', page: HomeScreen()),
    DetectionModel(
        name: names_Disease[3], image: 'images.jpg', page: HomeScreen()),
    DetectionModel(
        name: names_Disease[4], image: 'images.jpg', page: HomeScreen()),
    DetectionModel(
        name: names_Disease[5], image: 'images.jpg', page: HomeScreen()),
  ];

  var search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 148, 222),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 3, 75, 111),
        title: Center(
          child: Form(
            child: TextFormField(
              onFieldSubmitted: (value) {
                print(search.text);
              },
              controller: search,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  border: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(50)),
                  prefixIcon: IconButton(
                      enableFeedback: true,
                      onPressed: () {
                        print(search.text);
                      },
                      icon: const Icon(Icons.search,
                          color: Color.fromARGB(255, 69, 157, 230))),
                  hintText: 'Search...',
                  hintStyle: const TextStyle(
                      color: Color.fromARGB(96, 255, 255, 255))),
            ),
          ),
        ),
        actions: [
          FloatingActionButton(
              backgroundColor: const Color.fromARGB(255, 3, 75, 111),
              elevation: 0,
              mini: true,
              onPressed: () {
                print("notification");
              },
              child: const Icon(Icons.notification_important)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: 'chat',
        onPressed: () {
          print("Chatting");
        },
        backgroundColor: const Color.fromARGB(255, 5, 53, 78),
        splashColor: Colors.amber,
        foregroundColor: Colors.white,
        child: const Icon(Icons.chat),
      ),
      drawer: Drawer(),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: const Text(
                  "Detection Section (X-RAY)",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 310,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) =>
                        DetectionBuild(detection[index]),
                    separatorBuilder: (context, index) => const SizedBox(
                          width: 15,
                        ),
                    itemCount: detection.length),
              ),
              Divider(
                height: 20,
                color: Colors.grey[900],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget DetectionBuild(DetectionModel detection) => Container(
      child: Column(children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    print('${detection.name}');
                    // if (names_Diseases)
                  },
                  child: Container(
                    width: 248,
                    height: 260,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 0, 42, 134),
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                      image: DecorationImage(
                        alignment: AlignmentDirectional.topCenter,
                        image: AssetImage("asserts/${detection.image}"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Container(
                      width: 248,
                      height: 50,
                      alignment: Alignment.bottomLeft,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 0, 42, 134),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20)),
                      ),
                      child: TextButton(
                        onPressed: () {
                          print("object");
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //       builder: (context) => BrokenLeg(),
                          //     ));
                          // print('${detection.name}');
                          // if (detection.name == 'Bine Fracture Detection') {
                          //   Navigator.push(
                          //       context ,
                          //       MaterialPageRoute(
                          //         builder: (context) => HomeScreen(),
                          //       ));
                          // }else if (detection.name == 'Leg Detection') {
                          //   Navigator.push(
                          //       context ,
                          //       MaterialPageRoute(
                          //         builder: (context) => BrokenLeg(),
                          //       ));
                          // } else if (detection.name ==
                          //     'Brain Tomour Detection') {
                          //   Navigator.push(
                          //       context ,
                          //       MaterialPageRoute(
                          //         builder: (context) => HomeScreen(),
                          //       ));
                          // } else if (detection.name == 'Alzeimer Detection') {
                          //   Navigator.push(
                          //       context ,
                          //       MaterialPageRoute(
                          //         builder: (context) => HomeScreen(),
                          //       ));
                          // } else if (detection.name ==
                          //     'Hert Disease Detection') {
                          //   Navigator.push(
                          //       context ,
                          //       MaterialPageRoute(
                          //         builder: (context) => HomeScreen(),
                          //       ));
                          // } else if (detection.name ==
                          //     'Hip Fracture Detection') {
                          //   Navigator.push(
                          //       context ,
                          //       MaterialPageRoute(
                          //         builder: (context) => HomeScreen(),
                          //       ));
                          // }
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Text(
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.end,
                            "${detection.name}",
                            style: const TextStyle(
                                fontSize: 20,
                                color: Color.fromARGB(255, 255, 255, 255)),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ],
        )
      ]),
    );
