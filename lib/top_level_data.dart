import 'package:working_with_api/data_list.dart';
import 'package:working_with_api/memes.dart';

//https://api.imgflip.com/get_memes

class TopLevelData {
  TopLevelData({
    required this.status,
    required this.data,
  });

  final DataList data;
  final bool status;

  factory TopLevelData.fromJson(Map<String, dynamic> json) {
    var jsonData = json["data"]["memes"] as List;
    List<Memes> memes = jsonData.map((item) => Memes.fromJson(item)).toList();

    return TopLevelData(
      status: json["success"] as bool? ?? false,
      data: DataList(memes: memes),
    );
  }
}
