/*import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:maze/maze.dart';
import 'dart:math';

import 'Secondpage.dart';

void main() {
  runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Homepage(),
      )
  );
}

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> with TickerProviderStateMixin {

  bool ischecked = false;
  Duration duration = Duration(milliseconds: 370);
  late Animation<Alignment> animation;
  late AnimationController animationcontroller;

  @override
  void initState() {
    super.initState();
    animationcontroller = AnimationController(vsync: this, duration: duration);
    animation =
        AlignmentTween(begin: Alignment.centerLeft, end: Alignment.centerRight)
            .animate(
            CurvedAnimation(parent: animationcontroller, curve: Curves.easeIn));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: animationcontroller,
          builder: (context,child)
          {
            return Center(
              child: InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: (){
                  setState(() {
                    if(animationcontroller.isCompleted)
                      {
                        animationcontroller.reverse();
                      }
                    else
                      {
                        animationcontroller.forward();
                      }
                    ischecked =! ischecked;
                  });
                },
                child: Container(
                  width:100,
                  height: 50,
                  padding: EdgeInsets.fromLTRB(0, 6, 0, 6),
                  decoration: BoxDecoration(
                    color: ischecked  ?Colors.green : Colors.red,
                    borderRadius: BorderRadius.circular(99),
                    boxShadow: [
                      BoxShadow(
                        color: ischecked ? Colors.green.withOpacity(0.6) : Colors.red.withOpacity(0.6),
                        blurRadius: 15,
                        offset: Offset(0,8),
                      )
                    ],
                  ),
                  child: Stack(
                    children: [
                      Align(
                        alignment: animation.value,
                        child: GestureDetector(
                          onTap: (){
                            setState(() {
                              if(animationcontroller.isCompleted)
                              {
                                animationcontroller.reverse();
                              }
                              else
                              {
                                animationcontroller.forward();
                              }
                              ischecked =! ischecked;
                            });
                          },
                          child: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}*/

