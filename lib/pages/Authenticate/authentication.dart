import 'package:CollegeManager/pages/Authenticate/register.dart';
import 'package:CollegeManager/pages/Authenticate/signin.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {

  bool isSighn = true;

  void toggleView()
  {
    setState(() {
      isSighn=!isSighn;
    });
  }

  @override
  Widget build(BuildContext context) {
    if(isSighn==true)
    {
      return Container(
        child: SignIn(toggleView: toggleView),
      );
    }
    else
      {
        return Container(

          child: Register(toggleView: toggleView),
        );
      }
  }
}
