import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/api_service.dart';
import '../models/photo.dart';
import '../models/event.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Accueil'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Accueil'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.event),
              title: Text('Événements'),
              onTap: () {
                Navigator.pushNamed(context, '/events');
              },
            ),
            ListTile(
              leading: Icon(Icons.photo),
              title: Text('Photos'),
              onTap: () {
                Navigator.pushNamed(context, '/photos');
              },
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('Association'),
              onTap: () {
                Navigator.pushNamed(context, '/association');
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Paramètres de compte'),
              onTap: () {
                Navigator.pushNamed(context, '/settings');
              },
            ),
          ],
        ),
      ),
      body: FutureBuilder(
        future: Future.wait([
          Provider.of<ApiService>(context, listen: false).fetchPhotos(),
          Provider.of<ApiService>(context, listen: false).fetchEvents(),
        ]),
        builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erreur: ${snapshot.error}'));
          } else {
            final List<Photo> photos = snapshot.data![0];
            final List<Event> events = snapshot.data![1];

            return ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Dernières photos', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                ),
                SizedBox(height: 200, child: _buildPhotoList(photos)),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Événements à venir', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                ),
                _buildEventList(events),
              ],
            );
          }
        },
      ),
    );
  }

  Widget _buildPhotoList(List<Photo> photos) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: photos.length,
      itemBuilder: (context, index) {
        return Card(
          child: Column(
            children: [
              Image.network(photos[index].url, height: 150, width: 150, fit: BoxFit.cover),
              Text(photos[index].description),
            ],
          ),
        );
      },
    );
  }

  Widget _buildEventList(List<Event> events) {
    return Column(
      children: events.map((event) {
        return ListTile(
          title: Text(event.title),
          subtitle: Text('${event.date} - ${event.location}'),
        );
      }).toList(),
    );
  }
}
