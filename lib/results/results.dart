import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class DetectionResult extends StatelessWidget {
  final String result;
  final File image;

  DetectionResult({
    Key? key,
    required this.result,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(
              Icons.arrow_back_ios_sharp,
              size: 30,
            ),
          ),
          backgroundColor: const Color.fromARGB(255, 3, 75, 111),
          title: const Center(
            child: Text('Detection Lab',
                style: TextStyle(
                    fontSize: 29,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(218, 255, 255, 255))),
          )),
      body: SingleChildScrollView(
        child: image == null
            ? Text('')
            : Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 400,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 2, 71, 61),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(),
                          image: DecorationImage(image: FileImage(image))),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color.fromARGB(255, 3, 75, 111),
                      ),
                      child: Text(
                        'Your Result :\n $result',
                        style:
                            const TextStyle(fontSize: 24, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
