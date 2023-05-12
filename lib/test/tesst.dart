// import 'dart:async';
// import 'dart:io';
// import 'dart:typed_data';
// import 'dart:ui';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:tflite_flutter/tflite_flutter.dart';

// class MaskRCNNPage extends StatefulWidget {
//   @override
//   _MaskRCNNPageState createState() => _MaskRCNNPageState();
// }

// class _MaskRCNNPageState extends State<MaskRCNNPage> {
//   late File _image;
//   late List<dynamic> _recognitions;
//   late bool _busy;

//   final picker = ImagePicker();
//   late Interpreter _interpreter;
//   int _inputSize = 256;
//   late List<List<double>> _outputBoxes;
//   late List<List<double>> _outputClasses;
//   late List<double> _outputScores;
//   late List<List<double>> _outputMasks;

//   @override
//   void initState() {
//     super.initState();
//     _busy = true;
//     loadModel().then((value) {
//       setState(() {
//         _busy = false;
//       });
//     });
//   }

//   Future<void> loadModel() async {
//     try {
//       _interpreter = await Interpreter.fromAsset('assets/mask_rcnn.tflite');
//       var inputShape = _interpreter.getInputTensor(0).shape;
//       _inputSize = inputShape[1];
//       var outputShape1 = _interpreter.getOutputTensor(0).shape;
//       var outputShape2 = _interpreter.getOutputTensor(1).shape;
//       var outputShape3 = _interpreter.getOutputTensor(2).shape;
//       var outputShape4 = _interpreter.getOutputTensor(3).shape;
//       _outputBoxes = List.filled(
//           outputShape1[1] * outputShape1[2] * 100 * 4, List.filled(4, 0.0));
//       _outputClasses = List.filled(
//           outputShape2[1] * outputShape2[2] * 100 * 1, List.filled(1, 0.0));
//       _outputScores =
//           List.filled(outputShape3[1] * outputShape3[2] * 100 * 1, 0.0);
//       _outputMasks = List.filled(
//           outputShape4[1] * outputShape4[2] * 100 * 28 * 28,
//           List.filled(28 * 28, 0.0));
//     } catch (e) {
//       print('Failed to load model: $e');
//     }
//   }

//   Future<void> predictImage(File image) async {
//     if (_interpreter == null) return;
//     await predict(FileImage(image)).then((value) {
//       setState(() {
//         _recognitions = value!;
//       });
//     });
//   }

//   Future<List<dynamic>?> predict(ImageProvider image) async {
//     if (_interpreter == null) return null;

//     final height = _inputSize;
//     final width = _inputSize;
//     final bytes = await loadImage(image, width, height);
//     print('Loaded image bytes: ${bytes.length}');

//     _interpreter.run(bytes.buffer.asUint8List(), {
//       0: _outputBoxes,
//       1: _outputClasses,
//       2: _outputScores,
//       3: _outputMasks,
//     });

//     return getRecognitions(
//         _outputBoxes, _outputClasses, _outputScores, _outputMasks);
//   }


// Future<Uint8List?> loadImage(ImageProvider image, int width, int height) async {
//   final completer = Completer<Uint8List>();
//   final target = Size(width.toDouble(), height.toDouble());
//   final recorder = PictureRecorder();
//   final canvas = Canvas(recorder);
//   final paint = Paint();
//   paint.isAntiAlias = true;
//   paint.filterQuality = FilterQuality.high;
//   final resolvedImage = await image.resolve(ImageConfiguration.empty);
//   final inputSize = Size(
//     resolvedImage.image.width.toDouble(),
//     resolvedImage.image.height.toDouble(),
//   );
//   final src = Offset.zero & inputSize;
//   final dst = Offset.zero & target;
//   canvas.drawImageRect(
//     await resolvedImage.toPicture().toImage(
//           resolvedImage.image.width,
//           resolvedImage.image.height,
//         ),
//     src,
//     dst,
//     paint,
//   );
//   final picture = recorder.endRecording();
//   final img = await picture.toImage(width, height);
//   img.toByteData(format: ui.ImageByteFormat.png).then((data) {
//     completer.complete(data!.buffer.asUint8List());
//   });
//   return completer.future;
// }