/*
class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  @override
  void initState()
  {
    super.initState();
    Future.delayed(Duration(seconds: 5),()
    {
      Route route = MaterialPageRoute(builder: (context)=>Secondpage());
      Navigator.of(context).push(route);
    }
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text("hello"),
    );
  }
}*/
/*
class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}
enum direction { UP, DOWN, LEFT, RIGHT }
class _HomepageState extends State<Homepage> {
  double playerX = -0.2;
  double brickWidth = 0.4;
  int playerScore = 0;
// enemy variable
  double enemyX = -0.2;
  int enemyScore = 0;
//ball
  double ballx = 0;
  double bally = 0;
  var ballYDirection = direction.DOWN;
  var ballXDirection = direction.RIGHT;
  bool gameStarted = false;

  @override
  Widget build(BuildContext context) {
    return RawKeyboardListener(
      focusNode: FocusNode(),
      autofocus: false,
      onKey: (event) {
        if (event.isKeyPressed(LogicalKeyboardKey.arrowLeft)) {
          moveLeft();
        } else if (event.isKeyPressed(LogicalKeyboardKey.arrowRight)) {
          moveRight();
        }
      },
      child: GestureDetector(
        onTap: startGame,
        child: Scaffold(
            backgroundColor: Colors.grey[900],
            body: Center(
                child: Stack(
                  children: [
                    Welcome(gameStarted),
                    //top brick
                    Brick(enemyX, -0.9, brickWidth, true),
                    //scoreboard
                    Score(gameStarted,enemyScore,playerScore),
                    // ball
                    Ball(ballx, bally),
                    // //bottom brick
                    Brick(enemyX, 0.9, brickWidth, false)
                  ],
                ))),
      ),
    );
  }

  void startGame() {
    gameStarted = true;
    Timer.periodic(Duration(milliseconds: 1), (timer) {
      updatedDirection();
      moveBall();
      moveEnemy();
      if (isPlayerDead()) {
        enemyScore++;
        timer.cancel();
        _showDialog(false);
        // resetGame();
      }
      if (isEnemyDead()) {
        playerScore++;
        timer.cancel();
        _showDialog(true);
        // resetGame();
      }
    });
  }

  void updatedDirection() {
    setState(() {
      //update vertical dirction
      if (bally >= 0.9 && playerX + brickWidth>= ballx && playerX <= ballx) {
        ballYDirection = direction.UP;
      } else if (bally <= -0.9) {
        ballYDirection = direction.DOWN;
      }
      // update horizontal directions
      if (ballx >= 1) {
        ballXDirection = direction.LEFT;
      } else if (ballx <= -1) {
        ballXDirection = direction.RIGHT;
      }
    });
  }
  void moveBall() {
    //vertical movement
    setState(() {
      if (ballYDirection == direction.DOWN) {
        bally += 0.01;
      } else if (ballYDirection == direction.UP) {
        bally -= 0.01;
      }
    });
    //horizontal movement
    setState(() {
      if (ballXDirection == direction.LEFT) {
        ballx -= 0.01;
      } else if (ballXDirection == direction.RIGHT) {
        ballx += 0.01;
      }
    });
  }
  void moveLeft() {
    setState(() {
      if (!(playerX - 0.1 <= -1)) {
        playerX -= 0.1;
      }
    });
  }
  void moveRight() {
    if (!(playerX + brickWidth >= 1)) {
      playerX += 0.1;
    }
  }
  void resetGame() {
    Navigator.pop(context);
    setState(() {
      gameStarted = false;
      ballx = 0;
      bally = 0;
      playerX = -0.2;
      enemyX =- 0.2;
    });
  }
  bool isEnemyDead(){
    if (bally <= -1) {
      return true;
    }
    return false;
  }
  bool isPlayerDead() {
    if (bally >= 1) {
      return true;
    }
    return false;
  }
  void _showDialog(bool enemyDied) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          // return object of type Dialog
          return AlertDialog(
            elevation: 0.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            backgroundColor: Colors.purple,
            title: Center(
              child: Text(
                enemyDied?"Pink Wins": "Purple Wins",
                style: TextStyle(color: Colors.white),
              ),
            ),
            actions: [
              GestureDetector(
                onTap: resetGame,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Container(
                      padding: EdgeInsets.all(7),
                      color: Colors.purple[100],
                      child: Text(
                        "Play Again",
                        style: TextStyle(color:enemyDied?Colors.pink[300]: Colors.purple[000]),
                      )),
                ),
              )
            ],
          );
        });
  }

  void moveEnemy() {}
}




class Welcome extends StatelessWidget {

  final bool gameStarted;
  Welcome(this.gameStarted);
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment(0, -0.2),
        child: Text(
          gameStarted ? "": "T A P T O P L A Y",
          style: TextStyle(color: Colors.white),
        ));
  }
}
class Ball extends StatelessWidget {
  final x;
  final y;
  Ball(this.x, this.y);
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment(x, y),
      child: Container(
        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
        width: 20,
        height: 20,
      ),
    );
  }
}
class Brick extends StatelessWidget {
  final x;
  final y;
  final brickWidth;
  final isEnemy;
  Brick( this.x, this.y, this.brickWidth, this.isEnemy);
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment((2* x +brickWidth)/(2-brickWidth), y),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            alignment: Alignment(0, 0),
            color: isEnemy?Colors.purple[500]: Colors.pink[300],
            height: 20,
            width:MediaQuery.of(context).size.width * brickWidth/ 2,
          ),
        ));
  }
}
class Score extends StatelessWidget {
  final gameStarted;
  final enemyScore;
  final playerScore;
  Score(this.gameStarted, this.enemyScore,this.playerScore, );
  @override
  Widget build(BuildContext context) {
    return gameStarted? Stack(children: [
      Container(
          alignment: Alignment(0, 0),
          child: Container(
            height: 1,
            width: MediaQuery.of(context).size.width / 3,
            color: Colors.grey[800],
          )),
      Container(
          alignment: Alignment(0, -0.3),
          child: Text(
            enemyScore.toString(),
            style: TextStyle(color: Colors.grey[800], fontSize: 100),
          )),
      Container(
          alignment: Alignment(0, 0.3),
          child: Text(
            playerScore.toString(),
            style: TextStyle(color: Colors.grey[800], fontSize: 100),
          )),
    ]): Container();
  }
}*/
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
