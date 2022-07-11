import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:http/http.dart' as https;
import 'package:http/http.dart';
import 'package:linkify/linkify.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:working_with_api/top_level_data.dart';
import 'package:working_with_api/user_data.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<UserData> getUserData() async {
    try {
      Response response =
          await https.get(Uri.parse("https://api.agify.io/?name=bella"));
      if (response.statusCode == 200) {
        UserData userData = UserData.fromJson(jsonDecode(response.body));
        print(userData.name);
        return userData;
      } else {
        throw Exception();
      }
    } catch (e) {
      print(e.toString());
      throw Exception(e);
    }
  }

  Future<TopLevelData> getMemes() async {
    try {
      Response response =
          await https.get(Uri.parse("https://api.imgflip.com/get_memes"));
      if (response.statusCode == 200) {
        TopLevelData topLevelData =
            TopLevelData.fromJson(jsonDecode(response.body));
        return topLevelData;
      } else {
        throw Exception();
      }
    } catch (e) {
      print(e.toString());
      throw Exception(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return
        //   Scaffold(
        //   appBar: AppBar(
        //     title: Text("Linkify"),
        //   ),
        //   body: Container(
        //     child: Center(
        //         child: Linkify(
        //       text: "Made by https://cretezy.com",
        //       options: LinkifyOptions(humanize: true),
        //       onOpen: (link) async {
        //         await launchUrl(Uri.parse(link.url));
        //       },
        //     )),
        //   ),
        // );

        Scaffold(
      appBar: AppBar(
        title: Text("Working with API"),
      ),
      body: FutureBuilder<TopLevelData>(
        future: getMemes(),
        builder: (BuildContext context, AsyncSnapshot<TopLevelData> snapshot) {
          if (snapshot.hasData) {
            var memes = snapshot.data!.data.memes;
            return ListView(
              children: List.generate(memes.length, (currentIndex) {
                return Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          spreadRadius: 6,
                          blurRadius: 5,
                          offset: Offset(1, 3),
                          color: Colors.grey.shade300,
                        ),
                      ]),
                  child: Column(
                    children: [
                      SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 400,
                          child: Image.network(memes[currentIndex].url)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "ID",
                          ),
                          Text(
                            memes[currentIndex].id,
                          )
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Name"
                          ),
                          Text(
                              memes[currentIndex].name
                          )
                        ],
                      )
                    ],
                  ),
                );
              }),
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
