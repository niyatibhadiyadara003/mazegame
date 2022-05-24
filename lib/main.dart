import 'package:flutter/material.dart';
import 'package:game1/thirdpage.dart';
import 'package:game1/thirdpage.dart';

import 'Secondpage.dart';

void main(){
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context)=>Homepage(),
        "Secondpage": (context)=>Secondpage(),
        "Thirdpage": (context)=>Thirdpage(),
      },
    ),
  );
}
class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.withOpacity(0.5),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/back.png",height:200),
              const SizedBox(height:50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 40,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: ElevatedButton(
                      onPressed: (){
                        setState(() {
                          rowcolum r1 = rowcolum(r:8,c:8,mycolor: Colors.red);
                          Navigator.of(context).pushNamed('Secondpage',arguments: r1);
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        onPrimary: Colors.black,
                        primary: Colors.green,
                      ),
                      child: Text("Easy",style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),),
                    ),
                  ),
                  const SizedBox(width:30),
                  Container(
                    height: 40,
                    width: 100,
                    decoration: BoxDecoration(

                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ElevatedButton(
                      onPressed: (){
                        setState(() {
                          rowcolum r1 = rowcolum(r:15,c:15,mycolor: Colors.green);
                          Navigator.of(context).pushNamed('Secondpage',arguments: r1);

                        });
                      },style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                      onPrimary: Colors.black,
                    ),
                      child: Text("Normal",style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),),
                    ),
                  ),
                  const SizedBox(width:30),
                  Container(
                    height: 40,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ElevatedButton(
                      onPressed: (){
                        setState(() {
                          rowcolum r1 = rowcolum(r:20,c:20,mycolor: Colors.blue);
                          Navigator.of(context).pushNamed('Secondpage',arguments: r1);
                        });
                      },style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                      onPrimary: Colors.black,
                    ),
                      child: Text("Hard",style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),),
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
