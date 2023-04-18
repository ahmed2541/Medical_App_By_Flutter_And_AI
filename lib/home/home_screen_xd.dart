import 'package:flutter/material.dart';

class HomeScreenXd extends StatelessWidget {
    var searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255,78, 153, 246),
        leading: const Icon(
          Icons.menu,
          size: 35,
          color: Colors.white,
        ),
        title:
            Row(mainAxisAlignment: MainAxisAlignment.center, children:  [
          Container(
            height: 45,
            width: 55,
            child:Image(image: AssetImage("asserts/logo.png")),
          ),
          SizedBox(
            width: 8,
          ),
          Text("MD",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 255, 255, 255),
              ))
        ]),
        actions: const [
          Icon(
            Icons.settings,
            size: 32,
            color: Colors.white,
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("Chatting");
        },
        child: const Icon(Icons.chat),
        backgroundColor: const Color.fromARGB(255, 16, 31, 44),
        splashColor: Colors.amber,
        foregroundColor: Colors.white,
      ),
      body: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                width: 300,
                child: TextFormField(
                  controller: searchController,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      hintText: 'Search',
                      suffixIcon: Icon(Icons.search),
                    )),
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(
                height: 5,
                color: Color.fromARGB(255, 141, 141, 141),
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(10),
                child: Wrap(
                  direction: Axis.horizontal,
                  children: [
                    Container(
                      margin: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                print("leg");
                              },
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(60)
                                )
                              ),
                              child: Image(image: AssetImage("asserts/Leglogo.png"),)),
                          TextButton(
                              onPressed: () {
                                print("leg");
                              },
                              child: const Text(
                                "Broken leg",
                                style: TextStyle(fontSize: 25),
                              )),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                print("Hand");
                              },
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(60)
                                )
                              ),
                              child: Image(image: AssetImage("asserts/BrokenHand.png"),)),

                          TextButton(
                              onPressed: () {
                                print("leg");
                              },
                              child: const Text(
                                "Broken Hand",
                                style: TextStyle(fontSize: 25),
                              )),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                print("leg");
                              },
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(60)
                                )
                              ),
                              child: Icon(
                                Icons.medical_information,
                                size: 120,
                                color:Colors.white
                              )),

                          TextButton(
                              onPressed: () {
                                print("leg");
                              },
                              child: const Text(
                                "Broken leg",
                                style: TextStyle(fontSize: 25),
                              )),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                print("leg");
                              },
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(60)
                                )
                              ),
                              child: Icon(
                                Icons.medical_information,
                                size: 120,
                                color:Colors.white
                              )),

                          TextButton(
                              onPressed: () {
                                print("leg");
                              },
                              child: const Text(
                                "Broken leg",
                                style: TextStyle(fontSize: 25),
                              )),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                print("leg");
                              },
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(60)
                                )
                              ),
                              child: Icon(
                                Icons.medical_information,
                                size: 120,
                                color:Colors.white
                              )),

                          TextButton(
                              onPressed: () {
                                print("leg");
                              },
                              child: const Text(
                                "Broken leg",
                                style: TextStyle(fontSize: 25),
                              )),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                print("leg");
                              },
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(60)
                                )
                              ),
                              child: Icon(
                                Icons.medical_information,
                                size: 120,
                                color:Colors.white
                              )),

                          TextButton(
                              onPressed: () {
                                print("leg");
                              },
                              child: const Text(
                                "Broken leg",
                                style: TextStyle(fontSize: 25),
                              )),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                print("leg");
                              },
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(60)
                                )
                              ),
                              child: Icon(
                                Icons.medical_information,
                                size: 120,
                                color:Colors.white
                              )),

                          TextButton(
                              onPressed: () {
                                print("leg");
                              },
                              child: const Text(
                                "Broken leg",
                                style: TextStyle(fontSize: 25),
                              )),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                print("leg");
                              },
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(60)
                                )
                              ),
                              child: Icon(
                                Icons.medical_information,
                                size: 120,
                                color:Colors.white
                              )),

                          TextButton(
                              onPressed: () {
                                print("leg");
                              },
                              child: const Text(
                                "Broken leg",
                                style: TextStyle(fontSize: 25),
                              )),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                print("leg");
                              },
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(60)
                                )
                              ),
                              child: Icon(
                                Icons.medical_information,
                                size: 120,
                                color:Colors.white
                              )),

                          TextButton(
                              onPressed: () {
                                print("leg");
                              },
                              child: const Text(
                                "Broken leg",
                                style: TextStyle(fontSize: 25),
                              )),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                print("leg");
                              },
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(60)
                                )
                              ),
                              child: Icon(
                                Icons.medical_information,
                                size: 120,
                                color:Colors.white
                              )),

                          TextButton(
                              onPressed: () {
                                print("leg");
                              },
                              child: const Text(
                                "Broken leg",
                                style: TextStyle(fontSize: 25),
                              )),
                        ],
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

