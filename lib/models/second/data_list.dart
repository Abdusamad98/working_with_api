import 'package:working_with_api/models/second/memes.dart';

class DataList {
  DataList({required this.memes});

  final List<Memes> memes;

  factory DataList.fromJson(Map<String, dynamic> json) {
    return DataList(
        memes: (json["memes"] as List?)
                ?.map((item) => Memes.fromJson(item))
                .toList() ??
            []);
  }
}
