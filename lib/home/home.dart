import 'package:flutter/material.dart';

import '../chat/chatBot.dart';
import '../diseases_screens/Alzheimer_Detection.dart';
import '../diseases_screens/Bone_Fracture_Detection.dart';
import '../diseases_screens/Brain_Tomour_Detection.dart';
import '../diseases_screens/Broken_Leg_Page.dart';
import '../diseases_screens/Hert_Disease_Detection.dart';
import '../diseases_screens/Pneumonia_Detection.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 25, 73, 97),
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
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: 'chat',
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Chat(),
              ));
        },
        backgroundColor: const Color.fromARGB(255, 5, 53, 78).withOpacity(0.6),
        splashColor: const Color.fromARGB(255, 5, 27, 40),
        foregroundColor: Colors.white,
        child: const Icon(Icons.chat),
      ),
      drawer: Drawer(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        child: Column(
          children: [
            const UserAccountsDrawerHeader(
                accountName: Text("Ahmed Hamdy"),
                accountEmail: Text("ahmed@gmail.com")),
            ListTile(
              title: const Text("Home Page"),
              leading: const Icon(Icons.home),
              textColor: Colors.black,
              iconColor: Colors.black,
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Home(),
                    ));
              },
            ),
            const Divider(
              thickness: 1,
              height: 4,
            ),
            ListTile(
              title: const Text("About US"),
              leading: const Icon(Icons.manage_accounts_outlined),
              textColor: Colors.black,
              iconColor: Colors.black,
              onTap: () {},
            ),
            const Divider(
              thickness: 1,
              height: 4,
            ),
            ListTile(
              title: const Text("Setting"),
              leading: const Icon(Icons.settings),
              textColor: Colors.black,
              iconColor: Colors.black,
              onTap: () {},
            ),
            const Divider(
              thickness: 1,
              height: 4,
            ),
            ListTile(
              title: const Text("LogOut"),
              leading: const Icon(Icons.logout),
              textColor: Colors.black,
              iconColor: Colors.black,
              onTap: () {},
            ),
            const Divider(
              thickness: 1,
              height: 4,
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          SingleChildScrollView(
            child: Wrap(
              direction: Axis.horizontal,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Container(
                        width: 176,
                        height: 270,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 21, 139, 172),
                            borderRadius: BorderRadius.circular(30)),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => BrokenLeg(),
                                      ));
                                },
                                child: Container(
                                  width: 176,
                                  height: 220,
                                  decoration: const BoxDecoration(
                                    color: Color.fromARGB(255, 21, 139, 172),
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20)),
                                    image: DecorationImage(
                                      image: AssetImage("asserts/leg3.jpg"),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => BrokenLeg(),
                                      ));
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Column(
                                      children: const [
                                        Text(
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.start,
                                          "Leg Detection",
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Color.fromARGB(
                                                  255, 255, 255, 255)),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ]),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: 176,
                        height: 270,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 21, 139, 172),
                            borderRadius: BorderRadius.circular(30)),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const BrainTomourDetection(),
                                      ));
                                },
                                child: Container(
                                  width: 176,
                                  height: 220,
                                  decoration: const BoxDecoration(
                                    color: Color.fromARGB(255, 21, 139, 172),
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20)),
                                    image: DecorationImage(
                                      image: AssetImage("asserts/brain.jpg"),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const BrainTomourDetection(),
                                      ));
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Column(
                                      children: const [
                                        Text(
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.start,
                                          "Brain Tomour Detection",
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Color.fromARGB(
                                                  255, 255, 255, 255)),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ]),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: 176,
                        height: 270,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 21, 139, 172),
                            borderRadius: BorderRadius.circular(30)),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const HertDiseaseDetection(),
                                      ));
                                },
                                child: Container(
                                  width: 176,
                                  height: 220,
                                  decoration: const BoxDecoration(
                                    color: Color.fromARGB(255, 21, 139, 172),
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20)),
                                    image: DecorationImage(
                                      image: AssetImage("asserts/hert.jpg"),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const HertDiseaseDetection(),
                                      ));
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Column(
                                      children: const [
                                        Text(
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.start,
                                          "Hert Disease Detection",
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Color.fromARGB(
                                                  255, 255, 255, 255)),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ]),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Container(
                        width: 176,
                        height: 270,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 21, 139, 172),
                            borderRadius: BorderRadius.circular(30)),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const BoneFractureDetection(),
                                      ));
                                },
                                child: Container(
                                  width: 176,
                                  height: 220,
                                  decoration: const BoxDecoration(
                                    color: Color.fromARGB(255, 21, 139, 172),
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20)),
                                    image: DecorationImage(
                                      image: AssetImage("asserts/arm+pain.jpeg"),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const BoneFractureDetection(),
                                      ));
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Column(
                                      children: const [
                                        Text(
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.start,
                                          "Bone Fracture Detection",
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Color.fromARGB(
                                                  255, 255, 255, 255)),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ]),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: 176,
                        height: 270,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 21, 139, 172),
                            borderRadius: BorderRadius.circular(30)),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const AlzheimerDetection(),
                                      ));
                                },
                                child: Container(
                                  width: 176,
                                  height: 220,
                                  decoration: const BoxDecoration(
                                    color: Color.fromARGB(255, 21, 139, 172),
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20)),
                                    image: DecorationImage(
                                      image: AssetImage("asserts/images.jpg"),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const AlzheimerDetection(),
                                      ));
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Column(
                                      children: const [
                                        Text(
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.start,
                                          "Alzheimer Detection",
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Color.fromARGB(
                                                  255, 255, 255, 255)),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ]),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: 176,
                        height: 270,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 21, 139, 172),
                            borderRadius: BorderRadius.circular(30)),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const PneumoniaDetection(),
                                      ));
                                },
                                child: Container(
                                  width: 176,
                                  height: 220,
                                  decoration: const BoxDecoration(
                                    color: Color.fromARGB(255, 21, 139, 172),
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20)),
                                    image: DecorationImage(
                                      image: AssetImage("asserts/Pneumonia.jpg"),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const PneumoniaDetection(),
                                      ));
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Column(
                                      children: const [
                                        Text(
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.start,
                                          "Pneumonia Detection",
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Color.fromARGB(
                                                  255, 255, 255, 255)),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ]),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
