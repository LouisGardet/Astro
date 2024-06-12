// lib/models/event.dart
class Event {
  final int id;
  final String title;
  final String date;
  final String location;

  Event({required this.id, required this.title, required this.date, required this.location});

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      id: json['id'],
      title: json['title'],
      date: json['date'],
      location: json['location'],
    );
  }
}
