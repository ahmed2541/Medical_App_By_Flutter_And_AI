import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import '../home/home.dart';

class BrokenLeg extends StatefulWidget {
  @override
  State<BrokenLeg> createState() => _BrokenLegState();
}

class _BrokenLegState extends State<BrokenLeg> {
  final Uri _uri = Uri.parse(
      'https://www.mayoclinic.org/diseases-conditions/broken-leg/symptoms-causes/syc-20370412');

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
        onPressed: () => upoaldImage(ImageSource.camera),
        backgroundColor: const Color.fromARGB(255, 16, 31, 44).withOpacity(0.1),
        splashColor: const Color.fromARGB(255, 16, 31, 44),
        foregroundColor: Colors.white,
        child: const Icon(
          Icons.add_a_photo_outlined,
          size: 30,
        ),
      ),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            size: 30,
          ),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Home(),
                ));
          },
        ),
        title: const Center(
          child: Text(
            "Broken Leg",
            style: TextStyle(
                color: Color.fromARGB(255, 4, 34, 31),
                fontSize: 26,
                fontWeight: FontWeight.bold,
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
                      image: AssetImage("asserts/leg3.jpg"),
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
                      onPressed: () => upoaldImage(ImageSource.gallery),
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
                padding: const EdgeInsets.all(10),
                child: Column(children: const [
                  Text(
                    "A broken leg (leg fracture) is a break or crack in one of the bones in your leg. Common causes include falls, motor vehicle accidents and sports injuries.",
                    style: TextStyle(fontSize: 19, height: 1.2),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Treatment of a broken leg depends on the location and severity of the injury. A severely broken leg may require metal pins and plates to hold the fragments together. Less severe breaks may be treated with a cast or splint. In all cases, prompt diagnosis and treatment are critical to complete healing.",
                    style: TextStyle(fontSize: 18, height: 1.2),
                  ),
                ])),
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
                  "Symptoms",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                )
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              "-The thighbone (femur) is the strongest bone in the body. It is usually obvious when the thighbone is broken because it takes so much force to break. But a break in the shinbone (tibia) or in the bone that runs alongside the shinbone (fibula) may be less obvious.",
              style: TextStyle(
                fontSize: 17,
                letterSpacing: 1.4,
              ),
            ),
            const SizedBox(
              height: 13,
            ),
            Container(
              alignment: Alignment.topLeft,
              child: const Text(
                "Signs and symptoms of a broken leg may include:",
                style: TextStyle(
                    fontSize: 19, height: 1.2, fontWeight: FontWeight.w500),
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(10),
                child: Column(children: [
                  Container(
                    alignment: Alignment.topLeft,
                    child: const Text(
                      "1. Severe pain, which may worsen with movement\n2. Swelling\n3. Tenderness\n4. Bruising\n5. Obvious deformity or shortening of the affected leg\n6. Inability to walk",
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
                "- Toddlers or young children who break a leg may start limping or simply stop walking, even if they can't explain why",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
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
                  "When to see a doctor",
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
                      "- If you or your child has any signs or symptoms of a broken leg, seek care right away. Delays in diagnosis and treatment can result in problems later, including poor healing.",
                      style: TextStyle(
                        fontSize: 18,
                        height: 1.2,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    child: const Text(
                      "- Seek emergency medical attention for any leg fracture from a high-impact trauma, such as a car or motorcycle accident. Fractures of the thighbone are severe, potentially life-threatening injuries that require emergency medical services to help protect the area from further damage and to provide safe transfer to a local hospital.",
                      style: TextStyle(
                        fontSize: 18,
                        height: 1.2,
                      ),
                    ),
                  ),
                ])),
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
                  "Causes",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                )
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              alignment: Alignment.topLeft,
              child: const Text(
                "A broken leg can be caused by:",
                style: TextStyle(
                    fontSize: 18, height: 1.2, fontWeight: FontWeight.w500),
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
                      "1- Falls. A simple fall can fracture one or both lower leg bones. A much higher impact is usually needed to break the thighbone.",
                      style: TextStyle(fontSize: 17, height: 1.2),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    child: const Text(
                      "2- Motor vehicle accidents. All three leg bones can break during a motor vehicle accident. Fractures can occur when your knees become jammed against the dashboard during a collision or with damage to the car hitting your legs.",
                      style: TextStyle(fontSize: 17, height: 1.2),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    child: const Text(
                      "3-Sports injuries. Extending your leg beyond its natural limits during contact sports can cause a broken leg. So can a fall or a direct blow — such as from a hockey stick or an opponent's body.",
                      style: TextStyle(fontSize: 17, height: 1.2),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    child: const Text(
                      "4-Child abuse. In children, a broken leg may be the result of child abuse, especially when such an injury occurs before the child can walk.",
                      style: TextStyle(fontSize: 17, height: 1.2),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    child: const Text(
                      "5-Overuse. Stress fractures are tiny cracks that develop in the weight-bearing bones of the body, including the shinbone. Stress fractures are usually caused by repetitive force or overuse, such as running long distances. But they can occur with regular use of a bone that's been weakened by a condition such as osteoporosis.",
                      style: TextStyle(fontSize: 17, height: 1.2),
                    ),
                  ),
                ])),
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
                  "Risk factors",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                )
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              alignment: Alignment.topLeft,
              child: const Text(
                "Stress fractures are often the result of repetitive stress to the leg bones from physical activities, such as:",
                style: TextStyle(
                    fontSize: 20, height: 1.2, fontWeight: FontWeight.w500),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                alignment: Alignment.topLeft,
                child: const Text(
                  "* Running\n* Ballet dancing\n* Basketball\n* Marching",
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
                "Contact sports, such as hockey and football, also may pose a risk of direct blows to the leg, which can result in a fracture.",
                style: TextStyle(
                    fontSize: 20, height: 1.2, fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              alignment: Alignment.topLeft,
              child: const Text(
                "Stress fractures outside of sport situations are more common in people who have:",
                style: TextStyle(
                    fontSize: 20, height: 1.2, fontWeight: FontWeight.w500),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                alignment: Alignment.topLeft,
                child: const Text(
                  "* Decreased bone density (osteoporosis)\n* Diabetes\n* Rheumatoid arthritis",
                  style: TextStyle(
                    fontSize: 20,
                    height: 1.4,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
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
                  "Complications",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
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
                      "1- Knee or ankle pain. A broken bone in your leg may produce pain in your knee or ankle",
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w400,
                          height: 1.2),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    child: const Text(
                      "2- Bone infection (osteomyelitis). If a broken bone cuts through the skin and causes a wound, it is called an open fracture. If you have an open fracture, the bone may be exposed to germs that can cause infection.",
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w400,
                          height: 1.2),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    child: const Text(
                      "3- Poor or delayed healing. A severe leg fracture may not heal quickly or completely. This is particularly common in an open fracture of the tibia because of lower blood flow to this bone",
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w400,
                          height: 1.2),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    child: const Text(
                      "4- Nerve or blood vessel damage. Leg fractures can injure nearby nerves and blood vessels. Seek immediate medical help if you notice any numbness, pale skin or circulation problems.",
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w400,
                          height: 1.2),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    child: const Text(
                      "5- Compartment syndrome. This condition causes pain, swelling and sometimes disability in muscles near the broken bone. This is a rare complication that is more common with high-impact injuries, such as a car or motorcycle accident.",
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w400,
                          height: 1.2),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    child: const Text(
                      "6- Arthritis. Fractures that extend into the joint and poor bone alignment can cause osteoarthritis years later. If your leg starts to hurt long after a break, see your health care provider for an evaluation.",
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w400,
                          height: 1.2),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    child: const Text(
                      "7- Unequal leg length. The long bones of a child grow from the ends of the bones, in softer areas called growth plates. If a fracture goes through a growth plate, that limb might eventually become shorter or longer than the opposite limb.",
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w400,
                          height: 1.2),
                    ),
                  ),
                ],
              ),
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
                  "Prevention",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              alignment: Alignment.topLeft,
              child: const Text(
                "A broken leg can't always be prevented. But these basic tips may reduce your risk:",
                style: TextStyle(
                    fontSize: 18, height: 1.2, fontWeight: FontWeight.w500),
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(10),
                child: Column(children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    child: const Text(
                      "1- Build bone strength. Calcium-rich foods, such as milk, yogurt and cheese, can help build strong bones. A calcium or vitamin D supplement also may improve bone strength. Ask your health care provider if these supplements are right for you.",
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w400,
                          height: 1.2),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    child: const Text(
                      "2- Wear proper athletic shoes. Choose the appropriate shoe for your favorite sports or activities. And replace athletic shoes regularly. Discard sneakers as soon as the tread or heel wears out or if the shoes are wearing unevenly.",
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w400,
                          height: 1.2),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    child: const Text(
                      "3- Cross-train. Alternating activities can prevent stress fractures. Rotate running with swimming or biking. If you run on a sloped track indoors, alternate the direction of your running to even out the stress on your skeleton.",
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w400,
                          height: 1.2),
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
                ])),
          ]),
        ),
      ),
    );
  }
}
