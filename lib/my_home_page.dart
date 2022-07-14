import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';

import 'package:linkify/linkify.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:working_with_api/models/fourth/my_top_level_data.dart';
import 'package:working_with_api/models/second/top_level_data.dart';
import 'package:working_with_api/models/first/user_data.dart';
import 'package:working_with_api/models/third/story_entity/top_level.dart';
import 'package:working_with_api/repository/repository.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Working with API Example 3"),
      ),
      body: FutureBuilder<MyTopLevelData>(
        future: Repository.getMyTopLevelData(),
        builder: (BuildContext context, AsyncSnapshot<MyTopLevelData> snapshot) {
          if (snapshot.hasData) {
            var data = snapshot.data!;// TopLevel
            return Container(
              margin: EdgeInsets.all(16),
              child: Center(
                child: Text(data.myMetadata.identifier),
              )
            );
          } else if (snapshot.hasError) {
            return Center(child: Text("Error ocurred"));
          } else {
            return Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        },
      ),
    );
  }
}
