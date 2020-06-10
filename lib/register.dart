import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'styles.dart';
//import 'signIns.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
//import 'phone.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';


final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn _googleSignIn = GoogleSignIn();


class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  bool _success;
  String _userID;

  String _message = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        //margin: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 50.0),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.topCenter,
                  child: ClipPath(
                    clipper: ArcClipper(),
                    child: Container(
                      //margin: EdgeInsets.only(top: 25.0, bottom: 5.0),
                      height: 170.0,
                      width: MediaQuery.of(context).size.width,
                      //color: Color(0xffff6f00),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: <Color>[
                            Color(0xFFff8f00),
                            Color(0xFFffca28),
//                            Color(0xffff6f00),
//                            Color(0xfff9a825),
//                            Color(0xffffc400),
//                            Color(0xffffe082),
//                            Color(0xFFffca28),
//                            Color(0xFFffb300),
//                            Color(0xFFff8f00),
//                            Color(0xffff6f00),
                          ],
                        ),
                      ),
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50.0,
                ),
                Positioned(
                  bottom: -1.0,
                  right: 110.0,
                  top: 70.0,
                  child: CircleAvatar(
                    radius: 50.0,
                    backgroundImage:
                    AssetImage('assets/images/jugadu_logo_circle.png'),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15.0,
            ),
            Text(
              'SIGN UP',
              style: TextStyle(
                letterSpacing: 2.5,
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'Pacifico',
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(45.0, 10.0, 45.0, 10.0),
              child: Column(
                children: <Widget>[
                  RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      side: BorderSide(color: Colors.white),
                    ),
                    onPressed: () async {
                      //Navigator.pushNamed(context, '/');
                       _signInWithGoogle();

                    },
                    color: Colors.white,
                    elevation: 15.0,
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage:
                        AssetImage('assets/images/google_logo.png'),
                        radius: 12.0,
                      ),
                      title: Text(
                        'Google',
                        style: kButtonStyle,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      side: BorderSide(
                        color: Color(0xff3B5998),
                      ),
                    ),
                    onPressed: () {
                      //Navigator.pushNamed(context, '/facebook');
                      //_OtherProvidersSignInSection();
                      initiateFacebookLogin();
                    },
                    color: Color(0xff3B5998),
                    elevation: 15.0,
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage:
                        AssetImage('assets/images/fb_logo.png'),
                        radius: 14.0,
                      ),
                      title: Text(
                        'Facebook',
                        style: kButtonStyle,
                      ),

                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  RaisedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/phone');
                      //_PhoneSignInSection();
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    textColor: Colors.white,
                    color: Colors.green,
                    elevation: 15.0,
                    child: Container(
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 15.0,
                          child: Icon(Icons.phone),
                        ),
                        title: Text(
                          'Phone',
                          style: kButtonStyle,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

   //Example code of how to sign in with google.
  void _signInWithGoogle() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
    await googleUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final FirebaseUser user =
        (await _auth.signInWithCredential(credential)).user;
    assert(user.email != null);
    assert(user.displayName != null);
    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);

    final FirebaseUser currentUser = await _auth.currentUser();
    assert(user.uid == currentUser.uid);
    setState(() {
      if (user != null) {
        _success = true;
        _userID = user.uid;
        Scaffold.of(context).showSnackBar(SnackBar(content: Text(
          _userID + 'has succesfully logged in',
        )));
      } else {
        _success = false;
        Scaffold.of(context).showSnackBar(SnackBar(content: Text('Sorry could not Sign In',)));
      }
    });
  }

  bool isLoggedIn = false;

  void initiateFacebookLogin() async {
    var facebookLogin = FacebookLogin();
    var facebookLoginResult =
    await facebookLogin.logInWithReadPermissions(['email']);
    switch (facebookLoginResult.status) {
      case FacebookLoginStatus.error:
        print("Error");
        onLoginStatusChanged(false);
        break;
      case FacebookLoginStatus.cancelledByUser:
        print("CancelledByUser");
        onLoginStatusChanged(false);
        break;
      case FacebookLoginStatus.loggedIn:
        print("LoggedIn");
        onLoginStatusChanged(true);
        break;
    }
  }

  void onLoginStatusChanged(bool isLoggedIn) {
    setState(() {
      this.isLoggedIn = isLoggedIn;
    });
  }

}


class ArcClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 30.0);

    var firstControlPoint = Offset(size.width / 4, size.height);
    var firstPoint = Offset(size.width / 2, size.height);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstPoint.dx, firstPoint.dy);

    var secondControlPoint = Offset(size.width - (size.width / 4), size.height);
    var secondPoint = Offset(size.width, size.height - 30);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondPoint.dx, secondPoint.dy);

    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}





