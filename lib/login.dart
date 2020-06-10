import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


class LoginPage extends StatefulWidget {
  @override
  LoginPageState createState() {
    return LoginPageState();
  }
}

class LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        //backgroundColor: Colors.grey.shade800,
        body: SafeArea(
          child: ListView(
            shrinkWrap: false,
            children: <Widget>[
              ClipPath(
                clipper: ArcClipper(),
                child: Container(
                  //margin: EdgeInsets.only(top: 25.0, bottom: 5.0),
                  //color: Color(0xffff6f00),
                  height: 150.0,
                  width: 1000,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: <Color>[
                        Color(0xffFFB700),
                        Color(0xffFFD500),
                      ],
                    ),
                  ),
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 30.0,
                      ),
//                      Text(
//                        'LOGIN',
//                        style: TextStyle(
//                          letterSpacing: 2.5,
//                          fontSize: 30.0,
//                          fontWeight: FontWeight.bold,
//                          fontFamily: 'Pacifico',
//                          color: Colors.black,
//                        ),
//                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      CircleAvatar(
                        radius: 50.0,
                        backgroundImage:
                        AssetImage('assets/images/jugadu_logo_circle.png'),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.topCenter,
                    child: Card(
                      margin: EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 20.0),
                      elevation: 15.0,
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: 25.0, left: 15.0, right: 15.0, bottom: 50.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            TextFormField(
                              autofocus: true,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Please enter your Username';
                                }
                              },
                              decoration: const InputDecoration(
                                icon: Icon(Icons.person),
                                hintText: 'Username',
                                //labelText: 'Name *',
                              ),
                            ),
                            Stack(
                              children: <Widget>[
                                Align(
                                  alignment: Alignment.topCenter,
                                  child: TextFormField(
                                    autofocus: true,
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Please enter your Password';
                                      }
                                    },
                                    obscureText: _obscureText,
                                    decoration: const InputDecoration(
                                      icon: Icon(Icons.lock),
                                      hintText: 'Password',
                                      //labelText: 'Password *',
                                    ),
                                  ),
                                ),
                                Positioned(
                                  right: 0.0,
                                  child: IconButton(
                                    icon: Icon(_obscureText
                                        ? Icons.visibility_off
                                        : Icons.visibility),
                                    onPressed: () {
                                      setState(() {
                                        _obscureText = !_obscureText;
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0.0,
                    right: 110.0,
                    child: RaisedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/register');
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      textColor: Colors.white,
                      color: Color(0xFFFFC107),
                      //padding: const EdgeInsets.all(0.0),
                      child: Container(
                        color: Color(0xffFFC107),
//                        decoration: const BoxDecoration(
//                          gradient: LinearGradient(
//                            colors: <Color>[
//                              Color(0xffffee58),
//                              Color(0xFFffeb3b),
//                              Color(0xFFfdd835),
//                              Color(0xFFfbc02d),
//                            ],
//                          ),
//                        ),
                        //padding: const EdgeInsets.all(15.0),
                        child: const Text(
                          'LOGIN',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                            letterSpacing: 3,
                            fontSize: 20.0,
                            fontFamily: 'Pacifico',
                          ),
                          //style: kCardServices2,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Divider(
                      indent: 25.0,
                      endIndent: 10.0,
                    ),
                  ),
                  Center(
                    child: Text('OR'),
                  ),
                  Expanded(
                    child: Divider(
                      indent: 10.0,
                      endIndent: 15.0,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage:
                    AssetImage('assets/images/google_logo.png'),
                    radius: 16.0,
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  CircleAvatar(
                    radius: 18.0,
                    backgroundImage: AssetImage('assets/images/fb_logo.png'),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  CircleAvatar(
                    radius: 18.0,
                    child: Icon(
                      Icons.phone,
                    ),
                    backgroundColor: Colors.green,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ArcClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 35.0);

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
