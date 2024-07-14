import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:noteapp/pages/components/datamodel.dart';
import 'package:noteapp/pages/notepage.dart';
import 'package:noteapp/pages/notestore.dart';
import 'package:provider/provider.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  //Color for dark and light mode --
  final List<Color> lightColors  = [
    Colors.black,
    Colors.red.shade100,
    Colors.green.shade100,
    Colors.white,
    Colors.white,
  ];
  final List<Color> darkColors  = [
    Colors.white,
    Colors.white10,
    Colors.white10,
    Colors.white12,
    Colors.black,
  ];

  //state for dark mode
  bool isDarkmode = false;
  Alignment active_Align = Alignment.centerRight;
  Color active_text_Color = Colors.black;
  Color active_imptNotes_Color = Colors.red.shade100;
  Color active_allNotes_Color = Colors.green.shade100;
  Color active_appbar_Color = Colors.white;
  Color active_appbg_Color = Colors.white;
  Color active_icon_Color = Colors.white;

  //variables
  int len = 0;

  final List<String?> allDataApi = ['p','c'];

  // final List<List<String?>> impNotesData = [
  //
  //
  // ];
  // final List<List<String>?> allNotesData = [
  //   ['Task 9', 'Call Arti for help','F'],
  //   ['Task 10', 'Call Arti for help','F'],
  // ];

  Stream? noteStream;

  getontheload()async{
    noteStream = await DatabaseMethods().getNoteDetails();
    setState(() {

    });
  }

  @override
  void initState() {
    getontheload();
    super.initState();
  }

  Widget allNotes2(){
    return StreamBuilder(
      stream: noteStream,
      builder: (context, AsyncSnapshot snapshot){

      return snapshot.hasData ? ListView.builder(
        itemBuilder: (context, index) {
          DocumentSnapshot ds = snapshot.data.docs[index];
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: InkWell(
                onTap: (){
                //  myNote.getTextSubject(ds["Subject"]);
                //  myNote.getNoteText("NoteText");
                  Navigator.push(context,
                      MaterialPageRoute(builder:
                          (context) => NotePage(ds["id"],ds["Subject"], ds["NoteText"]))
                  );
                },
                child: allNotes(ds["Subject"], ds["NoteText"],ds["id"])),
          );
        },
        itemCount: snapshot.data.docs.length,
        // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //   crossAxisCount: 2,
        // ),
      ) : Container();
    },);
  }

  @override
  Widget build(BuildContext context) {
    NotesData myNote = Provider.of<NotesData>(context);
    return Scaffold(
      backgroundColor: active_appbg_Color,
      appBar: AppBar(
        toolbarHeight: 70,
        title: Text('Notepad',
        style: TextStyle(
          fontFamily: 'Achico',
          fontSize: 40,
         // fontWeight: FontWeight.bold,
          color: active_text_Color,

        ),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 20),
            child: togglebutton(),
          )
        ],
        backgroundColor: active_appbar_Color,
        centerTitle: true,
      ),
      body: allDataApi.isNotEmpty ? Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            // Container(
            //   child: Container(
            //     width: double.infinity,
            //     height: 350,
            //    // color: Colors.grey,
            //     child:  Column(
            //       mainAxisAlignment:  MainAxisAlignment.start,
            //
            //       children: [
            //         Container(
            //           width : double.infinity,
            //           child: Padding(
            //             padding: const EdgeInsets.only(left: 20.0),
            //             child: Text('Important Notes',
            //             style: TextStyle(
            //               color: active_text_Color,
            //               fontSize: 30,
            //               fontWeight: FontWeight.bold,
            //             ),
            //               textAlign: TextAlign.left,
            //             ),
            //           ),
            //         ),
            //         SizedBox(
            //           height:  300,
            //           //color: Colors.red,
            //           child: GridView.builder(
            //             padding: EdgeInsets.only(left: 20,top: 30,bottom: 40, right: 20),
            //             itemBuilder: (context, index) {
            //             return InkWell(
            //                 onTap: (){
            //                   Navigator.push(context,
            //                   MaterialPageRoute(builder:
            //                   (context) => NotePage(index))
            //                   );
            //                 },
            //                 child:myNote.allNotesData[index]![2] == 'true' ?
            //                 ImpoNotes(index,myNote.allNotesData[index]![0],myNote.allNotesData[index]![1]): SizedBox.shrink());
            //           },
            //             scrollDirection: Axis.horizontal ,
            //           itemCount: myNote.allNotesData.length,
            //             gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
            //             crossAxisCount: 1,
            //               mainAxisSpacing: 20,
            //              crossAxisSpacing: 20,
            //           ),
            //
            //           ),
            //         ),
            //       ],
            //     ) ,
            //   ) ,
            // ),
            Container(
              child: Container(
                width: double.infinity,
                height: 850 ,
                //color: Colors.greenAccent,
                child: Column(
                  children: [
                    Container(
                      width : double.infinity,
                        height: 50,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text('All Notes',
                            style: TextStyle(
                              color: active_text_Color,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                                          textAlign: TextAlign.left,
                          ),
                        )
                    ),
                    Container(
                      width: double.infinity,
                      height: 800,
                      child: allNotes2()
                    ),
                  ],
                ),
                ),
            ),
          ],
        ),
      ) : Center(
        child: Text('Add Notes',
          style: TextStyle(
            color: active_text_Color,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.left,
        ),
      ),
floatingActionButton: FloatingActionButton (
  onPressed: () async{
    myNote.createNoteId();
    Map<String , dynamic> noteInfoMap={
      "Subject" : '',
      "NoteText" : '',
      "id" : myNote.id,
      "IsImportant" : 'false'
    };
    await DatabaseMethods().addnoteDetails(noteInfoMap, myNote.id).then((value) {
      Fluttertoast.showToast(
          msg: "New Note is created",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
    });
    myNote.getTextSubject('');
    myNote.getNoteText('');
    Navigator.push(context,
       MaterialPageRoute(builder:
           (context) => NotePage(myNote.id,myNote.subject, myNote.text))
    );
  },
  backgroundColor: Colors.blue,
  shape: CircleBorder(),
  child: Icon(Icons.add,
  ),
),
    );
  }

  Widget ImpoNotes(index,sub,text1) {
    return Container(
      width: 200,
      height: 200,
      decoration: BoxDecoration(
        color: active_imptNotes_Color,
        borderRadius: BorderRadius.circular(20),
        boxShadow:[ BoxShadow(
          color: Color(0x000000).withOpacity(1),
          offset: Offset(10, 7),
          blurRadius: 42,
          spreadRadius: -15,
        )]
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(sub,
                    style: TextStyle(
                      color: active_text_Color,
                      fontSize: 25,
                      fontWeight: FontWeight.w600
                    ),
                    ),
                  ),
                  Icon(Icons.star,
                  color: Colors.yellow,)
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15,right: 10),
            child: Container(
              child: Text(
                text1,
                style: TextStyle(
                  color: active_text_Color,
                  fontSize: 20,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
  Widget allNotes(sub , text2,id){
    return Container(
      width: 200,
      height: 200,
      decoration: BoxDecoration(
          color: active_allNotes_Color,
          borderRadius: BorderRadius.circular(20),
          boxShadow:[ BoxShadow(
            color: Colors.black.withOpacity(1),
            offset: Offset(10, 8),
            blurRadius: 30,
            spreadRadius: -10,
          )]
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(sub,
                      style: TextStyle(
                          color: active_text_Color,
                          fontSize: 25,
                          fontWeight: FontWeight.w600
                      ),
                    ),
                  ),
                  Container(
                    width: 60,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.star,
                          color: active_icon_Color,),
                        InkWell(
                          onTap: ()async{
                            await DatabaseMethods().DeleteNoteDetails(id);

                          },
                          child: Icon(Icons.delete,
                          color: active_icon_Color,),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15,right: 10),
            child: Container(
              child: Text(
                text2,
                style: TextStyle(
                  color: active_text_Color,
                  fontSize: 20,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget togglebutton() {
    return InkWell(
      onTap: () {
        setState(() {
          changeAligment();
        });
      },
      child: Container(
        width: 60,
        height: 30,
        padding: EdgeInsets.only(top: 6, bottom: 6, right: 7, left: 7),
        decoration: BoxDecoration(
            color: isDarkmode ? Colors.white54 : Colors.black,
            borderRadius: BorderRadius.circular(20)
        ),
        child: Stack(
          children: [
            Align(
              alignment: active_Align,
              child: Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                    color: isDarkmode ? Colors.black : Colors.white,
                    borderRadius: BorderRadius.circular(50)
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
  void changeAligment(){
    if (isDarkmode){
      isDarkmode = false;
      active_Align = Alignment.centerRight;
      active_text_Color = lightColors[0];
      active_imptNotes_Color =lightColors[1];
      active_allNotes_Color = lightColors[2];
      active_appbar_Color = lightColors[3];
      active_appbg_Color = lightColors[4];
      active_icon_Color = darkColors[4];
    }else{
      isDarkmode = true;
      active_Align = Alignment.centerLeft;
      active_text_Color = darkColors[0];
      active_imptNotes_Color =darkColors[1];
      active_allNotes_Color = darkColors[2];
      active_appbar_Color = darkColors[3];
      active_appbg_Color = darkColors[4];
      active_icon_Color = lightColors[4];
    }

  }

 // Future editNote

  // GridView.builder(
  // itemBuilder: (context, index) {
  // return Padding(
  // padding: const EdgeInsets.all(20.0),
  // child: InkWell(
  // onTap: (){
  // myNote.getTextSubject(myNote.allNotesData[index]![0]);
  // myNote.getNoteText(myNote.allNotesData[index]![1]);
  // Navigator.push(context,
  // MaterialPageRoute(builder:
  // (context) => NotePage(index))
  // );
  // },
  // child:
  // allNotes(index,myNote.allNotesData[index]![0],myNote.allNotesData[index]![1])),
  // );
  // },
  // itemCount: myNote.allNotesData.length,
  // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
  // crossAxisCount: 2,
  // ),
  // ),
}


