import 'dart:io';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
  bool _showMessg = true;
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2));
    //   Fluttertoast.showToast(
    //   msg: "Sorry, if the result doesn\'t appear from the first time ,go back and try again ",
    //   toastLength: Toast.LENGTH_SHORT,
    //   gravity: ToastGravity.CENTER,
    //   timeInSecForIosWeb: 3,
    //   backgroundColor: Colors.grey,
    //   textColor: Colors.white,
    //   fontSize: 18.0,
    // );
    setState(() {
      _showMessg = false;
    });

    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        _isLoading = false;
      });
    });
  }

  void reloadPage() {
    setState(() {
      _isLoading = true;
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
        title: Center(
          child: Text('Detection Lab',
              style: TextStyle(
                  fontSize: 29,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(218, 255, 255, 255))),
        ),
        actions: [
          IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  dismissDirection: DismissDirection.horizontal,
                  behavior: SnackBarBehavior.floating,
                  duration: const Duration(seconds: 2),
                  backgroundColor: Color.fromARGB(217, 3, 3, 4),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  margin: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.height * 0.1,
                    right: 100,
                    left: 100,
                  ),
                  content: Container(
                    height: 25,
                    child: Center(
                      child: Text(
                        textAlign: TextAlign.center,
                        'Under Test ...',
                        style: TextStyle(
                            fontSize: 20,
                            wordSpacing: 1,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
              );
            },
            icon: Icon(Icons.refresh),
          ),
        ],
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
                      child: CircularProgressIndicator(
                      color: Colors.blue,
                    ))
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
                          padding: const EdgeInsets.all(3.0),
                          child: Container(
                            height: 400,
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      offset: Offset(1, 6))
                                ],
                                gradient: LinearGradient(colors: [
                                  Color.fromARGB(255, 2, 46, 71),
                                  Color.fromARGB(255, 136, 164, 187),
                                  Color.fromARGB(255, 83, 165, 203)
                                ]),
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    image: FileImage(widget.image),
                                    alignment: Alignment.center)),
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
                                gradient: LinearGradient(colors: [
                                  Colors.blue,
                                  Colors.lightBlue,
                                  Color.fromARGB(255, 18, 103, 142)
                                ])),
                            child: Text(
                              'Your Result :\n ${widget.result}',
                              style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.white,
                                  shadows: [
                                    BoxShadow(
                                        color: Colors.black,
                                        blurRadius: 2,
                                        offset: Offset(1, 2))
                                  ]),
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
