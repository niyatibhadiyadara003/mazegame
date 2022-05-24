
import 'package:flutter/material.dart';

import 'main.dart';

class Thirdpage extends StatefulWidget {

  @override
  _ThirdpageState createState() => _ThirdpageState();
}

class _ThirdpageState extends State<Thirdpage> {
  bool animated = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/fire-cracker.png",height:200),
              const SizedBox(height:50),
              AnimatedDefaultTextStyle(
                child: Text('Congratulation'), style: animated?TextStyle(
                color: Colors.yellow,
                fontSize: 60,
              ):TextStyle(
                color: Colors.blue,
                fontSize: 20,
              ),
                duration: Duration(milliseconds: 1000),
                curve: Curves.linear,),
              const SizedBox(height:50),
              Container(
                  height: 40,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                child: ElevatedButton(
                  onPressed: (){
                  setState(() {
                   Navigator.of(context).pushNamedAndRemoveUntil("/", (route) => false);
                  });
                }, child: Text("Restart",style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),),
                style: ElevatedButton.styleFrom(
                primary: Colors.green,
                  onPrimary: Colors.black,
                ),),
              ),
              InkWell(
                onTap: (){
                  setState(() {
                    animated=!animated;
                  });
                },
                child: Container(
                  height: 50,
                  width: 100,
                  color: Colors.black,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
