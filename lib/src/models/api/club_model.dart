class FootBalClubModel {
  FootBalClubModel({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  int count;
  String next;
  String previous;
  List<ClubResult> results;

  factory FootBalClubModel.fromJson(Map<String, dynamic> json) =>
      FootBalClubModel(
        count: json["count"] ?? 0,
        next: json["next"] ?? "",
        previous: json["previous"] ?? "",
        results:
        List<ClubResult>.from(json["results"].map((x) => ClubResult.fromJson(x))),
      );
}

class ClubResult {
  ClubResult({
    required this.id,
    required this.name,
    required this.image,
  });

  int id;
  String name;
  String image;

  factory ClubResult.fromJson(Map<String, dynamic> json) => ClubResult(
    id: json["id"] ?? 0,
    name: json["name"] ?? "",
    image: json["image"] ?? "",
  );
}