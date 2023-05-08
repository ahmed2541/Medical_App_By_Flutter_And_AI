import 'package:flutter/material.dart';
import 'package:medicalappsproject/home/load_home.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../chat/chatBot.dart';
import '../diseases_screens/Alzheimer_Detection.dart';
import '../diseases_screens/Bone_Fracture_Detection.dart';
import '../diseases_screens/Brain_Tumor_Detection.dart';
import '../diseases_screens/Heart_Disease_Detection.dart';
import '../diseases_screens/Pneumonia_Detection.dart';
import '../models/model_home.dart';
import '../screens/AboutUs.dart';
import '../screens/Settings.dart';
import '../shared/components/components.dart';
import '../shared/components/costants.dart';

class NewHome extends StatefulWidget {
  const NewHome({super.key});

  @override
  State<NewHome> createState() => _NewHomeState();
}

class _NewHomeState extends State<NewHome> {
  var search = TextEditingController();
  bool _isLoading = true;
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 5), () {
      setState(() {
        _isLoading = false;
      });
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 3, 75, 111),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: IconButton(
              onPressed: () {},
              icon: IconButton(
                  enableFeedback: true,
                  onPressed: () {
                    showSearch(context: context, delegate: DataSearch());
                  },
                  icon: const Icon(
                    Icons.search,
                    color: Color.fromARGB(255, 69, 157, 230),
                    size: 28,
                  )),
            ),
          )
        ],
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
        backgroundColor: const Color.fromARGB(255, 5, 53, 78).withOpacity(0.4),
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
                      builder: (context) => const NewHome(),
                    ));
              },
            ),
            const Divider(
              thickness: 1,
              height: 4,
            ),
            ListTile(
              title: const Text("Profile"),
              leading: const Icon(Icons.account_box_outlined),
              textColor: Colors.black,
              iconColor: Colors.black,
              onTap: () {
          
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
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AboutUs(),
                    ));
              },
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
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SettingPage(),
                    ));
              },
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
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: _isLoading
                ? Stack(
                    alignment: Alignment.center,
                    children: [
                      loadingHome(),
                      SpinKitCircle(
                        color: Colors.blue,
                        size: 50.0,
                      ),
                    ],
                  )
                : Container(),
          ),
          Visibility(
            visible: !_isLoading,
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Fracture Detection',
                          style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 320,
                          width: 270,
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color:
                                        const Color.fromARGB(255, 21, 139, 172),
                                    borderRadius: BorderRadius.circular(30)),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                          height: 270,
                                          decoration: const BoxDecoration(
                                            color: Color.fromARGB(
                                                255, 21, 139, 172),
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(20),
                                                topRight: Radius.circular(20)),
                                            image: DecorationImage(
                                              image: AssetImage(
                                                  "asserts/2103214.jpg"),
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
                                        child: Column(
                                          children: const [
                                            Center(
                                              child: Text(
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                "Bone Fracture Detection",
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    color: Color.fromARGB(
                                                        255, 255, 255, 255)),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ]),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const Divider(
                      height: 25,
                      thickness: 3,
                      color: Colors.black,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Brain Diseases',
                          style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 5.0),
                            child: Container(
                              height: 320,
                              child: ListView(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                children: [
                                  Container(
                                    height: 320,
                                    width: 250,
                                    decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            255, 21, 139, 172),
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    child: Column(children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            color: const Color.fromARGB(
                                                255, 21, 139, 172),
                                            borderRadius:
                                                BorderRadius.circular(30)),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          const BrainTumorDetection(),
                                                    ));
                                              },
                                              child: Container(
                                                width: 250,
                                                height: 270,
                                                decoration: const BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  20),
                                                          topRight:
                                                              Radius.circular(
                                                                  20)),
                                                  image: DecorationImage(
                                                    image: AssetImage(
                                                        "asserts/brain.jpg"),
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    const BrainTumorDetection(),
                                              ));
                                        },
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 8),
                                          child: Column(
                                            children: const [
                                              Text(
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.start,
                                                "Brain Tumor Detection",
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    color: Colors.white),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ]),
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Container(
                                    height: 320,
                                    width: 250,
                                    decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            255, 21, 139, 172),
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    child: Column(children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            color: const Color.fromARGB(
                                                255, 21, 139, 172),
                                            borderRadius:
                                                BorderRadius.circular(30)),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
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
                                                width: 250,
                                                height: 270,
                                                decoration: const BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  20),
                                                          topRight:
                                                              Radius.circular(
                                                                  20)),
                                                  image: DecorationImage(
                                                    image: AssetImage(
                                                        "asserts/images.jpg"),
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
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
                                          padding:
                                              const EdgeInsets.only(bottom: 8),
                                          child: Column(
                                            children: const [
                                              Text(
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.start,
                                                "Alzheimer Detection",
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    color: Colors.white),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ]),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Divider(
                      height: 25,
                      thickness: 3,
                      color: Colors.black,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Heart and Respiratory Diseases',
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 5.0),
                            child: Container(
                              height: 320,
                              width: 375,
                              child: ListView(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                children: [
                                  Container(
                                    height: 320,
                                    width: 250,
                                    decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            255, 21, 139, 172),
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    child: Column(children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            color: const Color.fromARGB(
                                                255, 21, 139, 172),
                                            borderRadius:
                                                BorderRadius.circular(30)),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          const HeartDiseaseDetection(),
                                                    ));
                                              },
                                              child: Container(
                                                width: 250,
                                                height: 270,
                                                decoration: const BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  20),
                                                          topRight:
                                                              Radius.circular(
                                                                  20)),
                                                  image: DecorationImage(
                                                    image: AssetImage(
                                                        "asserts/Heart.jpg"),
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    const HeartDiseaseDetection(),
                                              ));
                                        },
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 8),
                                          child: Column(
                                            children: const [
                                              Text(
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.start,
                                                "Heart Disease Detection",
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    color: Colors.white),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ]),
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Container(
                                    height: 320,
                                    width: 250,
                                    decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            255, 21, 139, 172),
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    child: Column(children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            color: const Color.fromARGB(
                                                255, 21, 139, 172),
                                            borderRadius:
                                                BorderRadius.circular(30)),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
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
                                                width: 250,
                                                height: 270,
                                                decoration: const BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  20),
                                                          topRight:
                                                              Radius.circular(
                                                                  20)),
                                                  image: DecorationImage(
                                                    image: AssetImage(
                                                        "asserts/Pneumonia.jpg"),
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
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
                                          padding:
                                              const EdgeInsets.only(bottom: 8),
                                          child: Column(
                                            children: const [
                                              Text(
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.start,
                                                "Pneumonia Detection",
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    color: Colors.white),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ]),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
