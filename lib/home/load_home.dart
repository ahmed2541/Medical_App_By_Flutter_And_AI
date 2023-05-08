import 'package:flutter/material.dart';

import '../chat/chatBot.dart';
import '../models/model_home.dart';
import '../screens/AboutUs.dart';
import '../screens/Settings.dart';
import 'home_screen.dart';

class loadingHome extends StatefulWidget {
  const loadingHome({super.key});

  @override
  State<loadingHome> createState() => _loadingHomeState();
}

class _loadingHomeState extends State<loadingHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // floatingActionButton: FloatingActionButton(
        //   heroTag: 'lol',
        //   onPressed: () {},
        //   backgroundColor:
        //        Colors.black.withOpacity(0.04),
        //   splashColor: null,
        //   foregroundColor: Colors.black.withOpacity(0.04),
        //   child: const Icon(Icons.chat),
        // ),
        body: Padding(
          padding: const EdgeInsets.all(3.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Row(
                    children: const [
                      SkeltonAdd(
                        height:22,
                        width: 250,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        const Skelton(
                          height: 270,
                          width: 270,
                        ),
                        Stack(
                          alignment: Alignment.center,
                          children: const [
                            SkeltonText(
                              height: 50,
                              width: 270,
                            ),
                            SkeltonTextD(
                              height: 25,
                              width: 230,
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Skelton(
                  height: 4,
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Row(
                    children: const [
                      SkeltonAdd(
                        height:22,
                        width: 200,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: SizedBox(
                          height: 320,
                          child: ListView(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            children: [
                              Column(
                                children: [
                                  const Skelton(
                                    height: 270,
                                    width: 250,
                                  ),
                                  Stack(
                                    alignment: Alignment.center,
                                    children: const [
                                      SkeltonText(
                                        height: 50,
                                        width: 250,
                                      ),
                                      SkeltonTextD(
                                        height: 25,
                                        width: 230,
                                      )
                                    ],
                                  )
                                ],
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Column(
                                children: [
                                  const Skelton(
                                    height: 270,
                                    width: 250,
                                  ),
                                  Stack(
                                    alignment: Alignment.center,
                                    children: const [
                                      SkeltonText(
                                        height: 50,
                                        width: 250,
                                      ),
                                      SkeltonTextD(
                                        height: 25,
                                        width: 230,
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Skelton(
                  height: 4,
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Row(
                    children: const [
                      SkeltonAdd(
                        height:22,
                        width: 350,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: SizedBox(
                          height: 320,
                          child: ListView(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            children: [
                              Column(
                                children: [
                                  const Skelton(
                                    height: 270,
                                    width: 250,
                                  ),
                                  Stack(
                                    alignment: Alignment.center,
                                    children: const [
                                      SkeltonText(
                                        height: 50,
                                        width: 250,
                                      ),
                                      SkeltonTextD(
                                        height: 25,
                                        width: 230,
                                      )
                                    ],
                                  )
                                ],
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Column(
                                children: [
                                  const Skelton(
                                    height: 270,
                                    width: 250,
                                  ),
                                  Stack(
                                    alignment: Alignment.center,
                                    children: const [
                                      SkeltonText(
                                        height: 50,
                                        width: 250,
                                      ),
                                      SkeltonTextD(
                                        height: 25,
                                        width: 230,
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ));
  }
}

class Skelton extends StatelessWidget {
  const Skelton({Key? key, this.height, this.width}) : super(key: key);
  final double? height, width;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          color: Colors.black.withOpacity(0.04)),
    );
  }
}

class SkeltonText extends StatelessWidget {
  const SkeltonText({Key? key, this.height, this.width}) : super(key: key);
  final double? height, width;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)),
          color: Colors.black.withOpacity(0.05)),
    );
  }
}

class SkeltonTextD extends StatelessWidget {
  const SkeltonTextD({Key? key, this.height, this.width}) : super(key: key);
  final double? height, width;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.black.withOpacity(0.04)),
    );
  }
}

class SkeltonAdd extends StatelessWidget {
  const SkeltonAdd({Key? key, this.height, this.width}) : super(key: key);
  final double? height, width;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.black.withOpacity(0.05)),
    );
  }
}
