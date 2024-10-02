class SourcesModel {
  final String status;
  final List<Source> sources;

  SourcesModel({required this.status, required this.sources});

  factory SourcesModel.fromJson(Map<String, dynamic> json) => SourcesModel(
        status: json["status"],
        // sources: json["sources"],//cant work cuz type is diff
        // first way
        sources: List.from(json["sources"]).map(
          (element) {
            return Source.fromJson(element);
          },
        ).toList(),
      );
}

class Source {
  final String id;
  final String name;

  // final String description;
  Source({
    required this.id,
    required this.name,
  });

  // to create object from Sourse
  factory Source.fromJson(Map<String, dynamic> json) => Source(
        id: json["id"],
        name: json["name"],
      );
}
