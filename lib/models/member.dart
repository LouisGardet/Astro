// lib/models/member.dart
class Member {
  final int id;
  final String name;
  final String email;
  final String phone;
  final DateTime joinDate;

  Member({required this.id, required this.name, required this.email, required this.phone, required this.joinDate});

  factory Member.fromJson(Map<String, dynamic> json) {
    return Member(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      joinDate: DateTime.parse(json['joinDate']),
    );
  }
}
