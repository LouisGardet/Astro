import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'services/api_service.dart';
import 'screens/home_screen.dart';
import 'screens/events_screen.dart';
import 'screens/photos_screen.dart';
import 'screens/association_screen.dart';
import 'screens/settings_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<ApiService>(
          create: (_) => ApiService(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomeScreen(),
        routes: {
          '/events': (context) => EventsScreen(),
          '/photos': (context) => PhotosScreen(),
          '/association': (context) => AssociationScreen(),
          '/settings': (context) => SettingsScreen(),
        },
      ),
    );
  }
}
