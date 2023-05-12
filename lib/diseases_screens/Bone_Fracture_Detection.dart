import 'dart:io';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:image_picker/image_picker.dart';

import '../shared/components/components.dart';

class BoneFractureDetection extends StatefulWidget {
  const BoneFractureDetection({super.key});

  @override
  State<BoneFractureDetection> createState() => _BoneFractureDetectionState();
}

class _BoneFractureDetectionState extends State<BoneFractureDetection> {
  bool showMore = false;
  final Uri _uri = Uri.parse(
      'https://www.pennmedicine.org/for-patients-and-visitors/patient-information/conditions-treated-a-to-z/bone-fractures');
  File? image;
  final imagePicker = ImagePicker();
  upoaldImage(ImageSource source) async {
    var pickedImage = await imagePicker.pickImage(source: source);
    if (pickedImage != null) {
      setState(() {
        image = File(pickedImage.path);
      });
    } else {}
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
            "Bone Fracture",
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
                      image: AssetImage("asserts/2103214.jpg"),
                      fit: BoxFit.contain)),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(
                start: 5,
                end: 5,
              ),
              child: Divider(
                height: 10,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(
              height: 10,
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
                  height: 10,
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
                                contentPadding:
                                    const EdgeInsets.only(top: 10, left: 10),
                              );
                            });

                        await upoaldImage(ImageSource.gallery);
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
                image == null
                    ? const Text("")
                    : Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          alignment: Alignment.center,
                          child: const Padding(
                            padding: EdgeInsets.all(4.0),
                            child: Text(
                              "Sorry, Unfortunately we haven't added the module to diagnose your disease yet, don't worry we will add it soon...",
                              style: TextStyle(
                                  color: Color.fromARGB(200, 174, 6, 6),
                                  fontSize: 20),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 10, end: 10),
              child: Divider(
                height: 10,
                color: Colors.grey[600],
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Definition",
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
                      textAlign: TextAlign.start,
                      "If more pressure is put on a bone than it can stand, it will split or break. A break of any size is called a fracture. If the broken bone punctures the skin, it is called an open fracture (compound fracture).",
                      style: TextStyle(fontSize: 18, height: 1.2),
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    child: const Text(
                      textAlign: TextAlign.start,
                      "A stress fracture is a break in the bone that develops because of repeated or prolonged forces against the bone. The repeated stress weakens the bone until it finally breaks.",
                      style: TextStyle(fontSize: 18, height: 1.2),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ])),
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 10, end: 10),
              child: Divider(
                height: 10,
                color: Colors.grey[600],
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Alternative Names",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                )
              ],
            ),
            const SizedBox(
              height: 6,
            ),
            const Padding(
              padding: EdgeInsets.only(left:8.0),
              child: Text(
                textAlign: TextAlign.start,
                "Bone - broken; Fracture; Stress fracture; Bone fracture",
                style: TextStyle(
                    fontSize: 18, height: 1.2, fontWeight: FontWeight.w400),
              ),
            ),
            if (showMore)
              Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.only(start: 10, end: 10),
                    child: Divider(
                      height: 10,
                      color: Colors.grey[600],
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Considerations",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      textAlign: TextAlign.start,
                      "It is hard to tell a dislocated joint from a broken bone. However, both are emergency situations, and the basic first aid steps are the same.",
                      style: TextStyle(
                          fontSize: 17,
                          height: 1.2,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.only(start: 10, end: 10),
                    child: Divider(
                      height: 10,
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
                    height: 10,
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    child: const Text(
                      textAlign: TextAlign.start,
                      "The following are common causes of broken bones:",
                      style: TextStyle(
                          fontSize: 17,
                          height: 1.2,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(children: [
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            textAlign: TextAlign.start,
                            "- Fall from a height",
                            style: TextStyle(fontSize: 16, height: 1.2),
                          ),
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            textAlign: TextAlign.start,
                            "- Trauma",
                            style: TextStyle(fontSize: 16, height: 1.2),
                          ),
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            textAlign: TextAlign.start,
                            "- Motor vehicle accidents",
                            style: TextStyle(fontSize: 16, height: 1.2),
                          ),
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            textAlign: TextAlign.start,
                            "- Direct blow",
                            style: TextStyle(fontSize: 16, height: 1.2),
                          ),
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            textAlign: TextAlign.start,
                            "- Child abuse",
                            style: TextStyle(fontSize: 16, height: 1.2),
                          ),
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            textAlign: TextAlign.start,
                            "- Repetitive forces, such as those caused by running, can cause stress fractures of the foot, ankle, tibia, or hip",
                            style: TextStyle(fontSize: 16, height: 1.2),
                          ),
                        ),
                      ])),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.only(start: 10, end: 10),
                    child: Divider(
                      height: 10,
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
                    height: 10,
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    child: const Text(
                      textAlign: TextAlign.start,
                      "Symptoms of a broken bone include:",
                      style: TextStyle(
                          fontSize: 17,
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
                            textAlign: TextAlign.start,
                            "* A visibly out-of-place or misshapen limb or joint",
                            style: TextStyle(fontSize: 16, height: 1.2),
                          ),
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            textAlign: TextAlign.start,
                            "* Swelling, bruising, or bleeding",
                            style: TextStyle(fontSize: 16, height: 1.2),
                          ),
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            textAlign: TextAlign.start,
                            "* Intense pain",
                            style: TextStyle(fontSize: 16, height: 1.2),
                          ),
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            textAlign: TextAlign.start,
                            "* Numbness and tingling",
                            style: TextStyle(fontSize: 16, height: 1.2),
                          ),
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            textAlign: TextAlign.start,
                            "* Broken skin with bone protruding",
                            style: TextStyle(fontSize: 16, height: 1.2),
                          ),
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            textAlign: TextAlign.start,
                            "* Limited mobility or inability to move a limb or put weight on the leg",
                            style: TextStyle(fontSize: 16, height: 1.2),
                          ),
                        ),
                      ])),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.only(start: 10, end: 10),
                    child: Divider(
                      height: 10,
                      color: Colors.grey[600],
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "First Aid",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    child: const Text(
                      textAlign: TextAlign.start,
                      "First aid steps include:",
                      style: TextStyle(
                          fontSize: 17,
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
                            textAlign: TextAlign.start,
                            "1. Check the person's airway and breathing. If necessary, call 911 or the local emergency number and begin rescue breathing, CPR, or bleeding control.",
                            style: TextStyle(fontSize: 15, height: 1.2),
                          ),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            textAlign: TextAlign.start,
                            "2. Keep the person still and calm.",
                            style: TextStyle(fontSize: 15, height: 1.2),
                          ),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            textAlign: TextAlign.start,
                            "3. Examine the person closely for other injuries.",
                            style: TextStyle(fontSize: 15, height: 1.2),
                          ),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            textAlign: TextAlign.start,
                            "4. In most cases, if medical help responds quickly, allow the medical personnel to take further action.",
                            style: TextStyle(fontSize: 15, height: 1.2),
                          ),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            textAlign: TextAlign.start,
                            "5. If the skin is broken, it should be treated right away to prevent infection. Call emergency help right away. DO NOT breathe on the wound or probe it. Try to cover the wound to avoid further contamination. Cover with sterile dressings if they are available. Don't try to line up the fracture unless you are medically trained to do so.",
                            style: TextStyle(fontSize: 15, height: 1.2),
                          ),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            textAlign: TextAlign.start,
                            "6. If needed, immobilize the broken bone with a splint or sling. Possible splints include a rolled up newspaper or strips of wood. Immobilize the area both above and below the injured bone.",
                            style: TextStyle(fontSize: 15, height: 1.2),
                          ),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            textAlign: TextAlign.start,
                            "7. Apply ice packs to reduce pain and swelling. Elevating the limb can also help to reduce swelling.",
                            style: TextStyle(fontSize: 15, height: 1.2),
                          ),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            textAlign: TextAlign.start,
                            "8. Take steps to prevent shock. Lay the person flat, elevate the feet about 12 inches (30 centimeters) above the head, and cover the person with a coat or blanket. However, DO NOT move the person if a head, neck, or back injury is suspected.",
                            style: TextStyle(fontSize: 15, height: 1.2),
                          ),
                        ),
                      ])),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.only(start: 10, end: 10),
                    child: Divider(
                      height: 10,
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
                  Container(
                    alignment: Alignment.topLeft,
                    child: const Text(
                      textAlign: TextAlign.start,
                      "Take the following steps to reduce your risk of a broken bone:",
                      style: TextStyle(
                          fontSize: 17,
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
                            textAlign: TextAlign.start,
                            "~ Wear protective gear while skiing, biking, roller blading, and participating in contact sports. This includes using a helmet, elbow pads, knee pads, wrist guards, and shin pads.",
                            style: TextStyle(fontSize: 16, height: 1.2),
                          ),
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            textAlign: TextAlign.start,
                            "~ Create a safe home for young children. Place a gate at stairways and keep windows closed.",
                            style: TextStyle(fontSize: 16, height: 1.2),
                          ),
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            textAlign: TextAlign.start,
                            "~ Teach children how to be safe and look out for themselves.",
                            style: TextStyle(fontSize: 16, height: 1.2),
                          ),
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            textAlign: TextAlign.start,
                            "~ Supervise children carefully. There is no substitute for supervision, no matter how safe the environment or situation appears to be.",
                            style: TextStyle(fontSize: 16, height: 1.2),
                          ),
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            textAlign: TextAlign.start,
                            "~ Prevent falls by not standing on chairs, counter tops, or other unstable objects. Remove throw rugs and electrical cords from floor surfaces. Use handrails on staircases and non-skid mats in bathtubs. These steps are especially important for older people.",
                            style: TextStyle(fontSize: 16, height: 1.2),
                          ),
                        ),
                      ])),
                ],
              ),
            TextButton(
              onPressed: () {
                setState(() {
                  showMore = !showMore;
                });
              },
              child: Text(
                showMore ? 'See Less' : 'See More',
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 0, end: 0),
              child: Divider(
                thickness: 2,
                height: 20,
                color: Colors.grey[600],
              ),
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
