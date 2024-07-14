import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:noteapp/pages/components/datamodel.dart';
import 'package:noteapp/pages/notestore.dart';
import 'package:provider/provider.dart';

class NotePage extends StatefulWidget {
  var len, sub, note;

  NotePage(
      this.len,
      this.sub,
      this.note
      );
  @override
  State<NotePage> createState() => _NotePageState(len, sub, note);
}

class _NotePageState extends State<NotePage> {
  var len, sub, note;

  _NotePageState(
      this.len,
      this.sub,
      this.note);

  var subjectText = TextEditingController();
  var noteText = TextEditingController();

  bool importantclick = false;

  Color textColor = Colors.white;
  Color bgColor = Colors.black;
  Color headingColor = Colors.white10;
  Color noteColor = Colors.black26;
  Color iconColor = Colors.white;
  Color starIconColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    NotesData myNote = Provider.of<NotesData>(context);
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: headingColor,
        title: Text(
         'Notepad',
          style: TextStyle(
            fontFamily: 'Achico',
            fontSize: 30,
            color: textColor,
            // fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Icon(Icons.share,
          size: 30,
            color: iconColor,
          ),
          SizedBox(width: 20,),
          InkWell(
            onTap: (){
              myNote.getTextSubject(subjectText.text);
              myNote.getNoteText(noteText.text);

              setState(() {
                if (myNote.isImportant) {
                  myNote.importantclick(false);
                }
                else{
                  myNote.importantclick(true);
                }

              });
            },
            child: Icon(Icons.star,
              color: myNote.isImportant ? Colors.yellow : Colors.white,
            size: 30,
            ),
          ),
          SizedBox(width: 20,
          )
        ],
      ),
      resizeToAvoidBottomInset: false, // set it to false
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 30,
            color: headingColor,
            child: Padding(
              padding: const EdgeInsets.only(top: 3.0,left: 20),
              child: Text(
                  DateTime.timestamp().toString(),
                style: TextStyle(
                  color: textColor,
                ),
              ),
            ),
          ),
          Divider(
            color: Colors.black,
            height: 1,
          ),
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Container(
              width: double.infinity,
              color: headingColor,
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8.0,left: 20),
                      child: TextField(
                          maxLines: 1,
                          style: TextStyle(
                            fontSize: 40,
                            color: textColor,
                          ),
                          controller: subjectText..text = sub ,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Heading',
                            hintStyle: TextStyle(
                                color: textColor,
                            ),
                          )
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 420,
                    color: noteColor,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                        controller: noteText..text = note,
                          style: TextStyle(
                            fontSize: 30,
                            color: textColor,
                          ),
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'write you text here',
                            hintStyle: TextStyle(
                            color: textColor,
                          ),
                          )
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async{
         // myNote.createcurrDate();
          myNote.getNoteText(noteText.text);
          myNote.getTextSubject(subjectText.text);

          Map<String , dynamic> updateNoteinfo={
            "Subject" : myNote.subject,
            "NoteText" : myNote.text,
            "id" : len,
            "IsImportant" : myNote.isImportant.toString()
          };
          await DatabaseMethods().updateNoteDetails(len, updateNoteinfo).then((value) {
            Fluttertoast.showToast(
                msg: "Note is Saved",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.white,
                textColor: Colors.black,
                fontSize: 16.0
            );
          });
          noteText.text = myNote.text;
          subjectText.text = myNote.subject;
          // setState(() {
          //
          // });
        },
        backgroundColor: Colors.blue,
        child: Icon(
          Icons.save_as,color: Colors.black,
          size: 40,
        ),
      ),
    );
  }
}
