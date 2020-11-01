import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TeacherNotice extends StatefulWidget {
  @override
  _TeacherNoticeState createState() => _TeacherNoticeState();
}

class _TeacherNoticeState extends State<TeacherNotice>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation degOneTranslationAnimation,
      degTwoTranslationAnimation,
      degThreeTranslationAnimation;
  Animation rotationAnimation;

  double getRadiansFromDegree(double degree) {
    double unitRadian = 57.295779513;
    return degree / unitRadian;
  }
  String text;
  Future<String> textDialog(BuildContext context) {
    TextEditingController mycontroller = TextEditingController();
    return showDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: Text('Enter Text...'),
            content: CupertinoTextField( 
              controller: mycontroller,
              maxLines: 3,
            ),
            actions: <Widget>[
              CupertinoDialogAction(
                child: Text('Submit'),
                onPressed: () {
                  Navigator.of(context).pop(mycontroller.text.toString());
                },
              )
            ],
          );
        });
  }

  listItem(String subjectName) {
    return Padding(
        padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 20.0),
        child: InkWell(
          onTap: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                color: Colors.blue,
                  child:Column(
                    
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(subjectName,
                          style: TextStyle(
                              fontSize: 17.0, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  
              ),
             
            ],
          ),
          
        ));
  }

  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 250));
    degOneTranslationAnimation = TweenSequence([
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0.0, end: 1.2), weight: 75.0),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 1.2, end: 1.0), weight: 25.0),
    ]).animate(animationController);
    degTwoTranslationAnimation = TweenSequence([
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0.0, end: 1.4), weight: 55.0),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 1.4, end: 1.0), weight: 45.0),
    ]).animate(animationController);
    degThreeTranslationAnimation = TweenSequence([
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0.0, end: 1.75), weight: 35.0),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 1.75, end: 1.0), weight: 65.0),
    ]).animate(animationController);
    rotationAnimation = Tween<double>(begin: 180.0, end: 0.0).animate(
        CurvedAnimation(parent: animationController, curve: Curves.easeOut));
    super.initState();
    animationController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
          color: Colors.blue[900],
          width: size.width,
          height: size.height,
          child: Column(children: <Widget>[
            SizedBox(height: size.height * 0.05),
            Text(
              "NOTICES ",
              textAlign: TextAlign.start,
              style: GoogleFonts.pollerOne(color: Colors.white, fontSize: 35.0),
            ),
            SizedBox(height: size.height * 0.05),
            Expanded(
              child: Stack(children: <Widget>[
                // Our background
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                    ),
                  ),
                ),
                
                Stack(
                  children: <Widget>[
                    Positioned(
                        right: 30,
                        bottom: 30,
                        child: Stack(
                          alignment: Alignment.bottomRight,
                          children: <Widget>[
                            IgnorePointer(
                              child: Container(
                                //color: Colors.black.withOpacity(0.5), // comment or change to transparent color
                                height: 150.0,
                                width: 150.0,
                              ),
                            ),
                            Transform.translate(
                              offset: Offset.fromDirection(
                                  getRadiansFromDegree(270),
                                  degOneTranslationAnimation.value * 100),
                              child: Transform(
                                transform: Matrix4.rotationZ(
                                    getRadiansFromDegree(
                                        rotationAnimation.value))
                                  ..scale(degOneTranslationAnimation.value),
                                alignment: Alignment.center,
                                child: CircularButton(
                                  color: Colors.blue,
                                  width: 50,
                                  height: 50,
                                  icon: Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  ),
                                  onClick: () {
                                    textDialog(context).then((value){
                                      text=value;
                                    });
                                  },
                                ),
                              ),
                            ),
                            Transform.translate(
                              offset: Offset.fromDirection(
                                  getRadiansFromDegree(225),
                                  degTwoTranslationAnimation.value * 100),
                              child: Transform(
                                transform: Matrix4.rotationZ(
                                    getRadiansFromDegree(
                                        rotationAnimation.value))
                                  ..scale(degTwoTranslationAnimation.value),
                                alignment: Alignment.center,
                                child: CircularButton(
                                  color: Colors.blue,
                                  width: 50,
                                  height: 50,
                                  icon: Icon(
                                    Icons.camera_alt,
                                    color: Colors.white,
                                  ),
                                  onClick: () {
                                    print('Second button');
                                  },
                                ),
                              ),
                            ),
                            Transform.translate(
                              offset: Offset.fromDirection(
                                  getRadiansFromDegree(180),
                                  degThreeTranslationAnimation.value * 100),
                              child: Transform(
                                transform: Matrix4.rotationZ(
                                    getRadiansFromDegree(
                                        rotationAnimation.value))
                                  ..scale(degThreeTranslationAnimation.value),
                                alignment: Alignment.center,
                                child: CircularButton(
                                  color: Colors.blue,
                                  width: 50,
                                  height: 50,
                                  icon: Icon(
                                    Icons.person,
                                    color: Colors.white,
                                  ),
                                  onClick: () {
                                    print('Third Button');
                                  },
                                ),
                              ),
                            ),
                            Transform(
                              transform: Matrix4.rotationZ(getRadiansFromDegree(
                                  rotationAnimation.value)),
                              alignment: Alignment.center,
                              child: CircularButton(
                                color: Colors.blue[900],
                                width: 60,
                                height: 60,
                                icon: Icon(
                                  Icons.menu,
                                  color: Colors.white,
                                ),
                                onClick: () {
                                  if (animationController.isCompleted) {
                                    animationController.reverse();
                                  } else {
                                    animationController.forward();
                                  }
                                },
                              ),
                            )
                          ],
                        ))
                  ],
                ),
              ]),
            ),
          ])),
    ));
  }
}

class CircularButton extends StatelessWidget {
  final double width;
  final double height;
  final Color color;
  final Icon icon;
  final Function onClick;

  CircularButton(
      {this.color, this.width, this.height, this.icon, this.onClick});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      width: width,
      height: height,
      child: IconButton(icon: icon, enableFeedback: true, onPressed: onClick),
    );
  }
}
