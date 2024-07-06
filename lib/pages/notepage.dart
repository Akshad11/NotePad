import 'package:flutter/material.dart';

class NotePage extends StatefulWidget {
  const NotePage({super.key});

  @override
  State<NotePage> createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.cyan,
        appBar: AppBar(
        toolbarHeight: 100,
        title: Text('Notepad',
        style: TextStyle(
        fontFamily: 'Achico',
        fontSize: 40,
        // fontWeight: FontWeight.bold,

    ),
    ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color : Colors.cyan,
        child: Container(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 100,
                color: Colors.brown,
                child: Text(
                  'Type here ',
                ),
              ),
              Container(
                width: double.infinity,
                color: Colors.blueAccent,
              )
            ],
          ),
        ),
      ),

    );
  }
}
