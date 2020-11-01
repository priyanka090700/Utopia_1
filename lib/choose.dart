import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Choose extends StatefulWidget {
  Choose({Key key}) : super(key: key);

  @override
  _ChooseState createState() => _ChooseState();
}

class _ChooseState extends State<Choose> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(25.0),
          color: Colors.lightBlue[100],

        height: size.height,
        width: double.infinity,

          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                StudentImage(),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed('\stulogin');
                  },
                  child: Container(
                    height: 60.0,
                    width: 270.0,
                    padding: EdgeInsets.symmetric(
                      vertical: 14.0,
                      horizontal: 30.0,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.blue[900],
                      borderRadius: BorderRadius.circular(
                        10.0,
                      ),
                    ),
                    child: Text(
                      'STUDENT   ZONE',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.acme(
                      color: Colors.white, fontSize: 25.0),
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.05),
                TeacherImage(),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed('\teacherlogin');
                  },
                  child: Container(
                    height: 60.0,
                    width: 270.0,
                    padding: EdgeInsets.symmetric(
                      vertical: 14.0,
                      horizontal: 30.0,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.blue[900],
                      borderRadius: BorderRadius.circular(
                        10.0,
                      ),
                    ),
                    child: Text(
                      'PROFESSOR   ZONE',
                      style: GoogleFonts.acme(
                      color: Colors.white, fontSize: 25.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TeacherImage extends StatelessWidget {
  const TeacherImage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
     
    AssetImage assetImage=AssetImage('assets/images/teacher.png');
    Image image =Image(image: assetImage,);
    return Container(
      height:size.height*0.25,
      child:image,);
  }
}

class StudentImage extends StatelessWidget {
  const StudentImage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height:size.height*0.25,
      child:Image.asset('assets/images/studentnew.png'),);
  }
}
