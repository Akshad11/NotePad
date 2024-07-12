import 'dart:math';

import 'package:flutter/cupertino.dart';

class NotesData extends ChangeNotifier{


   String _id = '';
    DateTime _date = DateTime.now();
   String _subject = '';
    String _text = '';
   bool _isImportant = false;

   List<List<String>?> _allNotesData = [];

   List<List<String>?>  get allNotesData => _allNotesData;

   String get id => _id;
   createNoteId(){
     final Random random = Random(); // Create a Random object for generating random numbers
     _id = (1000 + random.nextInt(9000)).toString();
     notifyListeners();
   }
   DateTime get date => _date;
   createcurrDate(){
     _date = DateTime.now();
     notifyListeners();
   }

   String get subject => _subject;
   getTextSubject( String value ){
     _subject = value;
     notifyListeners();
   }
   String get text  => _text;
   getNoteText( String value ){
     _text = value;
     notifyListeners();
   }

   bool get isImportant => _isImportant;
   importantclick(bool value ){
     _isImportant = value;
     notifyListeners();
   }

   noteclear(){
       _subject = '';
       _text = '';
       _isImportant = false;
   }




}