class CastModel {
  final String name;
  final String image;
  final String caracter;

  CastModel({required this.name, required this.image, required this.caracter});

  factory CastModel.fromJson(Map<String, dynamic> json) {
    return CastModel(
      name: json['original_name'] ?? '',
      image: 'https://image.tmdb.org/t/p/w500/${json['profile_path']}',
      caracter: json['character'] ?? '',
    );
  }
}
