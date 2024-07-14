import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class DatabaseMethods{
  Future addnoteDetails(Map<String, dynamic> noteInfoMap, String id)async{
    return await FirebaseFirestore.instance
        .collection('NotesInfo')
        .doc(id)
        .set(noteInfoMap);

  }

  Future<Stream<QuerySnapshot>> getNoteDetails() async{
    return await FirebaseFirestore.instance.collection('NotesInfo').snapshots();
  }

  Future<QuerySnapshot<Map<String, dynamic>>> get1NoteDetails(String id) async{
    return await FirebaseFirestore.instance.collection('NotesInfo').where("id", isEqualTo: id).get();
  }



  Future updateNoteDetails(String id, Map<String , dynamic> updateNoteinfo)async{
    return await FirebaseFirestore.instance.collection('NotesInfo').doc(id).update(updateNoteinfo);
  }

  Future DeleteNoteDetails(String id)async{
    return await FirebaseFirestore.instance.collection('NotesInfo').doc(id).delete();
  }


}