// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

List<Provinsi> provinsiFromJson(String str) =>
    List<Provinsi>.from(json.decode(str).map((x) => Provinsi.fromJson(x)));

String provinsiToJson(List<Provinsi> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Provinsi {
  String id;
  String name;

  Provinsi({
    required this.id,
    required this.name,
  });

  Provinsi copyWith({
    String? id,
    String? name,
  }) =>
      Provinsi(
        id: id ?? this.id,
        name: name ?? this.name,
      );

  factory Provinsi.fromJson(Map<String, dynamic> json) => Provinsi(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };

  @override
  String toString() => 'Provinsi(id: $id, name: $name)';
}
