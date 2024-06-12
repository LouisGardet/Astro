import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/photo.dart';
import '../models/event.dart';
import '../models/member.dart';
import '../models/registration.dart';

class ApiService {
  static const String baseUrl = 'http://localhost:3001'; // Utilise localhost pour les émulateurs iOS

  Future<void> registerMember(Registration registration) async {
    final response = await http.post(
      Uri.parse('$baseUrl/register'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(registration.toJson()),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to register member');
    }
  }

  Future<List<Photo>> fetchPhotos() async {
    try {
      print('Fetching photos from $baseUrl/api/photos');
      final response = await http.get(Uri.parse('$baseUrl/api/photos'));
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      if (response.statusCode == 200) {
        List jsonResponse = json.decode(response.body);
        return jsonResponse.map((photo) => Photo.fromJson(photo)).toList();
      } else {
        print('Failed to load photos - Status Code: ${response.statusCode}');
        throw Exception('Failed to load photos');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Failed to load photos');
    }
  }

  Future<List<Event>> fetchEvents() async {
    try {
      print('Fetching events from $baseUrl/api/events');
      final response = await http.get(Uri.parse('$baseUrl/api/events'));
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      if (response.statusCode == 200) {
        List jsonResponse = json.decode(response.body);
        return jsonResponse.map((event) => Event.fromJson(event)).toList();
      } else {
        print('Failed to load events - Status Code: ${response.statusCode}');
        throw Exception('Failed to load events');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Failed to load events');
    }
  }

  Future<Member> fetchMemberDetails(int memberId) async {
    final response = await http.get(Uri.parse('$baseUrl/members/$memberId'));
    if (response.statusCode == 200) {
      return Member.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load member details');
    }
  }
}
