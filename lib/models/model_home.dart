import 'package:flutter/material.dart';

class DetectionModel {
  final String name;
  final String image;
  final Widget page;

  DetectionModel({
    required this.name,
    required this.image,
    required this.page,
  });
}

class DataSearch extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            close(context, null);
          },
          icon: Icon(Icons.close))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Text('');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Center(child: Text('Searching...'));
  }
}
