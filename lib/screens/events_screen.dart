import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../models/event.dart';

class EventsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Événements'),
      ),
      body: FutureBuilder<List<Event>>(
        future: ApiService().fetchEvents(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erreur: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('Aucun événement disponible'));
          } else {
            return ListView(
              children: snapshot.data!.map((event) {
                return ListTile(
                  title: Text(event.title),
                  subtitle: Text('${event.date} - ${event.location}'),
                );
              }).toList(),
            );
          }
        },
      ),
    );
  }
}
