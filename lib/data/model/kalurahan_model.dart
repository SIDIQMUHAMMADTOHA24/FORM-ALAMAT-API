// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

List<Kalurahan> kalurahanFromJson(String str) =>
    List<Kalurahan>.from(json.decode(str).map((x) => Kalurahan.fromJson(x)));

String kalurahanToJson(List<Kalurahan> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Kalurahan {
  String id;
  String districtId;
  String name;

  Kalurahan({
    required this.id,
    required this.districtId,
    required this.name,
  });

  Kalurahan copyWith({
    String? id,
    String? districtId,
    String? name,
  }) =>
      Kalurahan(
        id: id ?? this.id,
        districtId: districtId ?? this.districtId,
        name: name ?? this.name,
      );

  factory Kalurahan.fromJson(Map<String, dynamic> json) => Kalurahan(
        id: json["id"],
        districtId: json["district_id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "district_id": districtId,
        "name": name,
      };

  @override
  String toString() =>
      'Kalurahan(id: $id, districtId: $districtId, name: $name)';
}
