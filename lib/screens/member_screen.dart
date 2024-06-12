import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../models/member.dart';

class MemberScreen extends StatefulWidget {
  final int memberId;

  MemberScreen({required this.memberId});

  @override
  _MemberScreenState createState() => _MemberScreenState();
}

class _MemberScreenState extends State<MemberScreen> {
  late Future<Member> futureMember;

  @override
  void initState() {
    super.initState();
    futureMember = ApiService().fetchMemberDetails(widget.memberId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Member Details'),
      ),
      body: FutureBuilder<Member>(
        future: futureMember,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return Center(child: Text('No data'));
          } else {
            Member member = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Name: ${member.name}', style: TextStyle(fontSize: 20)),
                  Text('Email: ${member.email}', style: TextStyle(fontSize: 20)),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
