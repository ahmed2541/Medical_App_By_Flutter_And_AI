import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 3, 75, 111),
        title: Text(
          "Setting",
          style: TextStyle(fontSize: 22),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            ListTile(
              leading: Icon(
                Icons.text_snippet_outlined,
                size: 29,
                color: Color.fromARGB(255, 176, 84, 84),
              ),
              title: Text(
                "Refrences",
                style: TextStyle(fontSize: 25, color: Colors.blue),
              ),
              onTap: () {},
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 8.0),
              child: Divider(
                height: 15,
                thickness: 1,
                color: Colors.grey[400],
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.language,
                size: 29,
                color: Colors.redAccent,
              ),
              title: Text(
                "Language",
                style: TextStyle(fontSize: 25, color: Colors.blue),
              ),
              onTap: () {},
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 8.0),
              child: Divider(
                height: 15,
                thickness: 1,
                color: Colors.grey[400],
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.border_color_outlined,
                size: 29,
                color: Color.fromARGB(255, 182, 18, 18),
              ),
              title: Text(
                "Theme",
                style: TextStyle(fontSize: 25, color: Colors.blue),
              ),
              onTap: () {},
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 8.0),
              child: Divider(
                height: 15,
                thickness: 1,
                color: Colors.grey[400],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
