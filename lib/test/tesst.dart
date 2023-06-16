// // // // import 'dart:io';
// // // // import 'package:flutter_spinkit/flutter_spinkit.dart';
// // // // import 'package:flutter/material.dart';

// // // // class DetectionResult extends StatefulWidget {
// // // //   String result;
// // // //   File? image;

// // // //   DetectionResult({
// // // //     Key? key,
// // // //     required this.result,
// // // //     required this.image,
// // // //   }) : super(key: key);

// // // //   @override
// // // //   State<DetectionResult> createState() => _DetectionResultState();
// // // // }

// // // // class _DetectionResultState extends State<DetectionResult> {
// // // //   bool _isLoading = true;

// // // //   @override
// // // //   void initState() {
// // // //     super.initState();

// // // //     Future.delayed(Duration(seconds: 2), () {
// // // //       setState(() {
// // // //         _isLoading = false;
// // // //       });
// // // //     });
// // // //   }

// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return Scaffold(
// // // //       appBar: AppBar(
// // // //         leading: IconButton(
// // // //           onPressed: () => Navigator.pop(context),
// // // //           icon: const Icon(
// // // //             Icons.arrow_back_ios_sharp,
// // // //             size: 30,
// // // //           ),
// // // //         ),
// // // //         backgroundColor: const Color.fromARGB(255, 3, 75, 111),
// // // //         title: const Center(
// // // //           child: Text(
// // // //             'Detection Lab',
// // // //             style: TextStyle(
// // // //               fontSize: 29,
// // // //               fontWeight: FontWeight.bold,
// // // //               color: Color.fromARGB(218, 255, 255, 255),
// // // //             ),
// // // //           ),
// // // //         ),
// // // //       ),
// // // //       body: _isLoading
// // // //           ? Center(
// // // //               child: CircularProgressIndicator(color: Colors.blue),
// // // //             )
// // // //           : SingleChildScrollView(
// // // //               physics: const AlwaysScrollableScrollPhysics(),
// // // //               child: Column(
// // // //                 children: [
// // // //                   const SizedBox(height: 20),
// // // //                   if (widget.image != null)
// // // //                     Padding(
// // // //                       padding: const EdgeInsets.all(8.0),
// // // //                       child: Container(
// // // //                         height: 400,
// // // //                         decoration: BoxDecoration(
// // // //                           color: const Color.fromARGB(255, 2, 71, 61),
// // // //                           borderRadius: BorderRadius.circular(10),
// // // //                           border: Border.all(),
// // // //                           image: DecorationImage(
// // // //                             image: FileImage(widget.image!),
// // // //                           ),
// // // //                         ),
// // // //                       ),
// // // //                     ),
// // // //                   const SizedBox(height: 10),
// // // //                   Padding(
// // // //                     padding: const EdgeInsets.all(8.0),
// // // //                     child: Container(
// // // //                       width: double.infinity,
// // // //                       padding: const EdgeInsets.all(10),
// // // //                       decoration: BoxDecoration(
// // // //                         borderRadius: BorderRadius.circular(20),
// // // //                         color: const Color.fromARGB(255, 3, 75, 111),
// // // //                       ),
// // // //                       child: Text(
// // // //                         'Your Result :\n ${widget.result}',
// // // //                         style: const TextStyle(
// // // //                           fontSize: 24,
// // // //                           color: Colors.white,
// // // //                         ),
// // // //                       ),
// // // //                     ),
// // // //                   ),
// // // //                   const SizedBox(height: 20),
// // // //                   Row(
// // // //                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// // // //                     children: [
// // // //                       ElevatedButton(
// // // //                         onPressed: () {
// // // //                           Navigator.pop(context, widget.image);
// // // //                         },
// // // //                         child: const Text('Confirm'),
// // // //                       ),
// // // //                       ElevatedButton(
// // // //                         onPressed: () {
// // // //                           setState(() {
// // // //                             widget.image = null;
// // // //                             widget.result = '';
// // // //                           });
// // // //                         },
// // // //                         child: const Text('Cancel'),
// // // //                       ),
// // // //                     ],
// // // //                   ),
// // // //                 ],
// // // //               ),
// // // //             ),
// // // //     );
// // // //   }
// // // // }

// // // import 'dart:io';
// // // import 'package:flutter/material.dart';
// // // import 'package:image_picker/image_picker.dart';
// // // import 'package:tflite/tflite.dart';

