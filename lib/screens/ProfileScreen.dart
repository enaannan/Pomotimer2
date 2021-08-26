import 'package:flutter/material.dart';
import 'package:pomotimer2/widgets/BlueCard.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({
    Key? key,
  }) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          AppBar(
            elevation: 0.0,
            centerTitle: true,
            title: Text("Author"),
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.settings),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 50, horizontal: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
              boxShadow: <BoxShadow>[
                BoxShadow(
                    blurRadius: 4,
                    spreadRadius: 4,
                    color: Colors.grey[200]!,
                    offset: Offset(0, 5))
              ],
            ),
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Center(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 60.0, bottom: 10.0),
                              child: Text(
                                "Bra Nhii",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            Text("sfasfas@gmail.com"),
                            SizedBox(
                              height: 30,
                            ),
                            Container(
                              height: 100,
                              //TODO:Remove height and replace with expanded widget but it might not workl lol
                              color: Colors.blue,
                            ),
                            Text(
                                "PomoTimer is based on a pomodoro technique that allows you to concentrate from long without being fatiuged. It also makes you take brakes wicch are vital for prolonged studies"),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 35.0),
                              child: BlueCard(
                                  textName: 'View more', action: () {}),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 380,
                  child: ClipOval(
                    clipper: CircularClipper(),
                    child: Image.asset(
                      "assets/images/profile.png",
                      fit: BoxFit.fill,
                      height: 100,
                      width: 100,
                    ),
                  ),
                ),
                Positioned(
                    left: 190,
                    child: FloatingActionButton(
                        elevation: 1,
                        mini: true,
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.grey,
                        child: Icon(Icons.create),
                        onPressed: () {}))
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CircularClipper extends CustomClipper<Rect> {
  Rect getClip(Size size) {
    return Rect.fromLTWH(0, 0, 100, 100);
  }

  @override
  bool shouldReclip(covariant CustomClipper<Rect> oldClipper) {
    return false;
  }
}
