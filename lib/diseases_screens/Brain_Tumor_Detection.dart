import 'dart:io';
import 'package:tflite/tflite.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../results/results.dart';
import '../shared/components/components.dart';

class BrainTumorDetection extends StatefulWidget {
  const BrainTumorDetection({super.key});

  @override
  State<BrainTumorDetection> createState() => _BrainTumorDetectionState();
}

class _BrainTumorDetectionState extends State<BrainTumorDetection> {
  bool showMore = false;
  final Uri _uri = Uri.parse(
      'https://www.mayoclinic.org/diseases-conditions/brain-tumor/symptoms-causes/syc-20350084');

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
        model: 'asserts/modules/model_brain_tumour.tflite',
        labels: 'asserts/modules/labels_brain_tumour.txt',
        numThreads: 1,
        isAsset: true,
        useGpuDelegate: false,
        
        );
        
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



    recogn.forEach(
      (element) {
        setState(() {
          print(element.toString());
          result += element['label'] + '\n';
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
            "Brain Tumor",
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
                      image: AssetImage("asserts/brain.jpg"),
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
                       
                        image == null
                            ? Text('')
                            // ignore: use_build_context_synchronously
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
                SizedBox(
                  height: 10,
                )
                // image == null
                //     ? Padding(
                //         padding: const EdgeInsets.only(top: 8.0),
                //         child: const Text("choose image"),
                //       )
                //     : Column(
                //         children: [
                //           Padding(
                //             padding: const EdgeInsets.all(8.0),
                //             child: Container(
                //               decoration: BoxDecoration(
                //                 color: Color.fromARGB(198, 0, 0, 0),
                //                   border: Border.all(),
                //                   borderRadius: BorderRadius.circular(20)),
                //               child: Image.file(
                //                 image!,
                //                 height: 300,
                //                 width: 400,
                //                 fit: BoxFit.contain,
                //               ),
                //             ),
                //           ),
                //           SizedBox(
                //             height: 8,
                //           ),
                //           Text(
                //             result,
                //             textAlign: TextAlign.center,
                //             style: TextStyle(
                //                 fontSize: 25,
                //                 color: Colors.black,
                //                 backgroundColor: Colors.blueAccent),
                //           )

                //         ],
                //       ),
              ],
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
                      "- A brain tumor is a growth of cells in the brain or near it. Brain tumors can happen in the brain tissue. Brain tumors also can happen near the brain tissue. Nearby locations include nerves, the pituitary gland, the pineal gland, and the membranes that cover the surface of the brain",
                      style: TextStyle(fontSize: 17, height: 1.2),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    child: const Text(
                      "- Brain tumors can begin in the brain. These are called primary brain tumors. Sometimes, cancer spreads to the brain from other parts of the body. These tumors are secondary brain tumors, also called metastatic brain tumors.",
                      style: TextStyle(fontSize: 17, height: 1.2),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            content: Stack(
                              alignment: Alignment.topRight,
                              children: [
                                const Image(
                                    image: AssetImage(
                                        'asserts/mcdc7_brain_cancer-8col.jpg'),
                                    fit: BoxFit.contain),
                                IconButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    icon: const Icon(Icons.fullscreen_exit,
                                        size: 30)),
                              ],
                            ),
                            actions: [
                              Container(
                                alignment: Alignment.centerLeft,
                                child: const Text(
                                  'Brain tumor',
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(top: 8),
                                child: Text(
                                  'A brain tumor can form in the brain cells (as shown), or it can begin elsewhere and spread to the brain. As the tumor grows, it creates pressure on and changes the function of surrounding brain tissue, which causes signs and symptoms such as headaches, nausea and balance problems.',
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Color.fromARGB(170, 0, 0, 0)),
                                ),
                              )
                            ],
                          );
                        },
                      );
                    },
                    child: SizedBox(
                      height: 400,
                      width: 370,
                      child: Stack(
                        alignment: Alignment.topRight,
                        children: [
                          const Image(
                              image: AssetImage(
                                  'asserts/mcdc7_brain_cancer-8col.jpg'),
                              fit: BoxFit.contain),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Brain tumor',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                              IconButton(
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          content: Stack(
                                            alignment: Alignment.topRight,
                                            children: [
                                              const Image(
                                                  image: AssetImage(
                                                      'asserts/mcdc7_brain_cancer-8col.jpg'),
                                                  fit: BoxFit.contain),
                                              IconButton(
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                  icon: const Icon(
                                                      Icons.fullscreen_exit,
                                                      size: 30)),
                                            ],
                                          ),
                                          actions: [
                                            Container(
                                              alignment: Alignment.centerLeft,
                                              child: const Text(
                                                'Brain tumor',
                                                style: TextStyle(
                                                    fontSize: 17,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                            ),
                                            const Padding(
                                              padding: EdgeInsets.only(top: 8),
                                              child: Text(
                                                'A brain tumor can form in the brain cells (as shown), or it can begin elsewhere and spread to the brain. As the tumor grows, it creates pressure on and changes the function of surrounding brain tissue, which causes signs and symptoms such as headaches, nausea and balance problems.',
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Color.fromARGB(
                                                        170, 0, 0, 0)),
                                              ),
                                            )
                                          ],
                                        );
                                      },
                                    );
                                  },
                                  icon: const Icon(
                                    Icons.fullscreen,
                                    size: 35,
                                  )),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    child: const Text(
                      "- Many different types of primary brain tumors exist. Some brain tumors aren't cancerous. These are called noncancerous brain tumors or benign brain tumors. Noncancerous brain tumors may grow over time and press on the brain tissue. Other brain tumors are brain cancers, also called malignant brain tumors. Brain cancers may grow quickly. The cancer cells can invade and destroy the brain tissue.",
                      style: TextStyle(fontSize: 17, height: 1.2),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    child: const Text(
                      "- Brain tumors range in size from very small to very large. Some brain tumors are found when they are very small because they cause symptoms that you notice right away. Other brain tumors grow very large before they're found. Some parts of the brain are less active than others. If a brain tumor starts in a part of the brain that's less active, it might not cause symptoms right away. The brain tumor size could become quite large before the tumor is detected.",
                      style: TextStyle(fontSize: 17, height: 1.2),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    child: const Text(
                      "- Brain tumor treatment options depend on the type of brain tumor you have, as well as its size and location. Common treatments include surgery and radiation therapy.",
                      style: TextStyle(fontSize: 17, height: 1.2),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
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
                        "Types",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Column(
                    children: const [
                      Text(
                        "There are many types of brain tumors. The type of brain tumor is based on the kind of cells that make up the tumor. Special lab tests on the tumor cells can give information about the cells. Your health care team uses this information to figure out the type of brain tumor.",
                        style: TextStyle(
                          fontSize: 16,
                          letterSpacing: 1.2,
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        "Some types of brain tumors usually aren't cancerous. These are called noncancerous brain tumors or benign brain tumors. Some types of brain tumors usually are cancerous. These types are called brain cancers or malignant brain tumors. Some brain tumor types can be benign or malignant.",
                        style: TextStyle(
                          fontSize: 17,
                          letterSpacing: 1.2,
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        "Benign brain tumors tend to be slow-growing brain tumors. Malignant brain tumors tend to be fast-growing brain tumors.",
                        style: TextStyle(
                          fontSize: 17,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    child: const Text(
                      "Types of brain tumors include:",
                      style: TextStyle(
                          fontSize: 18,
                          height: 1.2,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(children: [
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                alignment: Alignment.topLeft,
                                child: const Text(
                                  "1. Gliomas and related brain tumors. Gliomas are growths of cells that look like glial cells. The glial cells surround and support nerve cells in the brain tissue. Types of gliomas and related brain tumors include astrocytoma, glioblastoma, oligodendroglioma and ependymoma. Gliomas can be benign, but most are malignant. Glioblastoma is the most common type of malignant brain tumor.",
                                  style: TextStyle(fontSize: 15, height: 1.2),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {},
                                child: SizedBox(
                                  width: 150,
                                  height: 250,
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text(
                                            'Glioblastoma',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18),
                                          ),
                                          IconButton(
                                              onPressed: () {
                                                showDialog(
                                                  context: context,
                                                  builder: (context) {
                                                    return AlertDialog(
                                                      content: Stack(
                                                        alignment:
                                                            Alignment.topRight,
                                                        children: [
                                                          const Image(
                                                            image: AssetImage(
                                                                'asserts/glioblastoma-8col-3802786-002-0.jpg'),
                                                            fit: BoxFit.fill,
                                                            height: 250,
                                                          ),
                                                          IconButton(
                                                              onPressed: () {
                                                                Navigator.of(
                                                                        context)
                                                                    .pop();
                                                              },
                                                              icon: const Icon(
                                                                  Icons
                                                                      .fullscreen_exit,
                                                                  size: 30)),
                                                        ],
                                                      ),
                                                      actions: [
                                                        Container(
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          child: const Text(
                                                            'Glioblastoma',
                                                            style: TextStyle(
                                                                fontSize: 17,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700),
                                                          ),
                                                        ),
                                                        const Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 8),
                                                          child: Text(
                                                            'Glioblastoma is a type of cancer that starts in cells called astrocytes that support nerve cells. It can form in the brain or spinal cord.',
                                                            style: TextStyle(
                                                                fontSize: 15,
                                                                color: Color
                                                                    .fromARGB(
                                                                        170,
                                                                        0,
                                                                        0,
                                                                        0)),
                                                          ),
                                                        )
                                                      ],
                                                    );
                                                  },
                                                );
                                              },
                                              icon: const Icon(
                                                Icons.fullscreen,
                                                size: 35,
                                              )),
                                        ],
                                      ),
                                      const Image(
                                        image: AssetImage(
                                            'asserts/glioblastoma-8col-3802786-002-0.jpg'),
                                        fit: BoxFit.fill,
                                        height: 190,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                alignment: Alignment.topLeft,
                                child: const Text(
                                  "2. Choroid plexus tumors. Choroid plexus tumors start in cells that make the fluid that surrounds the brain and spinal cord. This fluid is called cerebrospinal fluid. Choroid plexus tumors are located in the fluid-filled cavities in the brain, called the ventricles. Choroid plexus tumors can be benign or malignant. Choroid plexus carcinoma is the malignant form of this type of brain tumor. It's more common in children.",
                                  style: TextStyle(fontSize: 15, height: 1.2),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {},
                                child: SizedBox(
                                  width: 150,
                                  height: 250,
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            width: 100,
                                            child: const Text(
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                              'Medulloblastoma',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18),
                                            ),
                                          ),
                                          IconButton(
                                              onPressed: () {
                                                showDialog(
                                                  context: context,
                                                  builder: (context) {
                                                    return AlertDialog(
                                                      content: Stack(
                                                        alignment:
                                                            Alignment.topRight,
                                                        children: [
                                                          const Image(
                                                            image: AssetImage(
                                                                'asserts/medulloblastoma-8col-3802786-003-0.jpg'),
                                                            fit: BoxFit.fill,
                                                            width: 300,
                                                            height: 300,
                                                          ),
                                                          IconButton(
                                                              onPressed: () {
                                                                Navigator.of(
                                                                        context)
                                                                    .pop();
                                                              },
                                                              icon: const Icon(
                                                                  Icons
                                                                      .fullscreen_exit,
                                                                  size: 30)),
                                                        ],
                                                      ),
                                                      actions: [
                                                        Container(
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          child: const Text(
                                                            'Medulloblastoma',
                                                            style: TextStyle(
                                                                fontSize: 17,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700),
                                                          ),
                                                        ),
                                                        const Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 8),
                                                          child: Text(
                                                            'Medulloblastoma is a type of brain cancer that starts in the part of the brain called the cerebellum. Medulloblastoma is the most common type of cancerous brain tumor in children.',
                                                            style: TextStyle(
                                                                fontSize: 15,
                                                                color: Color
                                                                    .fromARGB(
                                                                        170,
                                                                        0,
                                                                        0,
                                                                        0)),
                                                          ),
                                                        )
                                                      ],
                                                    );
                                                  },
                                                );
                                              },
                                              icon: const Icon(
                                                Icons.fullscreen,
                                                size: 35,
                                              )),
                                        ],
                                      ),
                                      const Image(
                                        image: AssetImage(
                                            'asserts/medulloblastoma-8col-3802786-003-0.jpg'),
                                        fit: BoxFit.fill,
                                        height: 190,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                alignment: Alignment.topLeft,
                                child: const Text(
                                  "3. Embryonal tumors. Embryonal tumors begin in cells that are left over from fetal development. The cells, called embryonal cells, stay in the brain after birth. Embryonal tumors are malignant brain tumors that happen most often in babies and young children. The most common type of embryonal tumor is medulloblastoma. It's usually located in the lower back part of the brain, called the cerebellum.",
                                  style: TextStyle(fontSize: 15, height: 1.2),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {},
                                child: SizedBox(
                                  width: 150,
                                  height: 300,
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            width: 100,
                                            child: const Text(
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                              'Acoustic neuroma (vestibular schwannoma)',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18),
                                            ),
                                          ),
                                          IconButton(
                                              onPressed: () {
                                                showDialog(
                                                  context: context,
                                                  builder: (context) {
                                                    return AlertDialog(
                                                      content: Stack(
                                                        alignment:
                                                            Alignment.topRight,
                                                        children: [
                                                          const Image(
                                                            image: AssetImage(
                                                                'asserts/ans7_acousticneuroma-8col.jpg'),
                                                            fit: BoxFit.fill,
                                                            width: 300,
                                                            height: 370,
                                                          ),
                                                          IconButton(
                                                              onPressed: () {
                                                                Navigator.of(
                                                                        context)
                                                                    .pop();
                                                              },
                                                              icon: const Icon(
                                                                  Icons
                                                                      .fullscreen_exit,
                                                                  size: 30)),
                                                        ],
                                                      ),
                                                      actions: [
                                                        Container(
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          child: const Text(
                                                            'Acoustic neuroma (vestibular schwannoma)',
                                                            style: TextStyle(
                                                                fontSize: 17,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700),
                                                          ),
                                                        ),
                                                        const Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 8),
                                                          child: Text(
                                                            'An acoustic neuroma (vestibular schwannoma) is a benign tumor that develops on the balance and hearing nerves leading from the inner ear to the brain. These nerves are twined together to form the vestibulocochlear nerve (eighth cranial nerve). The pressure on the nerve from the tumor may cause hearing loss and imbalance.',
                                                            style: TextStyle(
                                                                fontSize: 15,
                                                                color: Color
                                                                    .fromARGB(
                                                                        170,
                                                                        0,
                                                                        0,
                                                                        0)),
                                                          ),
                                                        )
                                                      ],
                                                    );
                                                  },
                                                );
                                              },
                                              icon: const Icon(
                                                Icons.fullscreen,
                                                size: 35,
                                              )),
                                        ],
                                      ),
                                      const Image(
                                        image: AssetImage(
                                            'asserts/ans7_acousticneuroma-8col.jpg'),
                                        fit: BoxFit.fill,
                                        height: 250,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "4. Pineal tumors. Pineal tumors start in and around the brain's pineal gland. The pineal gland is located in the center of the brain. It makes a hormone called melatonin that helps with sleep. Pineal tumors can be benign or malignant. Pineoblastoma is a malignant type of pineal tumor that's most common in children.",
                            style: TextStyle(fontSize: 15, height: 1.2),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "5. Meningiomas. Meningiomas are brain tumors that start in the membranes around the brain and spinal cord. Meningiomas are usually benign, but sometimes they can be malignant. Meningiomas are the most common type of benign brain tumor.",
                            style: TextStyle(fontSize: 15, height: 1.2),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "6. Nerve tumors. Nerve tumors are growths that happen in and around nerves. The most common type that happens in the head is acoustic neuroma, also called schwannoma. This benign tumor is located on the main nerve that connects the inner ear to the brain.",
                            style: TextStyle(fontSize: 15, height: 1.2),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "7. Pituitary tumors. Brain tumors can begin in and around the pituitary gland. This small gland is located near the base of the brain. Most tumors that happen in and around the pituitary gland are benign. Pituitary tumors happen in the pituitary gland itself. Craniopharyngioma is a type of brain tumor that happens near the pituitary gland.",
                            style: TextStyle(fontSize: 15, height: 1.2),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "8. Other brain tumors. Many other types of rare tumors can happen in and around the brain. Tumors can start in the muscles, blood vessels and connective tissue around the brain. Tumors can form in the bones of the skull. Malignant brain tumors can start from the germ-fighting immune system cells in the brain. This type of brain cancer is called primary central nervous system lymphoma.",
                            style: TextStyle(fontSize: 15, height: 1.2),
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
                        "Symptoms",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "The signs and symptoms of a brain tumor depend on the brain tumor's size and location. Symptoms also might depend on how fast the brain tumor is growing, which is also called the tumor grade.",
                    style: TextStyle(
                      fontSize: 16,
                      letterSpacing: 1.2,
                    ),
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    child: const Text(
                      "General signs and symptoms caused by brain tumors may include:",
                      style: TextStyle(
                          fontSize: 16.5, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(children: [
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "1. Headache or pressure in the head that is worse in the morning.",
                            style: TextStyle(fontSize: 15, height: 1.2),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "2. Headaches that happen more often and seem more severe.",
                            style: TextStyle(fontSize: 15, height: 1.2),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "3. Headaches that are sometimes described as tension headaches or migraines.",
                            style: TextStyle(fontSize: 15, height: 1.2),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "4. Nausea or vomiting.",
                            style: TextStyle(fontSize: 15, height: 1.2),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "5. Eye problems, such as blurry vision, seeing double or losing sight on the sides of your vision.",
                            style: TextStyle(fontSize: 15, height: 1.2),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "6. Losing feeling or movement in an arm or a leg.",
                            style: TextStyle(fontSize: 15, height: 1.2),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "7. Trouble with balance.",
                            style: TextStyle(fontSize: 15, height: 1.2),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "8. Speech problems.",
                            style: TextStyle(fontSize: 15, height: 1.2),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "9. Feeling very tired.",
                            style: TextStyle(fontSize: 15, height: 1.2),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "10. Confusion in everyday matters.",
                            style: TextStyle(fontSize: 15, height: 1.2),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "11. Memory problems.",
                            style: TextStyle(fontSize: 15, height: 1.2),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "12. Having trouble following simple commands.",
                            style: TextStyle(fontSize: 15, height: 1.2),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "13. Personality or behavior changes.",
                            style: TextStyle(fontSize: 15, height: 1.2),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "14. Seizures, especially if there is no history of seizures.",
                            style: TextStyle(fontSize: 15, height: 1.2),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "15. Hearing problems.",
                            style: TextStyle(fontSize: 15, height: 1.2),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "16. Dizziness or a sense that the world is spinning, also called vertigo.",
                            style: TextStyle(fontSize: 15, height: 1.2),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "17. Feeling very hungry and gaining weight.",
                            style: TextStyle(fontSize: 15, height: 1.2),
                          ),
                        ),
                      ])),
                  const Text(
                    "~ Brain tumors that aren't cancerous tend to cause symptoms that develop slowly. Noncancerous brain tumors also are called benign brain tumors. They might cause subtle symptoms that you don't notice at first. The symptoms might get worse over months or years.",
                    style: TextStyle(
                      fontSize: 16,
                      letterSpacing: 1.2,
                    ),
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                  const Text(
                    "~ Cancerous brain tumors cause symptoms that get worse quickly. Cancerous brain tumors also are called brain cancers or malignant brain tumors. They cause symptoms that come on suddenly. They get worse in a matter of days or weeks.",
                    style: TextStyle(
                      fontSize: 16,
                      letterSpacing: 1.2,
                    ),
                  ),
                  const SizedBox(
                    height: 13,
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
                        "Brain tumor headaches",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Column(
                    children: const [
                      Text(
                        "- Headaches are the most common symptom of brain tumors. Headaches happen in about half of people with brain tumors. Headaches can happen if a growing brain tumor presses on healthy cells around it. Or a brain tumor can cause swelling in the brain that increases pressure in the head and leads to a headache.",
                        style: TextStyle(
                          fontSize: 16,
                          letterSpacing: 1.2,
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Text(
                        "- Headache pain caused by brain tumors is often worse when you wake up in the morning. But it can happen at any time. Some people have headaches that wake them from sleep. Brain tumor headaches tend to cause pain that's worse when coughing or straining. People with brain tumors most often report that the headache feels like a tension headache. Some people say the headache feels like a migraine.",
                        style: TextStyle(
                          fontSize: 17,
                          letterSpacing: 1.2,
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Text(
                        "- Brain tumors in the back of the head might cause a headache with neck pain. If the brain tumor happens in the front of the head, the headache might feel like eye pain or sinus pain.",
                        style: TextStyle(
                          fontSize: 17,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    child: const Text(
                      "Brain tumor symptoms by location",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "The main part of the brain is called the cerebrum. Brain tumors in different parts of the cerebrum might cause different symptoms.",
                    style: TextStyle(
                      fontSize: 16,
                      letterSpacing: 1.2,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(children: [
                        GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  content: Stack(
                                    alignment: Alignment.topRight,
                                    children: [
                                      const Image(
                                          image: AssetImage(
                                              'asserts/mcdc7_brain_cancer-8col.jpg'),
                                          fit: BoxFit.contain),
                                      IconButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          icon: const Icon(
                                              Icons.fullscreen_exit,
                                              size: 30)),
                                    ],
                                  ),
                                  actions: [
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      child: const Text(
                                        'Brain tumor',
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(top: 8),
                                      child: Text(
                                        'A brain tumor can form in the brain cells (as shown), or it can begin elsewhere and spread to the brain. As the tumor grows, it creates pressure on and changes the function of surrounding brain tissue, which causes signs and symptoms such as headaches, nausea and balance problems.',
                                        style: TextStyle(
                                            fontSize: 15,
                                            color:
                                                Color.fromARGB(170, 0, 0, 0)),
                                      ),
                                    )
                                  ],
                                );
                              },
                            );
                          },
                          child: SizedBox(
                            height: 370,
                            width: 370,
                            child: Stack(
                              alignment: Alignment.topRight,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(top: 15.0),
                                  child: Image(
                                      image: AssetImage(
                                          'asserts/ds00266_ds00810_im03440_bn7_lobesthu_jpg.jpg'),
                                      fit: BoxFit.contain),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      'Brain lobes',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          showDialog(
                                            context: context,
                                            builder: (context) {
                                              return AlertDialog(
                                                content: Stack(
                                                  alignment: Alignment.topRight,
                                                  children: [
                                                    const Image(
                                                      image: AssetImage(
                                                          'asserts/ds00266_ds00810_im03440_bn7_lobesthu_jpg.jpg'),
                                                      fit: BoxFit.fill,
                                                      height: 370,
                                                    ),
                                                    IconButton(
                                                        onPressed: () {
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                        icon: const Icon(
                                                            Icons
                                                                .fullscreen_exit,
                                                            size: 30)),
                                                  ],
                                                ),
                                                actions: [
                                                  Container(
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    child: const Text(
                                                      'Brain lobes',
                                                      style: TextStyle(
                                                          fontSize: 17,
                                                          fontWeight:
                                                              FontWeight.w700),
                                                    ),
                                                  ),
                                                  const Padding(
                                                    padding:
                                                        EdgeInsets.only(top: 8),
                                                    child: Text(
                                                      'Each side of your brain contains four lobes. The frontal lobe is important for cognitive functions and control of voluntary movement or activity. The parietal lobe processes information about temperature, taste, touch and movement, while the occipital lobe is primarily responsible for vision. The temporal lobe processes memories, integrating them with sensations of taste, sound, sight and touch.',
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          color: Color.fromARGB(
                                                              170, 0, 0, 0)),
                                                    ),
                                                  )
                                                ],
                                              );
                                            },
                                          );
                                        },
                                        icon: const Icon(
                                          Icons.fullscreen,
                                          size: 35,
                                        )),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 11,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "- Brain tumors in the front of the brain. The frontal lobes are in the front of the brain. They control thinking and movement. Frontal lobe brain tumors might cause balance problems and trouble walking. There might be personality changes, such as forgetfulness and lack of interest in usual activities. Sometimes family members notice that the person with the brain tumor seems different.",
                            style: TextStyle(fontSize: 15, height: 1.3),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "- Brain tumors in the middle of the brain. The parietal lobes are in the upper middle part of the brain. They help process information about touch, taste, smell, vision and hearing. Parietal lobe brain tumors can cause problems related to the senses. Examples include vision problems and hearing problems.",
                            style: TextStyle(fontSize: 15, height: 1.3),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "- Brain tumors in the back of the brain. The occipital lobes are in the back of the brain. They control vision. Occipital lobe brain tumors can cause vision loss.",
                            style: TextStyle(fontSize: 15, height: 1.3),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "- Brain tumors in the lower part of the brain. The temporal lobes are on the sides of the brain. They process memories and senses. Temporal lobe brain tumors can cause memory problems. They might cause someone to see, taste or smell something that isn't there. Sometimes the taste or smell is unpleasant or unusual.",
                            style: TextStyle(fontSize: 15, height: 1.3),
                          ),
                        ),
                      ])),
                  const SizedBox(
                    height: 13,
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
                      "Brain tumors that begin in the brain: ",
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
                            "- Brain tumors that start as a growth of cells in the brain are called primary brain tumors. They might start right in the brain or in the tissue nearby. Nearby tissue might include the membranes that cover the brain, called meninges. Brain tumors also can happen in nerves, the pituitary gland and the pineal gland.",
                            style: TextStyle(fontSize: 15.5, height: 1.2),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "- Brain tumors happen when cells in or near the brain get changes in their DNA. A cell's DNA holds the instructions that tell the cell what to do. The changes tell the cells to grow quickly and continue living when healthy cells would die as part of their natural life cycle. This makes a lot of extra cells in the brain. The cells can form a growth called a tumor.",
                            style: TextStyle(fontSize: 15.5, height: 1.2),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "- It's not clear what causes the DNA changes that lead to brain tumors. For many people with brain tumors, the cause is never known. Sometimes parents pass DNA changes to their children. The changes can increase the risk of having a brain tumor. These hereditary brain tumors are rare. If you have a family history of brain tumors, talk about it with your health care provider. You might consider meeting with a health care provider trained in genetics to understand whether your family history increases your risk of having a brain tumor.",
                            style: TextStyle(fontSize: 15.5, height: 1.2),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "- When brain tumors happen in children, they're likely to be primary brain tumors. In adults, brain tumors are more likely to be cancer that started somewhere else and spread to the brain.",
                            style: TextStyle(fontSize: 15.5, height: 1.2),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "Cancer that spreads to the brain",
                            style: TextStyle(
                                fontSize: 18,
                                height: 1.2,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  content: Stack(
                                    alignment: Alignment.topRight,
                                    children: [
                                      const Image(
                                          image: AssetImage(
                                              'asserts/mcdc7_brain_cancer-8col.jpg'),
                                          fit: BoxFit.contain),
                                      IconButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          icon: const Icon(
                                              Icons.fullscreen_exit,
                                              size: 30)),
                                    ],
                                  ),
                                  actions: [
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      child: const Text(
                                        'Brain tumor',
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(top: 8),
                                      child: Text(
                                        'A brain tumor can form in the brain cells (as shown), or it can begin elsewhere and spread to the brain. As the tumor grows, it creates pressure on and changes the function of surrounding brain tissue, which causes signs and symptoms such as headaches, nausea and balance problems.',
                                        style: TextStyle(
                                            fontSize: 15,
                                            color:
                                                Color.fromARGB(170, 0, 0, 0)),
                                      ),
                                    )
                                  ],
                                );
                              },
                            );
                          },
                          child: SizedBox(
                            height: 370,
                            width: 370,
                            child: Stack(
                              alignment: Alignment.topRight,
                              children: [
                                const Image(
                                    image: AssetImage(
                                        'asserts/brain-metastases-8col.jpg'),
                                    fit: BoxFit.contain),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      'Brain metastases',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          showDialog(
                                            context: context,
                                            builder: (context) {
                                              return AlertDialog(
                                                content: Stack(
                                                  alignment: Alignment.topRight,
                                                  children: [
                                                    const Image(
                                                      image: AssetImage(
                                                          'asserts/brain-metastases-8col.jpg'),
                                                      fit: BoxFit.fill,
                                                      height: 350,
                                                    ),
                                                    IconButton(
                                                        onPressed: () {
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                        icon: const Icon(
                                                            Icons
                                                                .fullscreen_exit,
                                                            size: 30)),
                                                  ],
                                                ),
                                                actions: [
                                                  Container(
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    child: const Text(
                                                      'Brain metastases',
                                                      style: TextStyle(
                                                          fontSize: 17,
                                                          fontWeight:
                                                              FontWeight.w700),
                                                    ),
                                                  ),
                                                  const Padding(
                                                    padding:
                                                        EdgeInsets.only(top: 8),
                                                    child: Text(
                                                      'Brain metastases happen when cancer begins elsewhere in the body and spreads (metastasizes) to the brain.',
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          color: Color.fromARGB(
                                                              170, 0, 0, 0)),
                                                    ),
                                                  )
                                                ],
                                              );
                                            },
                                          );
                                        },
                                        icon: const Icon(
                                          Icons.fullscreen,
                                          size: 35,
                                        )),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "Secondary brain tumors happen when cancer starts somewhere else and spreads to the brain. When cancer spreads, it's called metastatic cancer.",
                            style: TextStyle(fontSize: 15, height: 1.3),
                          ),
                        ),
                        const SizedBox(
                          height: 11,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "Any cancer can spread to the brain, but common types include:",
                            style: TextStyle(
                                fontSize: 15,
                                height: 1.3,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Container(
                                alignment: Alignment.topLeft,
                                child: const Text(
                                  "* Breast cancer.\n* Colon cancer.\n* Kidney cancer.\n* Lung cancer.\n* Melanoma.",
                                  style: TextStyle(fontSize: 15, height: 1.3),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 11,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "It's not clear why some cancers spread to the brain and others are more likely to spread to other places.",
                            style: TextStyle(fontSize: 15, height: 1.3),
                          ),
                        ),
                        const SizedBox(
                          height: 11,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "Secondary brain tumors most often happen in people who have a history of cancer. Rarely, a brain tumor may be the first sign of cancer that began somewhere else in the body.",
                            style: TextStyle(fontSize: 15, height: 1.3),
                          ),
                        ),
                        const SizedBox(
                          height: 11,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "In adults, secondary brain tumors are far more common than are primary brain tumors.",
                            style: TextStyle(fontSize: 15, height: 1.3),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
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
                      "In most people with primary brain tumors, the cause isn't clear. But doctors have identified some factors that may raise the risk.",
                      style: TextStyle(
                          fontSize: 16,
                          height: 1.2,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    child: const Text(
                      "Risk factors include:",
                      style: TextStyle(
                        fontSize: 16.5,
                        height: 1.2,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "1- Age. Brain tumors can happen at any age, but they happen most often in older adults. Some brain tumors mostly affect adults. Some brain tumors happen most often in children.",
                            style: TextStyle(
                              fontSize: 15,
                              height: 1.2,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "2- Race. Anyone can get a brain tumor. But some types of brain tumors are more common in people of certain races. For example, gliomas are more common in white people. Meningiomas are more common in Black people.",
                            style: TextStyle(
                              fontSize: 15,
                              height: 1.2,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "3- Exposure to radiation. People who have been exposed to a strong type of radiation have an increased risk of brain tumor. This strong radiation is called ionizing radiation. The radiation is strong enough to cause DNA changes in the body's cells. The DNA changes can lead to tumors and cancers. Examples of ionizing radiation include radiation therapy used to treat cancer and radiation exposure caused by atomic bombs.",
                            style: TextStyle(
                              fontSize: 15,
                              height: 1.2,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "Low-level radiation from everyday objects isn't linked to brain tumors. Low levels of radiation include the energy that comes from cellphones and radio waves. There is no convincing evidence that using cellphones causes brain tumors. But more studies are happening to make sure.",
                            style: TextStyle(
                              fontSize: 15,
                              height: 1.2,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "4- Inherited syndromes that increase the risk of brain tumor. Some DNA changes that increase the risk of brain tumor run in families. Examples include the DNA changes that cause neurofibromatosis 1 and 2, tuberous sclerosis, Lynch syndrome, Li-Fraumeni syndrome, Von Hippel-Lindau disease, familial adenomatous polyposis, Cowden syndrome, and Gorlin syndrome.",
                            style: TextStyle(
                              fontSize: 15,
                              height: 1.2,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 5,
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
                        "When to see a doctor",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "Make an appointment with your health care provider if you have persistent signs and symptoms that worry you.",
                            style: TextStyle(
                              fontSize: 18,
                              height: 1.3,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
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
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "There's no way to prevent brain tumors. If you get a brain tumor, you didn't do anything to cause it.",
                            style: TextStyle(
                              fontSize: 16,
                              height: 1.2,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "People with an increased risk of brain tumor might consider screening tests. Screening isn't brain tumor prevention. But screening might help find a brain tumor when it's small and treatment is more likely to be successful.",
                            style: TextStyle(
                              fontSize: 16,
                              height: 1.2,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "If you have a family history of brain tumor or inherited syndromes that increase the risk of brain tumor, talk about it with your health care provider. You might consider meeting with a genetic counselor or other health care provider trained in genetics. This person can help you understand your risk and ways to manage it. For example, you might consider brain tumor screening tests. Testing might include an imaging test or a neurological exam to test your vision, hearing, balance, coordination and reflexes.",
                            style: TextStyle(
                              fontSize: 16,
                              height: 1.2,
                            ),
                          ),
                        ),
                      ],
                    ),
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
