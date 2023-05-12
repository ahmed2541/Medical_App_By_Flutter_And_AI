import 'dart:io';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';

class DetectionResult extends StatefulWidget {
  final String result;
  final File image;
  DetectionResult({
    Key? key,
    required this.result,
    required this.image,
  }) : super(key: key);
  
  @override
  State<DetectionResult> createState() => _DetectionResultState();
}

class _DetectionResultState extends State<DetectionResult> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    
    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        _isLoading = false;
      });
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
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
        ),
      ),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: _isLoading
                  ? Center(
                      child: CircularProgressIndicator(color: Colors.blue,)
                    )
                  : Container(),
            ),
            Visibility(
              visible: !_isLoading,
              child: widget.image == null
                  ? const Text('')
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
                                image: DecorationImage(
                                    image: FileImage(widget.image))),
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
                              'Your Result :\n ${widget.result}',
                              style: const TextStyle(
                                  fontSize: 24, color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }
}