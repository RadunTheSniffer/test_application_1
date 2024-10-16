import 'package:flutter/material.dart';


class NewPage2 extends StatelessWidget {
  final List<dynamic> announcements;

  const NewPage2({super.key, required this.announcements});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Announcements'),
      ),
      body: ListView.builder(
        itemCount: announcements.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(announcements[index]['article']),
            subtitle: Text(announcements[index]['time_stamp']),
          );
        },
      ),
    );
  }


}