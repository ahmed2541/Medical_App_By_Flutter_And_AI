import 'dart:io';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';

import '../results/results.dart';
import '../shared/components/components.dart';

class PneumoniaDetection extends StatefulWidget {
  const PneumoniaDetection({super.key});

  @override
  State<PneumoniaDetection> createState() => _PneumoniaDetectionState();
}

class _PneumoniaDetectionState extends State<PneumoniaDetection> {
  bool showMore = false;
  final Uri _uri = Uri.parse(
      'https://www.mayoclinic.org/diseases-conditions/broken-leg/symptoms-causes/syc-20370412');
  String result = '';
  File? image;
  late var imagePicker = ImagePicker();
  upoaldImage(ImageSource source) async {
    var pickedImage = await imagePicker.pickImage(source: source);
    if (pickedImage != null) {
      setState(() {
        image = File(pickedImage.path);
        doImageClassification();
      });
    } else {}
  }

  loadModel() async {
    String? output = await Tflite.loadModel(
        model: 'asserts/modules/model.tflite',
        labels: 'asserts/modules/labels.txt',
        numThreads: 1,
        isAsset: true,
        useGpuDelegate: false);
    print(output);
  }

  @override
  void initState() {
    super.initState();
    imagePicker = ImagePicker();
    loadModel();
  }

