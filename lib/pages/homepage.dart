import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:noteapp/pages/notepage.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final List<Color> lightColors  = [
    Colors.black,
    Colors.red.shade100,
    Colors.green.shade100,
    Colors.white,
    Colors.white,
  ];
  bool isDarkmode = false;
  Alignment active_Align = Alignment.centerRight;


  Color active_text_Color = Colors.black;
  Color active_imptNotes_Color = Colors.red.shade100;
  Color active_allNotes_Color = Colors.green.shade100;
  Color active_appbar_Color = Colors.white;
  Color active_appbg_Color = Colors.white;

  final List<Color> darkColors  = [
    Colors.white,
    Colors.white10,
    Colors.white10,
    Colors.white12,
    Colors.black,
  ];

  final List<List<String>> impNotesData = [
    ['Task 1', 'Call Arti for help','T'],
    ['Task 2', 'Call Arti for help','T'],
    ['Task 3', 'Call Arti for help','T'],
    ['Task 4', 'Call Arti for help','T'],
    ['Task 5', 'Call Arti for help','T'],
    ['Task 6', 'Call Arti for help','T'],
    ['Task 7', 'Call Arti for help','T'],
    ['Task 8', 'Call Arti for help','T'],
    ['Task 9', 'Call Arti for help','T'],
    ['Task 10', 'Call Arti for help','T'],
    ['Task 11', 'Call Arti for help','T'],
    ['Task 12', 'Call Arti for help','T']
  ];
  final List<List<String>> allNotesData = [
    ['Task 1', 'Call Arti for help','F'],
    ['Task 2', 'Call Arti for help','F'],
    ['Task 3', 'Call Arti for help','F'],
    ['Task 4', 'Call Arti for help','F'],
    ['Task 5', 'Call Arti for help','F'],
    ['Task 6', 'Call Arti for help','F'],
    ['Task 7', 'Call Arti for help','F'],
    ['Task 8', 'Call Arti for help','F'],
    ['Task 9', 'Call Arti for help','F'],
    ['Task 10', 'Call Arti for help','F'],
    ['Task 11', 'Call Arti for help','F'],
    ['Task 12', 'Call Arti for help','F']
  ];

  @override
  Widget build(BuildContext context) {
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
      body: Container(
        width: double.infinity,
        height:double.infinity,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 350,
              //color: Colors.grey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width : double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Text('Important Notes',
                      style: TextStyle(
                        color: active_text_Color,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  Container(
                    height:300,
                    //color: Colors.red,
                    child: ListView.separated(
                      padding: EdgeInsets.only(left: 20,top: 30,bottom: 40),
                      itemBuilder: (context, index) {
                      return InkWell(
                          onTap: (){
                            Navigator.push(context,
                            MaterialPageRoute(builder:
                            (context) => NotePage())
                            );
                          },
                          child: ImpoNotes(index));
                    },
                      separatorBuilder :  (context, _) {
                        return SizedBox(width: 20,);
                      },
                      scrollDirection: Axis.horizontal,
                    itemCount: impNotesData.length,

                    ),
                  ),

                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 470,
             // color: Colors.greenAccent,
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
                    height: 420,
                    child: GridView.builder(
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: InkWell(
                                onTap: (){
                                  Navigator.push(context,
                                      MaterialPageRoute(builder:
                                          (context) => NotePage())
                                  );
                                },
                                child: allNotes(index)),
                          );
                        },
                        itemCount: allNotesData.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                      ),
                       ),
                  ),
                ],
              ),
              ),
          ],
        ),
      ),

    );
  }

  Widget ImpoNotes(index) {
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
            child: InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => NotePage() ));
              },
              child: Container(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text( impNotesData[index][0],
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
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15,right: 10),
            child: Container(
              child: Text(
                impNotesData[index][1],
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
  Widget allNotes(index){
    return Container(
      width: 200,
      height: 200,
      decoration: BoxDecoration(
          color: active_allNotes_Color,
          borderRadius: BorderRadius.circular(20),
          boxShadow:[ BoxShadow(
            color: Color(0x000000).withOpacity(1),
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
                    child: Text(allNotesData[index][0],
                      style: TextStyle(
                          color: active_text_Color,
                          fontSize: 25,
                          fontWeight: FontWeight.w600
                      ),
                    ),
                  ),
                  Icon(Icons.star,
                    color: darkColors[1],)
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15,right: 10),
            child: Container(
              child: Text(
                allNotesData[index][1],
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
        width: 80,
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
    }else{
      isDarkmode = true;
      active_Align = Alignment.centerLeft;
      active_text_Color = darkColors[0];
      active_imptNotes_Color =darkColors[1];
      active_allNotes_Color = darkColors[2];
      active_appbar_Color = darkColors[3];
      active_appbg_Color = darkColors[4];
    }

  }
}


