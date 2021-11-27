import 'dart:convert';

PitchesModel pitchesModelFromJson(String str) =>
    PitchesModel.fromJson(json.decode(str));

class PitchesModel {
  PitchesModel({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  int count;
  String next;
  String previous;
  List<PitchesResult> results;

  factory PitchesModel.fromJson(Map<String, dynamic> json) => PitchesModel(
        count: json["count"] ?? 0,
        next: json["next"] ?? "",
        previous: json["previous"] ?? "",
        results: json["results"] == null
            ? <PitchesResult>[]
            : List<PitchesResult>.from(
                json["results"].map((x) => PitchesResult.fromJson(x)),
              ),
      );
}

class PitchesResult {
  PitchesResult({
    required this.name,
    required this.image,
    required this.price,
    required this.contact,
    required this.status,
    required this.email,
    required this.reviewAvg,
    required this.point,
    required this.latitude,
    required this.longitude,
    required this.city,
    required this.region,
    required this.orientr,
  });

  String name;
  List<String> image;
  List<Price> price;
  List<Contact> contact;
  bool status;
  String email;
  double reviewAvg;
  double point;
  double latitude;
  double longitude;
  City city;
  City region;
  List<Orientr> orientr;

  factory PitchesResult.fromJson(Map<String, dynamic> json) => PitchesResult(
        name: json["name"] ?? "",
        image: json["Image"] == null
            ? <String>[]
            : List<String>.from(json["Image"].map((x) => x)),
        price: json["Price"] == null
            ? <Price>[]
            : List<Price>.from(
                json["Price"].map((x) => Price.fromJson(x)),
              ),
        contact: json["Contact"] == null
            ? <Contact>[]
            : List<Contact>.from(
                json["Contact"].map((x) => Contact.fromJson(x)),
              ),
        status: json["status"] ?? false,
        email: json["email"] ?? "",
        reviewAvg: json["review_avg"] ?? 0.0,
        point: json["point"] ?? 0.0,
        latitude: json["latitude"] ?? 0.0,
        longitude: json["longitude"] ?? 0.0,
        city: json["city"] == null
            ? City.fromJson({})
            : City.fromJson(json["city"]),
        region: json["region"] == null
            ? City.fromJson({})
            : City.fromJson(json["region"]),
        orientr: json["Orientr"] == null
            ? <Orientr>[]
            : List<Orientr>.from(
                json["Orientr"].map((x) => Orientr.fromJson(x)),
              ),
      );
}

class City {
  City({
    required this.id,
    required this.name,
  });

  int id;
  String name;

  factory City.fromJson(Map<String, dynamic> json) => City(
        id: json["id"] ?? 0,
        name: json["name"] ?? "",
      );
}

class Contact {
  Contact({
    required this.id,
    required this.phone,
  });

  int id;
  String phone;

  factory Contact.fromJson(Map<String, dynamic> json) => Contact(
        id: json["id"] ?? 0,
        phone: json["phone"] ?? "",
      );
}

class Orientr {
  Orientr({
    required this.id,
    required this.address,
    required this.orientr,
  });

  int id;
  String address;
  String orientr;

  factory Orientr.fromJson(Map<String, dynamic> json) => Orientr(
        id: json["id"] ?? 0,
        address: json["address"] ?? "",
        orientr: json["orientr"] ?? "",
      );
}

class Price {
  Price({
    required this.id,
    required this.hour,
    required this.price,
  });

  int id;
  int hour;
  int price;

  factory Price.fromJson(Map<String, dynamic> json) => Price(
        id: json["id"] ?? 0,
        hour: json["hour"] ?? 0,
        price: json["price"] ?? 0,
      );
}