  doImageClassification() async {
    var recogn = await Tflite.runModelOnImage(
        path: image!.path,
        imageMean: 0.0,
        imageStd: 255.0,
        threshold: 0.1,
        asynch: true,
        numResults: 2);

    print(recogn!.length.toString());

    setState(() {
      result = '';
    });

    recogn.forEach(
      (element) {
        setState(() {
          print(element.toString());
          result += element['label'] + '\n\n';
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  actions: [
                    Center(
                      child: TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            'Ok',
                            style: TextStyle(fontSize: 18),
                          )),
                    )
                  ],
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TitleTextMessg(),
                      IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: const Icon(
                            Icons.close,
                            color: Colors.black,
                          ))
                    ],
                  ),
                  titlePadding: const EdgeInsets.only(
                    top: 5,
                  ),
                  content: ContentTextMessg(),
                  contentPadding: const EdgeInsets.only(top: 10, left: 10),
                );
              });

          await upoaldImage(ImageSource.camera);
          image == null
              ? Text('')
              : await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetectionResult(
                      image: image!,
                      result: result,
                    ),
                  ));
        },
        backgroundColor: const Color.fromARGB(255, 16, 31, 44).withOpacity(0.1),
        splashColor: const Color.fromARGB(255, 16, 31, 44),
        foregroundColor: Colors.white,
        child: const Icon(
          Icons.add_a_photo_outlined,
          size: 30,
        ),
      ),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 3, 75, 111),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            size: 30,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Center(
          child: Text(
            "Pneumonia Detection",
            style: TextStyle(
                color: Color.fromARGB(255, 153, 204, 214),
                fontSize: 26,
                fontWeight: FontWeight.w500,
                wordSpacing: 2),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(children: [
            Container(
              height: 290,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.black,
                  border: Border.all(
                    width: 0,
                  ),
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                      image: AssetImage("asserts/Pneumonia.jpg"),
                      fit: BoxFit.contain)),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(
                start: 5,
                end: 5,
              ),
              child: Divider(
                height: 15,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Column(
              children: [
                const Text(
                  "To diagnose your disease",
                  style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w400,
                      color: Color.fromARGB(255, 37, 67, 82)),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  height: 35,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadiusDirectional.circular(5)),
                  width: 200,
                  child: MaterialButton(
                      height: 34,
                      onPressed: () async {
                        await showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                actions: [
                                  Center(
                                    child: TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text(
                                          'Ok',
                                          style: TextStyle(fontSize: 18),
                                        )),
                                  )
                                ],
                                title: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: TitleTextMessg(),
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        icon: const Icon(
                                          Icons.close,
                                          color: Colors.black,
                                        ))
                                  ],
                                ),
                                titlePadding: const EdgeInsets.only(
                                  top: 5,
                                ),
                                content: ContentTextMessg(),
                                contentPadding:
                                    const EdgeInsets.only(top: 10, left: 10),
                              );
                            });

                        await upoaldImage(ImageSource.gallery);
                        // ignore: use_build_context_synchronously
                        image == null
                            ? Text(' select an image')
                            : await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetectionResult(
                                    image: image!,
                                    result: result,
                                  ),
                                ));
                      },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            textAlign: TextAlign.center,
                            "Upload Image",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                          Icon(
                            Icons.photo_library,
                            size: 27,
                            color: Colors.white,
                          ),
                        ],
                      )),
                ),
                // image == null
                //     ? Padding(
                //         padding: const EdgeInsets.only(top: 8.0),
                //         child: const Text("choose image"),
                //       )
                //     : Column(
                //         children: [
                //           Padding(
                //             padding: const EdgeInsets.all(8.0),
                //             child: Image.file(
                //               image!,
                //               height: 300,
                //               width: 400,
                //               fit: BoxFit.cover,
                //             ),
                //           ),
                //           SizedBox(
                //             height: 20,
                //           ),
                //           Container(
                //             child: Text(
                //               result,
                //               textAlign: TextAlign.center,
                //               style: TextStyle(
                //                   fontSize: 25,
                //                   color: Colors.black,
                //                   backgroundColor: Colors.blueAccent),
                //             ),
                //           )

                //         ],
                //       ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 10, end: 15),
              child: Divider(
                height: 15,
                color: Colors.grey[600],
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Overview",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                )
              ],
            ),
            Padding(
                padding: const EdgeInsets.all(10),
                child: Column(children: [
                  Container(
                    alignment: Alignment.topLeft,
                    child: const Text(
                      "",
                      style: TextStyle(fontSize: 19, height: 1.2),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: const Text(
                      "",
                      style: TextStyle(fontSize: 18, height: 1.2),
                    ),
                  ),
                ])),
            if (showMore)
              Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.only(start: 10, end: 15),
                    child: Divider(
                      height: 15,
                      color: Colors.grey[600],
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Symptoms",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    child: const Text(
                      "",
                      style: TextStyle(
                        fontSize: 17,
                        letterSpacing: 1.4,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    child: const Text(
                      "Signs and symptoms may include:",
                      style: TextStyle(
                          fontSize: 19,
                          height: 1.2,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(children: [
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "",
                            style: TextStyle(fontSize: 18, height: 1.4),
                          ),
                        ),
                      ])),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    child: const Text(
                      "",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.only(start: 10, end: 15),
                    child: Divider(
                      height: 15,
                      color: Colors.grey[600],
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Causes",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    child: const Text(
                      "",
                      style: TextStyle(
                          fontSize: 18,
                          height: 1.2,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(children: [
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "",
                            style: TextStyle(fontSize: 17, height: 1.2),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "",
                            style: TextStyle(fontSize: 17, height: 1.2),
                          ),
                        ),
                      ])),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.only(start: 10, end: 15),
                    child: Divider(
                      height: 15,
                      color: Colors.grey[600],
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Risk factors",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    child: const Text(
                      "",
                      style: TextStyle(
                          fontSize: 20,
                          height: 1.2,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      alignment: Alignment.topLeft,
                      child: const Text(
                        "",
                        style: TextStyle(
                          fontSize: 20,
                          height: 1.4,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    child: const Text(
                      "",
                      style: TextStyle(
                          fontSize: 20,
                          height: 1.2,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.only(start: 10, end: 15),
                    child: Divider(
                      height: 15,
                      color: Colors.grey[600],
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Complications",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.only(start: 10, end: 15),
                    child: Divider(
                      height: 15,
                      color: Colors.grey[600],
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Prevention",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ],
              ),
            TextButton(
              onPressed: () {
                setState(() {
                  showMore = !showMore;
                });
              },
              child: Text(showMore ? 'See Less' : 'See More'),
            ),
            Divider(
              thickness: 3,
              height: 25,
              color: Colors.grey[600],
            ),
            Center(
              child: TextButton(
                child: const Text(
                  'Refrence From...',
                  style: TextStyle(fontSize: 21),
                ),
                onPressed: () {
                  launchUrl(_uri);
                },
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
