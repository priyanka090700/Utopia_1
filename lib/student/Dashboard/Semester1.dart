import 'package:Utopia_1/globals.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:google_fonts/google_fonts.dart';

class SemesterStudent extends StatefulWidget {
  SemesterStudent({Key key}) : super(key: key);

  @override
  _SemesterStudentState createState() => _SemesterStudentState();
}

class _SemesterStudentState extends State<SemesterStudent> {
  @override
  Widget build(BuildContext context) {
    final List<Widget> steps = [
      step0(),
      step1(),
    ];
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
            child: SafeArea(
      child: Container(
        height: size.height,
        width: double.infinity,
        color: Colors.blue[900],
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: Column(
                  children: <Widget>[
                    Text(
                      'What\'s Your Semester!!!',
                      style: GoogleFonts.pacifico(
                          color: Colors.white, fontSize: 25.0),
                    ),
                  ],
                ),
              ),
              Container(
                  height: size.height * 0.8,
                  padding: const EdgeInsets.only(left: 32),
                  child: new Swiper(
                      loop: false,
                      viewportFraction: 0.8,
                      scale: 0.9,
                      itemCount: 2,
                      itemWidth: size.height * 0.50,
                      itemHeight: 500.0,
                      layout: SwiperLayout.DEFAULT,
                      pagination: SwiperPagination(
                        builder: DotSwiperPaginationBuilder(
                            activeSize: 10, space: 8),
                      ),
                      itemBuilder: (context, index) {
                        return steps[index];
                      }))
            ]),
      ),
    )));
  }

  Widget step0() {
    Size size = MediaQuery.of(context).size;
    return new GestureDetector(
      onTap: () {
      },
      child: Stack(
        children: <Widget>[
          Positioned(
              top: 50.0,
              child: Container(
                  height: size.height * 0.55,
                  width: size.height * 0.35,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black,
                            blurRadius: 20.0,
                            spreadRadius: 1,
                            offset: Offset(-0.5, -0.5))
                      ],
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white))),
          Positioned(
              top: 80.0,
              left: 3.0,
              child: Hero(
                  tag: "five",
                  child: Container(
                      height: size.height * 0.20,
                      width: size.height * 0.15,
                      child: Image(
                          image: AssetImage('assets/images/five.png'),
                          fit: BoxFit.scaleDown)))),
          Positioned(
            left: 20.0,
            top: 200.0,
            child: Text(
              'Semester',
              style: GoogleFonts.acme(color: Colors.black, fontSize: 40.0),
            ),
          ),
          Positioned(
            left: 25.0,
            top: 300.0,
            child: InkWell(
              onTap: () {
                if(Globals.select==3){
                  Globals.sem=5;
                  Globals.branch='cse';
                  Navigator.of(context).pushNamed('\studentnotes');
                }
                if(Globals.select==4){
                  Globals.sem=5;
                  Globals.branch='cse';
                  Navigator.of(context).pushNamed('\studentsyllabus');
                }
                if(Globals.select==5){
                  Globals.sem=5;
                  Globals.branch='cse';
                  Navigator.of(context).pushNamed('\studenttt');
                }
                if(Globals.select==6){
                  Globals.sem=5;
                  Globals.branch='cse';
                  Navigator.of(context).pushNamed('\studentpp');
                }
                if(Globals.select==7){
                  Globals.sem=5;
                  Globals.branch='cse';
                  Navigator.of(context).pushNamed('\studentebook');
                }
                if(Globals.select==9){
                  Globals.sem=5;
                  Globals.branch='cse';
                  Navigator.of(context).pushNamed('\studentattendance');
                }
              },
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.blue[900],
                  borderRadius: BorderRadius.circular(
                    10.0,
                  ),
                ),
                child: Text(
                  ' CSE ',
                  style: GoogleFonts.robotoSlab(
                      color: Colors.white, fontSize: 25.0),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          Positioned(
            left: 125.0,
            top: 300.0,
            child: InkWell(
              onTap: () {
                Navigator.of(context).pushNamed('\subjects');
              },
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.blue[900],
                  borderRadius: BorderRadius.circular(
                    10.0,
                  ),
                ),
                child: Text(
                  ' IT ',
                  style: GoogleFonts.robotoSlab(
                      color: Colors.white, fontSize: 25.0),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget step1() {
    Size size = MediaQuery.of(context).size;
    return new GestureDetector(
      onTap: () {
      },
      child: Stack(
        children: <Widget>[
          Positioned(
              top: 50.0,
              child: Container(
                  height: size.height * 0.55,
                  width: size.height * 0.35,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black,
                            blurRadius: 20.0,
                            spreadRadius: 1,
                            offset: Offset(-0.5, -0.5))
                      ],
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white))),
          Positioned(
              top: 80.0,
              left: 3.0,
              child: Hero(
                  tag: "six",
                  child: Container(
                      height: size.height * 0.20,
                      width: size.height * 0.15,
                      child: Image(
                          image: AssetImage('assets/images/six.png'),
                          fit: BoxFit.scaleDown)))),
          Positioned(
            left: 20.0,
            top: 200.0,
            child: Text(
              'Semester',
              style: GoogleFonts.acme(color: Colors.black, fontSize: 40.0),
            ),
          ),
          Positioned(
            left: 25.0,
            top: 300.0,
            child: InkWell(
              onTap: () {
                if(Globals.select==3){
                  Globals.sem=6;
                  Globals.branch='cse';
                  Navigator.of(context).pushNamed('\studentnotes');
                }
                if(Globals.select==4){
                  Globals.sem=6;
                  Globals.branch='cse';
                  Navigator.of(context).pushNamed('\studentsyllabus');
                }
                if(Globals.select==5){
                  Globals.sem=6;
                  Globals.branch='cse';
                  Navigator.of(context).pushNamed('\studenttt');
                }
                if(Globals.select==6){
                  Globals.sem=6;
                  Globals.branch='cse';
                  Navigator.of(context).pushNamed('\studentpp');
                }
                if(Globals.select==7){
                  Globals.sem=6;
                  Globals.branch='cse';
                  Navigator.of(context).pushNamed('\studentebook');
                }
                if(Globals.select==9){
                  Globals.sem=5;
                  Globals.branch='cse';
                  Navigator.of(context).pushNamed('\studentattendance');
                }
              },
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.blue[900],
                  borderRadius: BorderRadius.circular(
                    10.0,
                  ),
                ),
                child: Text(
                  ' CSE ',
                  style: GoogleFonts.robotoSlab(
                      color: Colors.white, fontSize: 25.0),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          Positioned(
            left: 125.0,
            top: 300.0,
            child: InkWell(
              onTap: () {
              },
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.blue[900],
                  borderRadius: BorderRadius.circular(
                    10.0,
                  ),
                ),
                child: Text(
                  ' IT ',
                  style: GoogleFonts.robotoSlab(
                      color: Colors.white, fontSize: 25.0),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}