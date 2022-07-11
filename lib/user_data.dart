class UserData {
  UserData({required this.count, required this.age, required this.name});

  final String name;
  final int age;
  final int count;


  factory UserData.fromJson(Map<String, Object?> json) => UserData(
        name: json["name"] as String? ?? "",
        age: json["age"] as int? ?? 0,
        count: json["count"] as int? ?? 0,
      );
}

//
// import 'dart:convert';
// main() {
//   String arrayObjsText =
//       '{"tags": [{"name": "dart", "quantity": 12}, {"name": "flutter", "quantity": 25}, {"name": "json", "quantity": 8}]}';
//   var tagObjsJson = jsonDecode(arrayObjsText)['tags'] as List;
//   List<Tag> tagObjs = tagObjsJson.map((tagJson) => Tag.fromJson(tagJson)).toList();
//   print(tagObjs);
// }