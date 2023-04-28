import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Chat extends StatefulWidget {
  const Chat({super.key});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 3, 75, 111),
        title: const Center(
          child: Text(
            "MedicalBot",
            style: TextStyle(
                fontSize: 28, color: Colors.white, fontWeight: FontWeight.w500,letterSpacing: 1),
          ),
        ),
      ),
      body: Container(
        child: const Center(
          child: Text(
            "COMING SOON...",
            style: TextStyle(
                  fontSize: 30, color: Color.fromARGB(255, 43, 3, 3), fontWeight: FontWeight.bold,letterSpacing: 2
            ),
          ),
        ),
      ),
    );
  }
}
