import 'package:flutter/material.dart';
import 'dart:async';
import 'package:login_page/login.dart';
import 'package:page_transition/page_transition.dart';

void main() => runApp(MaterialApp(
      theme: ThemeData(primaryColor: Colors.lightBlueAccent),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    ));

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 5), () {
      Navigator.push(
          context,
          PageTransition(
              type: PageTransitionType.leftToRightWithFade, child: MyApp()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.lightBlue[900],
            ),
          ),
          Column(
            children: [
              Expanded(
                  flex: 2,
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 100,
                          height: 100,
                          child: Image(
                            image: AssetImage("assets/logo.png"),
                          ),
                        ),
                        // Divider(
                        //   color: Colors.white,
                        //   endIndent: 60,
                        //   indent: 60,
                        // ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "SMK KARANGTARUNA",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  )),
              Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      Padding(padding: EdgeInsets.only(top: 20)),
                      CircularProgressIndicator(),
                      Padding(padding: EdgeInsets.only(top: 20)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.school,
                            color: Colors.white,
                          ),
                          Text(
                            "E-SCHOOL ",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ],
                      ),
                      Padding(padding: EdgeInsets.only(top: 40)),
                      Text(
                        "Created By KARANGTARUNA DEVELOPER",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Colors.white),
                      ),
                    ],
                  ))
            ],
          )
        ],
      ),
    );
  }
}
