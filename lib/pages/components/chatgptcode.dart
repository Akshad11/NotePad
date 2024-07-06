import 'package:flutter/material.dart';

void main() => runApp(NotepadApp());

class NotepadApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notepad',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NotepadHomePage(),
    );
  }
}

class NotepadHomePage extends StatefulWidget {
  @override
  _NotepadHomePageState createState() => _NotepadHomePageState();
}

class _NotepadHomePageState extends State<NotepadHomePage> {
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notepad'),
        actions: [
          Switch(
            value: isDarkMode,
            onChanged: (value) {
              setState(() {
                isDarkMode = value;
              });
            },
          ),
        ],
      ),
      body: Container(
        color: isDarkMode ? Colors.black54 : Color(0xFFF5F5F5),
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: [
            SectionHeader(title: 'Important Notes'),
            NoteCard(
              title: 'Task 1',
              description: 'Call Arti for meeting at office',
              isImportant: true,
            ),
            NoteCard(
              title: 'Task 2',
              description: 'Prepare presentation slides',
              isImportant: true,
            ),
            SectionHeader(title: 'All Notes'),
            NoteCard(
              title: 'Task 1',
              description: 'Call Arti for meeting at office',
              isImportant: false,
            ),
            NoteCard(
              title: 'Task 2',
              description: 'Prepare presentation slides',
              isImportant: false,
            ),
            NoteCard(
              title: 'Task 3',
              description: 'Buy groceries',
              isImportant: false,
            ),
            NoteCard(
              title: 'Task 4',
              description: 'Plan weekend trip',
              isImportant: false,
            ),
          ],
        ),
      ),
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String title;

  SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
      ),
    );
  }
}

class NoteCard extends StatelessWidget {
  final String title;
  final String description;
  final bool isImportant;

  NoteCard({required this.title, required this.description, required this.isImportant});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: isImportant ? Color(0xFFD9E8FB) : Color(0xFFF9D9D9),
      margin: EdgeInsets.symmetric(vertical: 8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                Icon(
                  Icons.star,
                  color: isImportant ? Colors.amber : Colors.grey,
                ),
              ],
            ),
            SizedBox(height: 8.0),
            Text(
              description,
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
