import 'package:CollegeManager/backend/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

int resetFlag = 0;
var loading = false;

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({this.toggleView});
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthServices _auth = AuthServices();
  String email = '';
  String passowrd = '';

  // String error = '';
  final _formkey = GlobalKey<FormState>();
  var assetsImage = 'https://img.collegepravesh.com/2016/01/COEP-Logo.png';

  @override
  Widget build(BuildContext context) {
    var alert = new CupertinoAlertDialog(
      title: new Text("Alert"),
      content: new Text("Invalid Email-Id or Password"),
      actions: <Widget>[
        new CupertinoDialogAction(
            child: const Text('OK'),
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context, 'OK');
            }),
      ],
    );
    return loading
        ? Center(
            child: CircularProgressIndicator(
                // backgroundColor: Colors.white,
                ),
          )
        : Scaffold(
            resizeToAvoidBottomPadding: false,
            body: // MessagingWidget(),
                Form(
              key: _formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    child: Stack(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.fromLTRB(15.0, 100.0, 0.0, 0.0),
                          child: Text("College",
                              style: TextStyle(
                                  fontSize: 35.0, fontWeight: FontWeight.bold)),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(16.0, 175.0, 0.0, 0.0),
                          child: Text('Manager',
                              style: TextStyle(
                                  fontSize: 35.0, fontWeight: FontWeight.bold)),
                        ),
                        Positioned(
                          right: 10.0,
                          bottom: -5.0,
                          child: Container(
                            // decoration: new BoxDecoration(
                            //   color: Colors.white70,
                            // ),
                            child: Image.network(
                              assetsImage,
                              width: 175.0,
                              height: 175.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                      padding:
                          EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            validator: validateEmail,
                            onChanged: (val) {
                              setState(() {
                                email = val;
                              });
                            },
                            decoration: InputDecoration(
                                labelText: 'EMAIL',
                                labelStyle: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0Xff357DED)))),
                          ),
                          SizedBox(height: 20.0),
                          TextFormField(
                            obscureText: true,
                            validator: (input) {
                              //Password validation
                              if (resetFlag != 1) {
                                if (input.length < 6) {
                                  return 'Password must be minimum 6 characters!';
                                }
                              }
                            },
                            onChanged: (val) {
                              setState(() {
                                passowrd = val;
                              });
                            },
                            decoration: InputDecoration(
                                labelText: 'PASSWORD',
                                labelStyle: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0XFF357DED)))),
                          ),
                          SizedBox(height: 5.0),
                          Container(
                            alignment: Alignment(1.0, 0.0),
                            padding: EdgeInsets.only(top: 15.0, left: 20.0),
                            child: InkWell(
                              onTap: sendResetEmail,
                              child: Text(
                                'Forgot Password',
                                style: TextStyle(
                                    fontSize: 20.0,
                                    color: Color(0XFF1DC5A3),
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Montserrat',
                                    decoration: TextDecoration.underline),
                              ),
                            ),
                          ),
                          SizedBox(height: 40.0),
                          Container(
                            height: 50.0,
                            child: GestureDetector(
                              onTap: () async {
                                if (_formkey.currentState.validate()) {
                                  loading = true;
                                  dynamic result =
                                      await _auth.signIn(email, passowrd);
                                  loading = false;
                                  if (result == null) {
                                    setState(() {
                                      showDialog(
                                          context: context, child: alert);
                                    });
                                  }
                                }
                              },
                              child: Material(
                                borderRadius: BorderRadius.circular(30.0),
                                shadowColor: Color(0Xff357DED),
                                color: Color(0xFF357DED),
                                elevation: 7.0,
                                child: Center(
                                  child: Text(
                                    'LOGIN',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Montserrat'),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )),
                  SizedBox(height: 30.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Not Yet Registered?',
                        style:
                            TextStyle(fontFamily: 'Montserrat', fontSize: 20.0),
                      ),
                      SizedBox(width: 5.0),
                      InkWell(
                        onTap: () {
                          widget.toggleView();
                        },
                        child: Text(
                          'Register',
                          style: TextStyle(
                              color: Color(0XFF1DC5A3),
                              fontSize: 25.0,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          );
  }

  String validateEmail(String value) {
    // Pattern pattern =
    //     r'^[a-z0-9!#$%&'+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'+/=?^_`{|}~-]+)@(?:[a-z0-9](?:[a-z0-9-][a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?;
    Pattern pattern = "[a-zA-Z0-9\+\.\_\%\-\+]{1,256}" +
        "\\@" +
        "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}" +
        "(" +
        "\\." +
        "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25}" +
        ")+";
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Enter Valid Email';
    else
      return null;
  }

  Future<void> sendResetEmail() async {
    resetFlag = 1;
    //toast

    print('inside sendResetEmail');
    final formState = _formkey.currentState;
    //validate
    print('insidesignin');
    if (formState.validate()) {
      formState.save();
      if (email == null) {
        Fluttertoast.showToast(
            msg: "Please Enter Email",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIos: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
        resetFlag = 0;
      } else {
        FirebaseAuth.instance.sendPasswordResetEmail(email: email);
        Fluttertoast.showToast(
            msg: "Reset Password Mail SENT!",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIos: 1,
            backgroundColor: Colors.blue,
            textColor: Colors.white,
            fontSize: 16.0);
        resetFlag = 0;
      }
    }
  }
}
