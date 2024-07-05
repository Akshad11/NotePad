import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:noteapp/pages/components/togglebutton.dart';
import 'package:noteapp/pages/notepage.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final List<Color> lightColors  = [Colors.blue, Colors.black,Colors.white,Colors.orange,Colors.lightBlueAccent, Colors.greenAccent];
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
          color: lightColors[1],
        ),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 20),
            child: CrazySwitch(),
          )
        ],
        backgroundColor: lightColors[0],
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 350,
          //  color: Colors.grey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Important Notes',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
                  textAlign: TextAlign.left,
                ),
                Container(
                  height:270,
                  //color: Colors.red,
                  child: ListView.separated(
                    padding: EdgeInsets.only(left: 20,top: 30,bottom: 50),
                    itemBuilder: (context, index) {
                    return ImpoNotes();
                  },
                    separatorBuilder :  (context, _) {
                      return SizedBox(width: 20,);
                    },
                    scrollDirection: Axis.horizontal,
                  itemCount: 6,

                  ),
                ),

              ],
            ),
          ),
          // GridView.builder(
          //   //padding: EdgeInsets.only(left: 20,top: 30,bottom: 50),
          //     itemBuilder: (context, index) {
          //       return ImpoNotes();
          //     },
          //     itemCount: 2,
          //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          //    ),
          Container(
            width: double.infinity,
            height: 450,
            //color: Colors.grey,
            child: GridView.builder(
              //padding: EdgeInsets.only(left: 20,top: 30,bottom: 50),
                itemBuilder: (context, index) {
                  return ImpoNotes();
                },
                itemCount: 10,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                crossAxisSpacing: 30,
                mainAxisSpacing: 30,

              ),
               ),
            ),
        ],
      ),

    );
  }

  Widget ImpoNotes() {
    return Container(
      width: 200,
      height: 200,
      decoration: BoxDecoration(
        color: Colors.blueAccent,
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
                    Text('Task 1',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600
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
                'Call Arti for meeting at office',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
