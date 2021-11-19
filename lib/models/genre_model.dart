import 'dart:convert';

class GenreModel {
  final int id;
  final String name;

  GenreModel({
    required this.id,
    required this.name,
  });

  @override
  String toString() => 'GenreModel(id: $id, name: $name)';

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }

  factory GenreModel.fromJson(Map<String, dynamic> map) {
    return GenreModel(
      id: map['id'],
      name: map['name'],
    );
  }

  String toJson() => json.encode(toMap());

 
}