// // // class ImageClassificationPage extends StatefulWidget {
// // //   @override
// // //   _ImageClassificationPageState createState() =>
// // //       _ImageClassificationPageState();
// // // }

// // // class _ImageClassificationPageState extends State<ImageClassificationPage> {
// // //   bool _isLoading = true;
// // //   String _result = '';

// // //   @override
// // //   void initState() {
// // //     super.initState();
// // //     loadModel();
// // //   }

// // //   void loadModel() async {
// // //     String? output = await Tflite.loadModel(
// // //       model: 'assets/modules/model_brain_tumour.tflite',
// // //       labels: 'assets/modules/labels_brain_tumour.txt',
// // //     );
// // //     print(output);
// // //   }

// // //   void doImageClassification(File image) async {
// // //     var recognitions = await Tflite.runModelOnImage(
// // //       path: image.path,
// // //       numResults: 1,
// // //       threshold: 0.2,
// // //       imageMean: 127.5,
// // //       imageStd: 127.5,
// // //     );

// // //     setState(() {
// // //       _isLoading = false;
// // //       if (recognitions != null && recognitions.isNotEmpty) {
// // //         _result = recognitions.first['label'].toString();
// // //       } else {
// // //         _result = 'No results found';
// // //       }
// // //     });
// // //   }

// // //   void reloadPage() {
// // //     setState(() {
// // //       _isLoading = true;
// // //       _result = '';
// // //     });
// // //     doImageClassification(_image);
// // //   }

// // //   File _image = File('');
// // //   final picker = ImagePicker();
// // //   Future getImage() async {
// // //     var image = await picker.pickImage(source: ImageSource.gallery);

// // //     if (image != null) {
// // //       setState(() {
// // //         _isLoading = true;
// // //         _image = File(image.path);
// // //       });

// // //       doImageClassification(_image);
// // //     }
// // //   }

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       appBar: AppBar(
// // //         title: Text('Image Classification'),
// // //       ),
// // //       body: Center(
// // //         child: Column(
// // //           mainAxisAlignment: MainAxisAlignment.center,
// // //           children: [
// // //             _image != null
// // //                 ? Image.file(
// // //                     _image,
// // //                     height: 200,
// // //                   )
// // //                 : Container(),
// // //             SizedBox(height: 20),
// // //             _isLoading
// // //                 ? CircularProgressIndicator()
// // //                 : Column(
// // //                     children: [
// // //                       Text(
// // //                         'Result:',
// // //                         style: TextStyle(fontSize: 20),
// // //                       ),
// // //                       SizedBox(height: 10),
// // //                       Text(
// // //                         _result,
// // //                         style: TextStyle(fontSize: 16),
// // //                       ),
// // //                     ],
// // //                   ),
// // //             SizedBox(height: 20),
// // //             ElevatedButton(
// // //               onPressed: getImage,
// // //               child: Text('Select Image'),
// // //             ),
// // //             SizedBox(height: 20),
// // //             Visibility(
// // //               visible: !_isLoading && _result.isNotEmpty,
// // //               child: ElevatedButton(
// // //                 onPressed: reloadPage,
// // //                 child: Text('Reload Page'),
// // //               ),
// // //             ),
// // //           ],
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }

// // import 'package:flutter/material.dart';
// // import 'package:fluttertoast/fluttertoast.dart';

// // class Test extends StatefulWidget {
// //   const Test({super.key});

// //   @override
// //   State<Test> createState() => _TestState();
// // }

// // class _TestState extends State<Test> {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(),
// //       body: Conta,
// //     );
// //   }
// // }
// class DetectionResult extends StatelessWidget {
//   final File image;
//   final String result;

//   DetectionResult({required this.image, required this.result});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Detection Result'),
//       ),
//       body: FutureBuilder(
//         future: Future.delayed(Duration(seconds: 1)), // يتم استخدام Future.delayed هنا للانتظار لمدة ثانية واحدة كحد أدنى
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           } else {
//             return Column(
//               children: [
//                 Image.file(image),
//                 const SizedBox(height: 20),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Container(
//                     width: double.infinity,
//                     padding: const EdgeInsets.all(10),
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(20),
//                       color: const Color.fromARGB(255, 3, 75, 111),
//                     ),
//                     child: Text(
//                       'Your Result :\n ${result}',
//                       style: const TextStyle(
//                         fontSize: 24,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             );
//           }
//         },
//       ),
//     );
//   }
// }