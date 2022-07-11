import 'package:working_with_api/zoom_lesson/story_entity/results.dart';

class TopLevel {
  TopLevel({
    required this.status,
    required this.results,
  });

  final String status;
  final List<Results> results;

  factory TopLevel.fromJson(Map<String, dynamic> json) {
    return TopLevel(
      status: json["status"] as String? ?? "",
      results: (json["results"] as List)
          .map((item) => Results.fromJson(item))
          .toList(),
    );
  }
}
