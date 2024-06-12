// lib/models/photo.dart
class Photo {
  final int id;
  final String url;
  final String description;

  Photo({required this.id, required this.url, required this.description});

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      id: json['id'],
      url: json['url'],
      description: json['description'],
    );
  }
}
