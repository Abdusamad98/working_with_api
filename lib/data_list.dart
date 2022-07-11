import 'package:working_with_api/memes.dart';

class DataList {
  DataList({required this.memes});
  final List<Memes> memes;

  factory DataList.fromJson(Map<String, dynamic> json){
    var jsonData = json["memes"] as List;
    List<Memes> memes = jsonData.map((item) => Memes.fromJson(item)).toList();
    return DataList(memes: memes);
  }
}