//   List<dynamic> getRecognitions(
//       List<List<double>> boxes,
//       List<List<double>> classes,
//       List<double> scores,
//       List<List<double>> masks) {
//     List<dynamic> recognitions = [];
//     for (var i = 0; i < scores.length; i++) {
//       if (scores[i] < 0.5) {
//         continue;
//       }
//       final label = classes[i][0];
//       final confidence = scores[i];
//       final box = boxes[i];
//       final mask = masks[i];
//       final recognition = {
//         'label': label,
//         'confidence': confidence,
//         'box': box,
//         'mask': mask,
//       };
//       recognitions.add(recognition);
//     }
//     return recognitions;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Mask R-CNN Demo'),
//       ),
//       body: _busy
//           ? Center(
//               child: CircularProgressIndicator(),
//             )
//           : SingleChildScrollView(
//               child: Column(
//                 children: [
//                   SizedBox(
//                     height: 20,
//                   ),
//                   _image == null
//                       ? Container(
//                           height: 300,
//                           child: Center(
//                             child: Text('No image selected'),
//                           ),
//                         )
//                       : Container(
//                           height: 300,
//                           child: Image.file(
//                             _image,
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   ElevatedButton(
//                     onPressed: () async {
//                       final pickedFile =
//                           await picker.getImage(source: ImageSource.gallery);
//                       if (pickedFile != null) {
//                         setState(() {
//                           _image = File(pickedFile.path);
//                           _recognitions = null;
//                         });
//                         await predictImage(_image);
//                       }
//                     },
//                     child: Text('Select Image'),
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   _recognitions == null
//                       ? Container()
//                       : ListView.builder(
//                           shrinkWrap: true,
//                           physics: NeverScrollableScrollPhysics(),
//                           itemCount: _recognitions.length,
//                           itemBuilder: (BuildContext context, int index) {
//                             final recognition = _recognitions[index];
//                             return ListTile(
//                               title: Text(
//                                   '${recognition['label']} (${recognition['confidence'].toStringAsFixed(2)})'),
//                               subtitle: Text('box: ${recognition['box']}'),
//                             );
//                           },
//                         ),
//                 ],
//               ),
//             ),
//     );
//   }
// }
// // import 'package:flutter/material.dart';
// // import 'package:medicalappsproject/home/home_screen.dart';

// // import '../models/model_home.dart';

// // class HomeScreen2 extends StatelessWidget {
// //   List<DetectionModel> detection = [
// //     DetectionModel(name: 'Bine Fracture Detection', image: 'arm+pain.jpeg'),
// //     DetectionModel(name: 'Leg Detection', image: 'leg1.jpg'),
// //     DetectionModel(name: 'Brain Tomour Detection', image: 'images.jpg'),
// //     DetectionModel(name: 'Pneumnia Detection', image: 'images.jpg'),
// //     DetectionModel(name: 'Alzeimer Detection', image: 'images.jpg'),
// //     DetectionModel(name: 'Hert Disease Detection', image: 'images.jpg'),
// //     DetectionModel(name: 'Alzeimer Detection', image: 'images.jpg'),
// //   ];
  
// //   List<String> names_Diseases = [
// //     'Bine Fracture Detection',
// //     'Leg Detection',
// //     'Brain Tomour Detection',
// //     'Alzeimer Detection',
// //     'Alzeimer Detection'
// //   ];

// //   void _navigateToDetection(BuildContext context, String name) {
// //     int index = names_Diseases.indexOf(name);
// //     if (index != -1) {
// //       String routeName = index == 0
// //           ? '/bineFractureDetection'
// //           : index == 1
// //               ? '/legDetection'
// //               : index == 2
// //                   ? '/brainTomourDetection'
// //                   : index == 3
// //                       ? '/alzeimerDetection'
// //                       : index == 4
// //                           ? '/hertDiseaseDetection'
// //                           : '/unknownScreen';
// //       Navigator.pushNamed(context, routeName);
// //     }
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Home Screen'),
// //       ),
// //       body: ListView.builder(
// //         itemCount: detection.length,
// //         itemBuilder: (context, index) {
// //           return GestureDetector(
// //             onTap: () {
// //               _navigateToDetection(context, detection[index].name);
// //             },
// //             child: Card(
// //               child: Column(
// //                 children: [
// //                   Image.asset('assets/${detection[index].image}'),
// //                   Text(detection[index].name),
// //                 ],
// //               ),
// //             ),
// //           );
// //         },
// //       ),
// //     );
// //   }
// // }
