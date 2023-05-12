import 'package:flutter/material.dart';
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
import 'load_home.dart';

class NewHome extends StatefulWidget {
  const NewHome({super.key});

  @override
  State<NewHome> createState() => _NewHomeState();
}

class _NewHomeState extends State<NewHome> {
  var search = TextEditingController();
  bool _isLoading = true;
  Future<void> _refresh() async {
    setState(() {
      _isLoading = true;
    });

    await Future.delayed(const Duration(seconds: 3));

    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 5), () {
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
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            CircleAvatar(
              radius: 16,
              backgroundImage: AssetImage('asserts/logo3.png'),
              backgroundColor: Color.fromARGB(215, 7, 125, 180),
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              'Medical App',
              style: TextStyle(
                  fontSize: 23,
                  color: Color.fromARGB(207, 228, 228, 229),
                  wordSpacing: 3,
                  fontWeight: FontWeight.w700),
            ),
          ],
        ),
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
        onPressed: () async {
          await ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              dismissDirection: DismissDirection.horizontal,
              behavior: SnackBarBehavior.floating,
              duration: const Duration(seconds: 5),
              backgroundColor: const Color.fromARGB(217, 51, 25, 129),
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              margin: const EdgeInsets.only(
                bottom: 25,
                right: 15,
                left: 15,
              ),
              content: Container(
                height: 25,
                child: Row(
                  children: const [
                    CircleAvatar(
                      minRadius: 15,
                      backgroundColor: Colors.white,
                      child: Text(
                        '!',
                        style: TextStyle(
                          fontSize: 22,
                          color: Color.fromARGB(255, 16, 0, 63),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      textAlign: TextAlign.left,
                      'Soon',
                      style: TextStyle(fontSize: 19),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        backgroundColor: const Color.fromARGB(255, 5, 53, 78).withOpacity(0.7),
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
              onTap: () {},
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
      body: RefreshIndicator(
        onRefresh: () => _refresh(),
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: _isLoading
                  ? Stack(
                      alignment: Alignment.center,
                      children: const [
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
                padding: const EdgeInsets.all(1.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      NameForEachSection(
                          nameSection: 'Fracture Detection', textsize: 28),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
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
                              child: HomeStyleContiner(
                                  height: 320,
                                  width: 270,
                                  nameDisease: "Bone Fracture Detection",
                                  nameImage: '2103214')),
                        ],
                      ),
                      const Divider(
                        height: 25,
                        thickness: 3,
                        color: Colors.black,
                      ),
                      NameForEachSection(
                          nameSection: 'Brain Diseases', textsize: 28),
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
                                    GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    const BrainTumorDetection(),
                                              ));
                                        },
                                        child: HomeStyleContiner(
                                            nameDisease:
                                                "Brain Tumor Detection",
                                            nameImage: 'brain')),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    GestureDetector(
                                        onTap: () async {
                                          await ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              dismissDirection:
                                                  DismissDirection.horizontal,
                                              behavior:
                                                  SnackBarBehavior.floating,
                                              duration:
                                                  const Duration(seconds: 5),
                                              backgroundColor:
                                                  const Color.fromARGB(
                                                      217, 51, 25, 129),
                                              elevation: 0,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          30)),
                                              margin: const EdgeInsets.only(
                                                bottom: 200,
                                                right: 15,
                                                left: 15,
                                              ),
                                              content: Container(
                                                height: 25,
                                                child: Row(
                                                  children: const [
                                                    CircleAvatar(
                                                      minRadius: 15,
                                                      backgroundColor:
                                                          Colors.white,
                                                      child: Text(
                                                        '!',
                                                        style: TextStyle(
                                                          fontSize: 22,
                                                          color: Color.fromARGB(
                                                              255, 16, 0, 63),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Text(
                                                      textAlign: TextAlign.left,
                                                      'Soon',
                                                      style: TextStyle(
                                                          fontSize: 19),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                        child: HomeStyleContiner(
                                            nameDisease: "Alzheimer Detection",
                                            nameImage: 'images')),
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
                      NameForEachSection(
                          nameSection: 'Heart and Respiratory Diseases'),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5.0),
                              child: SizedBox(
                                height: 320,
                                width: MediaQuery.of(context).size.width,
                                child: ListView(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
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
                                        child: HomeStyleContiner(
                                            nameDisease:
                                                "Heart Disease Detection",
                                            nameImage: 'Heart')),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    GestureDetector(
                                        onTap: () async {
                                          await ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              dismissDirection:
                                                  DismissDirection.horizontal,
                                              behavior:
                                                  SnackBarBehavior.floating,
                                              duration:
                                                  const Duration(seconds: 5),
                                              backgroundColor:
                                                  const Color.fromARGB(
                                                      217, 51, 25, 129),
                                              elevation: 0,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          30)),
                                              margin: const EdgeInsets.only(
                                                bottom: 200,
                                                right: 15,
                                                left: 15,
                                              ),
                                              content: Container(
                                                height: 25,
                                                child: Row(
                                                  children: const [
                                                    CircleAvatar(
                                                      minRadius: 15,
                                                      backgroundColor:
                                                          Colors.white,
                                                      child: Text(
                                                        '!',
                                                        style: TextStyle(
                                                          fontSize: 22,
                                                          color: Color.fromARGB(
                                                              255, 16, 0, 63),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Text(
                                                      textAlign: TextAlign.left,
                                                      'Soon',
                                                      style: TextStyle(
                                                          fontSize: 19),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                        child: HomeStyleContiner(
                                            nameDisease: "Pneumonia Detection",
                                            nameImage: 'Pneumonia')),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
