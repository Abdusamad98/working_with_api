import 'package:working_with_api/zoom_lesson/story_entity/multimedia.dart';
//https://api.nytimes.com/svc/topstories/v2/arts.json?api-key=mD46rKtYMNXAYpzZSyvAXK3u2ANtQd4A
class Results {
  Results({
    required this.section,
    required this.desFacet,
    required this.geoFacet,
    required this.multimedia,
    required this.orgFacet,
    required this.perFacet,
  });

  final String section;
  final List<String> desFacet;
  final List<String> orgFacet;
  final List<String> perFacet;
  final List<String> geoFacet;
  final List<Multimedia> multimedia;

  factory Results.fromJson(Map<String, dynamic> json) {
    return Results(
      section: json["section"] as String? ?? "",
      desFacet: (json["des_facet"] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      geoFacet: (json["geo_facet"] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      multimedia: (json["multimedia"] as List)
          .map((item) => Multimedia.fromJson(item))
          .toList(),
      orgFacet: (json["org_facet"] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      perFacet: (json["per_facet"] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
    );
  }
}
