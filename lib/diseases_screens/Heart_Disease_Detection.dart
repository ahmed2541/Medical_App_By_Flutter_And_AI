import 'dart:io';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:image_picker/image_picker.dart';

import '../shared/components/components.dart';

class HeartDiseaseDetection extends StatefulWidget {
  const HeartDiseaseDetection({super.key});

  @override
  State<HeartDiseaseDetection> createState() => _HeartDiseaseDetectionState();
}

class _HeartDiseaseDetectionState extends State<HeartDiseaseDetection> {
  bool showMore = false;
  final Uri _uri = Uri.parse(
      'https://www.mayoclinic.org/diseases-conditions/heart-disease/symptoms-causes/syc-20353118');
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
      backgroundColor: Colors.white,
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
            "Heart Disease",
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
                      image: AssetImage("assets/images/Heart.jpg"),
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
                          child: const Center(
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
              height: 15,
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
                padding: const EdgeInsets.all(8),
                child: Column(children: [
                  Container(
                    alignment: Alignment.topLeft,
                    child: const Text(
                      "Heart disease describes a range of conditions that affect the heart. Heart diseases include:",
                      style: TextStyle(
                          fontSize: 17,
                          height: 1.2,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "- Blood vessel disease, such as coronary artery disease",
                            style: TextStyle(fontSize: 17, height: 1.1),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "-  Irregular heartbeats (arrhythmias)",
                            style: TextStyle(fontSize: 17, height: 1.1),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "- Heart problems you're born with (congenital heart defects)",
                            style: TextStyle(fontSize: 17, height: 1.1),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "- Disease of the heart muscle",
                            style: TextStyle(fontSize: 17, height: 1.1),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "- Heart valve disease",
                            style: TextStyle(fontSize: 17, height: 1.1),
                          ),
                        ),
                      ],
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
                  const Text(
                    "Heart disease symptoms depend on the type of heart disease.",
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
                      "Symptoms of heart disease in the blood vessels",
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
                            "Coronary artery disease is a common heart condition that affects the major blood vessels that supply the heart muscle. Cholesterol deposits (plaques) in the heart arteries are usually the cause of coronary artery disease. The buildup of these plaques is called atherosclerosis (ath-ur-o-skluh-ROE-sis). Atherosclerosis reduces blood flow to the heart and other parts of the body. It can lead to a heart attack, chest pain (angina) or stroke.",
                            style: TextStyle(fontSize: 15, height: 1.2),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "Coronary artery disease symptoms may be different for men and women. For instance, men are more likely to have chest pain. Women are more likely to have other symptoms along with chest discomfort, such as shortness of breath, nausea and extreme fatigue.",
                            style: TextStyle(fontSize: 15, height: 1.2),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "Symptoms of coronary artery disease can include:",
                            style: TextStyle(fontSize: 15, height: 1.2),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Container(
                                alignment: Alignment.topLeft,
                                child: const Text(
                                  "- Chest pain, chest tightness, chest pressure and chest discomfort (angina)",
                                  style: TextStyle(fontSize: 15, height: 1.2),
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Container(
                                alignment: Alignment.topLeft,
                                child: const Text(
                                  "- Shortness of breath",
                                  style: TextStyle(fontSize: 15, height: 1.2),
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Container(
                                alignment: Alignment.topLeft,
                                child: const Text(
                                  "- Pain in the neck, jaw, throat, upper belly area or back",
                                  style: TextStyle(fontSize: 15, height: 1.2),
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Container(
                                alignment: Alignment.topLeft,
                                child: const Text(
                                  "- Pain, numbness, weakness or coldness in the legs or arms if the blood vessels in those body areas are narrowed",
                                  style: TextStyle(fontSize: 15, height: 1.2),
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "You might not be diagnosed with coronary artery disease until you have a heart attack, angina, stroke or heart failure. It's important to watch for heart symptoms and discuss concerns with your health care provider. Heart (cardiovascular) disease can sometimes be found early with regular health checkups.",
                            style: TextStyle(fontSize: 15, height: 1.2),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "Heart disease symptoms caused by irregular heartbeats (heart arrhythmias)",
                            style: TextStyle(
                                fontSize: 15,
                                height: 1.2,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "The heart may beat too quickly, too slowly or irregularly. Heart arrhythmia symptoms can include:",
                            style: TextStyle(fontSize: 15, height: 1.2),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Container(
                                alignment: Alignment.topLeft,
                                child: const Text(
                                  "- Chest pain or discomfort",
                                  style: TextStyle(fontSize: 15, height: 1.2),
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Container(
                                alignment: Alignment.topLeft,
                                child: const Text(
                                  "- Dizziness",
                                  style: TextStyle(fontSize: 15, height: 1.2),
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Container(
                                alignment: Alignment.topLeft,
                                child: const Text(
                                  "- Fainting (syncope) or near fainting",
                                  style: TextStyle(fontSize: 15, height: 1.2),
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Container(
                                alignment: Alignment.topLeft,
                                child: const Text(
                                  "- Fluttering in the chest",
                                  style: TextStyle(fontSize: 15, height: 1.2),
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Container(
                                alignment: Alignment.topLeft,
                                child: const Text(
                                  "- Lightheadedness",
                                  style: TextStyle(fontSize: 15, height: 1.2),
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Container(
                                alignment: Alignment.topLeft,
                                child: const Text(
                                  "- Racing heartbeat (tachycardia)",
                                  style: TextStyle(fontSize: 15, height: 1.2),
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Container(
                                alignment: Alignment.topLeft,
                                child: const Text(
                                  "- Shortness of breath",
                                  style: TextStyle(fontSize: 15, height: 1.2),
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Container(
                                alignment: Alignment.topLeft,
                                child: const Text(
                                  "- Slow heartbeat (bradycardia)",
                                  style: TextStyle(fontSize: 15, height: 1.2),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "Heart disease symptoms caused by congenital heart defects",
                            style: TextStyle(
                                fontSize: 15,
                                height: 1.2,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "Serious congenital heart defects usually are noticed soon after birth. Congenital heart defect symptoms in children could include:",
                            style: TextStyle(fontSize: 15, height: 1.2),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Container(
                                alignment: Alignment.topLeft,
                                child: const Text(
                                  "- Pale gray or blue skin or lips (cyanosis)",
                                  style: TextStyle(fontSize: 15, height: 1.2),
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Container(
                                alignment: Alignment.topLeft,
                                child: const Text(
                                  "- Swelling in the legs, belly area or areas around the eyes",
                                  style: TextStyle(fontSize: 15, height: 1.2),
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Container(
                                alignment: Alignment.topLeft,
                                child: const Text(
                                  "- In an infant, shortness of breath during feedings, leading to poor weight gain",
                                  style: TextStyle(fontSize: 15, height: 1.2),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "Less-serious congenital heart defects are often not diagnosed until later in childhood or during adulthood. Symptoms of congenital heart defects that usually aren't immediately life-threatening include:",
                            style: TextStyle(fontSize: 15, height: 1.2),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Container(
                                alignment: Alignment.topLeft,
                                child: const Text(
                                  "- Easily getting short of breath during exercise or activity",
                                  style: TextStyle(fontSize: 15, height: 1.2),
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Container(
                                alignment: Alignment.topLeft,
                                child: const Text(
                                  "- Easily tiring during exercise or activity",
                                  style: TextStyle(fontSize: 15, height: 1.2),
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Container(
                                alignment: Alignment.topLeft,
                                child: const Text(
                                  "- Swelling of the hands, ankles or feet",
                                  style: TextStyle(fontSize: 15, height: 1.2),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "Heart disease symptoms caused by diseased heart muscle (cardiomyopathy)",
                            style: TextStyle(
                                fontSize: 15,
                                height: 1.2,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "Early stages of cardiomyopathy may not cause noticeable symptoms. As the condition worsens, symptoms may include:",
                            style: TextStyle(fontSize: 15, height: 1.2),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Container(
                                alignment: Alignment.topLeft,
                                child: const Text(
                                  "- Dizziness, lightheadedness and fainting",
                                  style: TextStyle(fontSize: 15, height: 1.2),
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Container(
                                alignment: Alignment.topLeft,
                                child: const Text(
                                  "- Fatigue",
                                  style: TextStyle(fontSize: 15, height: 1.2),
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Container(
                                alignment: Alignment.topLeft,
                                child: const Text(
                                  "- Feeling short of breath during activity or at rest",
                                  style: TextStyle(fontSize: 15, height: 1.2),
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Container(
                                alignment: Alignment.topLeft,
                                child: const Text(
                                  "- Feeling short of breath at night when trying to sleep or waking up short of breath",
                                  style: TextStyle(fontSize: 15, height: 1.2),
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Container(
                                alignment: Alignment.topLeft,
                                child: const Text(
                                  "- Irregular heartbeats that feel rapid, pounding or fluttering",
                                  style: TextStyle(fontSize: 15, height: 1.2),
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Container(
                                alignment: Alignment.topLeft,
                                child: const Text(
                                  "- Swollen legs, ankles or feet",
                                  style: TextStyle(fontSize: 15, height: 1.2),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "Heart disease symptoms caused by heart valve problems (valvular heart disease)",
                            style: TextStyle(
                                fontSize: 15,
                                height: 1.2,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "The heart has four valves — the aortic, mitral, pulmonary and tricuspid valves. They open and close to move blood through the heart. Many things can damage the heart valves. A heart valve may become narrowed (stenosis), leaky (regurgitation or insufficiency) or close improperly (prolapse).",
                            style: TextStyle(fontSize: 15, height: 1.2),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "Valvular heart disease is also called heart valve disease. Depending on which valve isn't working properly, heart valve disease symptoms generally include:",
                            style: TextStyle(fontSize: 15, height: 1.2),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Container(
                                alignment: Alignment.topLeft,
                                child: const Text(
                                  "- Chest pain",
                                  style: TextStyle(fontSize: 15, height: 1.2),
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Container(
                                alignment: Alignment.topLeft,
                                child: const Text(
                                  "- Fainting (syncope)",
                                  style: TextStyle(fontSize: 15, height: 1.2),
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Container(
                                alignment: Alignment.topLeft,
                                child: const Text(
                                  "- Fatigue",
                                  style: TextStyle(fontSize: 15, height: 1.2),
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Container(
                                alignment: Alignment.topLeft,
                                child: const Text(
                                  "- Irregular heartbeat",
                                  style: TextStyle(fontSize: 15, height: 1.2),
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Container(
                                alignment: Alignment.topLeft,
                                child: const Text(
                                  "- Shortness of breath",
                                  style: TextStyle(fontSize: 15, height: 1.2),
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Container(
                                alignment: Alignment.topLeft,
                                child: const Text(
                                  "- Swollen feet or ankles",
                                  style: TextStyle(fontSize: 15, height: 1.2),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "Endocarditis is an infection that affects the heart valves and inner lining of the heart chambers and heart valves (endocardium). Endocarditis symptoms can include:",
                            style: TextStyle(fontSize: 15, height: 1.2),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Container(
                                alignment: Alignment.topLeft,
                                child: const Text(
                                  "- Dry or persistent cough",
                                  style: TextStyle(fontSize: 15, height: 1.2),
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Container(
                                alignment: Alignment.topLeft,
                                child: const Text(
                                  "- Fever",
                                  style: TextStyle(fontSize: 15, height: 1.2),
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Container(
                                alignment: Alignment.topLeft,
                                child: const Text(
                                  "- Heartbeat changes",
                                  style: TextStyle(fontSize: 15, height: 1.2),
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Container(
                                alignment: Alignment.topLeft,
                                child: const Text(
                                  "- Shortness of breath",
                                  style: TextStyle(fontSize: 15, height: 1.2),
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Container(
                                alignment: Alignment.topLeft,
                                child: const Text(
                                  "- Skin rashes or unusual spots",
                                  style: TextStyle(fontSize: 15, height: 1.2),
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Container(
                                alignment: Alignment.topLeft,
                                child: const Text(
                                  "- Swelling of the legs or belly area",
                                  style: TextStyle(fontSize: 15, height: 1.2),
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Container(
                                alignment: Alignment.topLeft,
                                child: const Text(
                                  "- Weakness or fatigue",
                                  style: TextStyle(fontSize: 15, height: 1.2),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 8,
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
                      "Heart disease causes depend on the specific type of heart disease. There are many different types of heart disease. ",
                      style: TextStyle(
                        fontSize: 17,
                        height: 1.2,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    child: const Text(
                      "How the heart works",
                      style: TextStyle(
                          fontSize: 17,
                          height: 1.2,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    child: const Text(
                      "To understand the causes of heart disease, it may help to understand how the heart works.",
                      style: TextStyle(fontSize: 16, height: 1.2),
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
                                        'assets/images/mcdc7_theheart.jpg'),
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
                                  'Chambers and valves of the heart',
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(top: 8),
                                child: Text(
                                  'A typical heart has two upper and two lower chambers. The upper chambers, the right and left atria, receive incoming blood. The lower chambers, the more muscular right and left ventricles, pump blood out of the heart. The heart valves, which keep blood flowing in the right direction, are gates at the chamber openings.',
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
                              image: AssetImage('assets/images/mcdc7_theheart.jpg'),
                              fit: BoxFit.contain),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Chambers and valves of the heart',
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
                                                      'assets/images/mcdc7_theheart.jpg'),
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
                                                'Chambers and valves of the heart',
                                                style: TextStyle(
                                                    fontSize: 17,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                            ),
                                            const Padding(
                                              padding: EdgeInsets.only(top: 8),
                                              child: Text(
                                                'A typical heart has two upper and two lower chambers. The upper chambers, the right and left atria, receive incoming blood. The lower chambers, the more muscular right and left ventricles, pump blood out of the heart. The heart valves, which keep blood flowing in the right direction, are gates at the chamber openings.',
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
                  Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(children: [
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "- The heart is divided into chambers — two upper chambers (atria) and two lower chambers (ventricles).",
                            style: TextStyle(fontSize: 15.5, height: 1.2),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "- The right side of the heart moves blood to the lungs through blood vessels (pulmonary arteries).",
                            style: TextStyle(fontSize: 15.5, height: 1.2),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "- In the lungs, blood picks up oxygen and then returns to the left side of the heart through the pulmonary veins.",
                            style: TextStyle(fontSize: 15.5, height: 1.2),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "- The left side of the heart then pumps the blood through the aorta and out to the rest of the body.",
                            style: TextStyle(fontSize: 15.5, height: 1.2),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "Heart valves",
                            style: TextStyle(
                                fontSize: 17,
                                height: 1.2,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "Four heart valves — the aortic, mitral, pulmonary and tricuspid — keep the blood moving the right way. The valves open only one way and only when they need to. Valves must open all the way and close tightly so there's no leakage.",
                            style: TextStyle(fontSize: 15, height: 1.2),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "Heartbeats",
                            style: TextStyle(
                                fontSize: 17,
                                height: 1.2,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "A beating heart squeezes (contracts) and relaxes in a continuous cycle.",
                            style: TextStyle(fontSize: 15, height: 1.2),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Container(
                                alignment: Alignment.topLeft,
                                child: const Text(
                                  "- During contraction (systole), the lower heart chambers (ventricles) squeeze tight. This action forces blood to the lungs and the rest of the body. ",
                                  style: TextStyle(fontSize: 15, height: 1.2),
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Container(
                                alignment: Alignment.topLeft,
                                child: const Text(
                                  "- During relaxation (diastole), the ventricles fill with blood from the upper heart chambers (atria).",
                                  style: TextStyle(fontSize: 15, height: 1.2),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "Electrical system",
                            style: TextStyle(
                                fontSize: 17,
                                height: 1.2,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "The heart's electrical system keeps it beating. The heartbeat controls the continuous exchange of oxygen-rich blood with oxygen-poor blood. This exchange keeps you alive.",
                            style: TextStyle(fontSize: 15, height: 1.2),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Container(
                                alignment: Alignment.topLeft,
                                child: const Text(
                                  "- Electrical signals start in the upper right chamber (right atrium).",
                                  style: TextStyle(fontSize: 15, height: 1.2),
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Container(
                                alignment: Alignment.topLeft,
                                child: const Text(
                                  "- The signals travel through specialized pathways to the lower heart chambers (ventricles). This tells the heart to pump.",
                                  style: TextStyle(fontSize: 15, height: 1.2),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "Causes of coronary artery disease",
                            style: TextStyle(
                                fontSize: 18,
                                height: 1.2,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "A buildup of fatty plaques in the arteries (atherosclerosis) is the most common cause of coronary artery disease. Risk factors include a poor diet, lack of exercise, obesity and smoking. Healthy lifestyle choices can help lower the risk of atherosclerosis.",
                            style: TextStyle(fontSize: 16, height: 1.2),
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
                                            'assets/images/ds00525_-ds01120_-ds00064_-ds00178_-ds01052_-ds00537_-ds01179_im00642_ww5r236t_jpg.jpg'),
                                        height: 370,
                                        width: 330,
                                        fit: BoxFit.fill,
                                      ),
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
                                        'Development of atherosclerosis',
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(top: 8),
                                      child: Text(
                                        "If there's too much cholesterol in the blood, the cholesterol and other substances may form deposits (plaques) that collect on artery walls. Plaques can cause an artery to become narrowed or blocked. If a plaque ruptures, a blood clot can form. Plaques and blood clots can reduce blood flow through an artery.",
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
                            height: 350,
                            width: 370,
                            child: Stack(
                              alignment: Alignment.topRight,
                              children: [
                                const Image(
                                    image: AssetImage(
                                        'assets/images/ds00525_-ds01120_-ds00064_-ds00178_-ds01052_-ds00537_-ds01179_im00642_ww5r236t_jpg.jpg'),
                                    fit: BoxFit.contain),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      'Development of atherosclerosis',
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
                                                          'assets/images/ds00525_-ds01120_-ds00064_-ds00178_-ds01052_-ds00537_-ds01179_im00642_ww5r236t_jpg.jpg'),
                                                      height: 370,
                                                      width: 330,
                                                      fit: BoxFit.fill,
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
                                                      'Development of atherosclerosis',
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
                                                      "If there's too much cholesterol in the blood, the cholesterol and other substances may form deposits (plaques) that collect on artery walls. Plaques can cause an artery to become narrowed or blocked. If a plaque ruptures, a blood clot can form. Plaques and blood clots can reduce blood flow through an artery.",
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
                            "Causes of irregular heartbeats (arrhythmias)",
                            style: TextStyle(
                                fontSize: 17,
                                height: 1.2,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "Common causes of arrhythmias or conditions that can lead to them include:",
                            style: TextStyle(fontSize: 15, height: 1.2),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Container(
                                alignment: Alignment.topLeft,
                                child: const Text(
                                  "- Cardiomyopathy\n- Coronary artery disease\n- Diabetes\n- Drug misuse\n- Emotional stress\n- Excessive use of alcohol or caffeine\n- Heart problem present at birth (congenital heart defects)\n- High blood pressure\n-  High blood pressure\n- Smoking\n- Heart valve disease\n- Use of certain medications, including those bought without a prescription, and herbs and supplements",
                                  style: TextStyle(fontSize: 15, height: 1.2),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "Causes of congenital heart defects",
                            style: TextStyle(
                                fontSize: 18,
                                height: 1.2,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "A congenital heart defect develops while a baby is growing in the womb. A congenital heart defect forms as the baby's heart develops, about a month after conception. Congenital heart defects change the flow of blood in the heart. Some medical conditions, medications and genes increase the risk of congenital heart defects.",
                            style: TextStyle(fontSize: 16, height: 1.2),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "Causes of a thickened or enlarged heart muscle (cardiomyopathy)",
                            style: TextStyle(
                                fontSize: 17,
                                height: 1.2,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "The cause of cardiomyopathy depends on the type:",
                            style: TextStyle(fontSize: 15, height: 1.2),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Container(
                                alignment: Alignment.topLeft,
                                child: const Text(
                                  "- Dilated cardiomyopathy. The cause of this most common type of cardiomyopathy often is unknown. It may be passed down through families (inherited). Dilated cardiomyopathy typically starts in the heart's main pumping chamber (left ventricle). Many things can cause damage to the left ventricle, including heart attacks, infections, toxins and some drugs, including cancer medicines. ",
                                  style: TextStyle(fontSize: 15, height: 1.2),
                                ),
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              Container(
                                alignment: Alignment.topLeft,
                                child: const Text(
                                  "- Hypertrophic cardiomyopathy. This type is usually passed down through families (inherited).",
                                  style: TextStyle(fontSize: 15, height: 1.2),
                                ),
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              Container(
                                alignment: Alignment.topLeft,
                                child: const Text(
                                  "- Restrictive cardiomyopathy. This is the least common type of cardiomyopathy. It can occur for no known reason. Sometimes it's caused by a buildup of protein called amyloid in the heart (cardiac amyloidosis) or connective tissue disorders.",
                                  style: TextStyle(fontSize: 15, height: 1.2),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "Causes of heart infection",
                            style: TextStyle(
                                fontSize: 17,
                                height: 1.2,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "A heart infection, such as endocarditis, occurs when germs reach the heart or heart valves. The most common causes of heart infections are:",
                            style: TextStyle(fontSize: 15, height: 1.2),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Container(
                                alignment: Alignment.topLeft,
                                child: const Text(
                                  "- Bacteria\n- Viruses\n- Parasites",
                                  style: TextStyle(fontSize: 15, height: 1.2),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "Causes of heart valve disease",
                            style: TextStyle(
                                fontSize: 17,
                                height: 1.2,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "Many things can cause diseases of the heart valves. Some people are born with heart valve disease (congenital heart valve disease). Heart valve disease may also be caused by conditions such as:",
                            style: TextStyle(fontSize: 15, height: 1.2),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Container(
                                alignment: Alignment.topLeft,
                                child: const Text(
                                  "- Rheumatic fever\n- Infections (infectious endocarditis)\n-Connective tissue disorders ",
                                  style: TextStyle(fontSize: 15, height: 1.2),
                                ),
                              ),
                            ],
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
                    height: 8,
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    child: const Text(
                      "Risk factors for heart disease include:",
                      style: TextStyle(fontSize: 15, height: 1.2),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "1- Age. Growing older increases the risk of damaged and narrowed arteries and a weakened or thickened heart muscle.",
                            style: TextStyle(fontSize: 15, height: 1.2),
                          ),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "2- Sex. Men are generally at greater risk of heart disease. The risk for women increases after menopause.",
                            style: TextStyle(fontSize: 15, height: 1.2),
                          ),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "3- Family history. A family history of heart disease increases the risk of coronary artery disease, especially if a parent developed it at an early age (before age 55 for a male relative, such as your brother or father, and 65 for a female relative, such as your mother or sister).",
                            style: TextStyle(fontSize: 15, height: 1.2),
                          ),
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "4- Smoking. If you smoke, quit. Substances in tobacco smoke damage the arteries. Heart attacks are more common in smokers than in nonsmokers. If you need help quitting, talk to your health care provider about strategies that can help.",
                            style: TextStyle(fontSize: 15, height: 1.2),
                          ),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Container(
                            alignment: Alignment.topLeft,
                            child: const Text(
                              "5- Unhealthy diet. Diets high in fat, salt, sugar and cholesterol have been linked to heart disease.",
                              style: TextStyle(fontSize: 15, height: 1.2),
                            )),
                        const SizedBox(
                          height: 6,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "6- High blood pressure. Uncontrolled high blood pressure can cause the arteries to become hard and thick. These changes interrupt blood flow to the heart and body.",
                            style: TextStyle(fontSize: 15, height: 1.2),
                          ),
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "7- High cholesterol. Having high cholesterol increases the risk of atherosclerosis. Atherosclerosis has been linked to heart attacks and strokes.",
                            style: TextStyle(fontSize: 15, height: 1.2),
                          ),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "8- Diabetes. Diabetes increases the risk of heart disease. Obesity and high blood pressure increase the risk of diabetes and heart disease.",
                            style: TextStyle(fontSize: 15, height: 1.2),
                          ),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "9-Obesity. Excess weight typically worsens other heart disease risk factors. ",
                            style: TextStyle(fontSize: 15, height: 1.2),
                          ),
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "10- Lack of exercises. Being inactive (sedentary lifestyle) is associated with many forms of heart disease and some of its risk factors, too.",
                            style: TextStyle(fontSize: 15, height: 1.2),
                          ),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "11- Stress. Unrelieved stress may damage the arteries and worsen other risk factors for heart disease.",
                            style: TextStyle(fontSize: 15, height: 1.2),
                          ),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "12- Poor dental health. It's important to brush and floss your teeth and gums often. Also get regular dental checkups. Unhealthy teeth and gums makes it easier for germs to enter the bloodstream and travel to the heart. This can cause endocarditis.",
                            style: TextStyle(fontSize: 15, height: 1.2),
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
                        "When to see a doctor",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "Seek emergency medical care if you have these heart disease symptoms:",
                            style: TextStyle(
                              fontSize: 18,
                              height: 1.2,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Column(
                            children: [
                              Container(
                                alignment: Alignment.topLeft,
                                child: const Text(
                                  '- Chest pain\n- Shortness of breath\n- Fainting',
                                  style: TextStyle(fontSize: 15, height: 1.2),
                                ),
                              )
                            ],
                          ),
                        )
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
                        "Complications",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    child: const Text(
                      "Complications of heart disease include:",
                      style: TextStyle(fontSize: 15, height: 1.2),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "- Heart failure. This is one of the most common complications of heart disease. Heart failure occurs when the heart can't pump enough blood to meet the body's needs.",
                            style: TextStyle(fontSize: 15, height: 1.2),
                          ),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "- Heart attack. A heart attack may occur if a blood clot is stuck in a blood vessel that goes to the heart.",
                            style: TextStyle(fontSize: 15, height: 1.2),
                          ),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "- Stroke. The risk factors that lead to heart disease can also lead to an ischemic stroke. This type of stroke happens when the arteries to the brain are narrowed or blocked. Too little blood reaches the brain. A stroke is a medical emergency — brain tissue begins to die within just a few minutes of a stroke.",
                            style: TextStyle(fontSize: 15, height: 1.2),
                          ),
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "- Aneurysm. An aneurysm is a bulge in the wall of an artery. If an aneurysm bursts, you may have life-threatening internal bleeding.",
                            style: TextStyle(fontSize: 15, height: 1.2),
                          ),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "- Peripheral artery disease. In this condition, the arms or legs — usually the legs — don't get enough blood. This causes symptoms, most notably leg pain when walking (claudication). Atherosclerosis can lead to peripheral artery disease.",
                            style: TextStyle(fontSize: 15, height: 1.2),
                          ),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "- Sudden cardiac arrest. Sudden cardiac arrest is the sudden loss of heart function, breathing and consciousness. It's usually due to a problem with the heart's electrical system. Sudden cardiac arrest is a medical emergency. If not treated immediately, it results in sudden cardiac death.",
                            style: TextStyle(fontSize: 15, height: 1.2),
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
                    height: 8,
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    child: const Text(
                      "The same lifestyle changes used to manage heart disease may also help prevent it. Try these heart-healthy tips:",
                      style: TextStyle(fontSize: 15, height: 1.2),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "- Don't smoke.",
                            style: TextStyle(fontSize: 15, height: 1.2),
                          ),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "- Eat a diet that's low in salt and saturated fat.",
                            style: TextStyle(fontSize: 15, height: 1.2),
                          ),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "- Exercise at least 30 minutes a day on most days of the week.",
                            style: TextStyle(fontSize: 15, height: 1.2),
                          ),
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "- Maintain a healthy weight.",
                            style: TextStyle(fontSize: 15, height: 1.2),
                          ),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "- Reduce and manage stress.",
                            style: TextStyle(fontSize: 15, height: 1.2),
                          ),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "- Control high blood pressure, high cholesterol and diabetes.",
                            style: TextStyle(fontSize: 15, height: 1.2),
                          ),
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "- Get good sleep. Adults should aim for 7 to 9 hours daily.",
                            style: TextStyle(fontSize: 15, height: 1.2),
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
