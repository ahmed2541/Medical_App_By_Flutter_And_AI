// import 'package:flutter/material.dart';
// import 'package:medicalappsproject/home/home_screen.dart';

// import '../models/model_home.dart';

// class HomeScreen2 extends StatelessWidget {
//   List<DetectionModel> detection = [
//     DetectionModel(name: 'Bine Fracture Detection', image: 'arm+pain.jpeg'),
//     DetectionModel(name: 'Leg Detection', image: 'leg1.jpg'),
//     DetectionModel(name: 'Brain Tomour Detection', image: 'images.jpg'),
//     DetectionModel(name: 'Pneumnia Detection', image: 'images.jpg'),
//     DetectionModel(name: 'Alzeimer Detection', image: 'images.jpg'),
//     DetectionModel(name: 'Hert Disease Detection', image: 'images.jpg'),
//     DetectionModel(name: 'Alzeimer Detection', image: 'images.jpg'),
//   ];
  
//   List<String> names_Diseases = [
//     'Bine Fracture Detection',
//     'Leg Detection',
//     'Brain Tomour Detection',
//     'Alzeimer Detection',
//     'Alzeimer Detection'
//   ];

//   void _navigateToDetection(BuildContext context, String name) {
//     int index = names_Diseases.indexOf(name);
//     if (index != -1) {
//       String routeName = index == 0
//           ? '/bineFractureDetection'
//           : index == 1
//               ? '/legDetection'
//               : index == 2
//                   ? '/brainTomourDetection'
//                   : index == 3
//                       ? '/alzeimerDetection'
//                       : index == 4
//                           ? '/hertDiseaseDetection'
//                           : '/unknownScreen';
//       Navigator.pushNamed(context, routeName);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Home Screen'),
//       ),
//       body: ListView.builder(
//         itemCount: detection.length,
//         itemBuilder: (context, index) {
//           return GestureDetector(
//             onTap: () {
//               _navigateToDetection(context, detection[index].name);
//             },
//             child: Card(
//               child: Column(
//                 children: [
//                   Image.asset('assets/${detection[index].image}'),
//                   Text(detection[index].name),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }