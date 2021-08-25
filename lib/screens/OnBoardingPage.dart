import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:pomotimer2/screens/MainScreen.dart';
import 'package:pomotimer2/widgets/BlueCard.dart';
import 'package:google_fonts/google_fonts.dart';

class OnBoardingPage extends StatefulWidget {
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [
        PageViewModel(
            title: "Always procrastinating?",
            body:
                "Use Pomotimer based on the pomodoro technique that makes tasks easier and fun to complete.Slide to find out more...",
            image: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Image(
                      width: 350.0,
                      image: AssetImage("assets/images/one.png"))),
            ),
            decoration: PageDecoration()),
        PageViewModel(
            title: "Create a task",
            body:
                "First create a task, choose how many iterations you wish to complete and Pomo away...",
            decoration: PageDecoration(),
            image: Image(image: AssetImage("assets/images/two.png"))),
        PageViewModel(
            title: "Hurray!!!! lets go",
            body: "Let's get started",
            image: Image(image: AssetImage("assets/images/three.png")))
      ],
      showNextButton: true,
      showSkipButton: true,
      onDone: () => _onIntroductionDone(),
      done: Text("Get Started"),
      skip: Text("Skip"),
      next: Text("Next"),
    );
  }

  void _onIntroductionDone() {
    // Navigator.of(context).push(
    //   MaterialPageRoute(builder: (context) => HomePage()),
    // );

    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        backgroundColor: Colors.white.withOpacity(0),
        builder: (BuildContext context) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0)),
              color: Colors.white,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  margin:
                      EdgeInsets.symmetric(horizontal: 35.0, vertical: 15.0),
                  child: TextField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        icon: Icon(Icons.email), hintText: "email"),
                  ),
                ),
                SizedBox(height: 5.0),
                Padding(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: Container(
                    margin:
                        EdgeInsets.symmetric(horizontal: 35.0, vertical: 15.0),
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                          icon: Icon(Icons.lock), hintText: "Password"),
                    ),
                  ),
                ),
                BlueCard(textName: "Login",action: 
                 () => Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) {
              // return here(animation);fix from here
              return MainScreen();
            },
            transitionDuration: Duration(seconds: 1),
          ))
                
                
                
                
                
                
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: RichText(
                    text: TextSpan(children: <TextSpan>[
                      TextSpan(
                          style: TextStyle(color: Colors.black),
                          text: "If you don't already have an account "),
                      TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
//                              Navigator.of(context).push(MaterialPageRoute(
//                                  builder: (context) => RegisterScreen()));
                            },
                          style: GoogleFonts.architectsDaughter(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2.0),
                          text: "Register"),
                    ]),
                    maxLines: 1,
                  ),
                ),
              ],
            ),
          );
        },
        elevation: 50.0);
  }
}

