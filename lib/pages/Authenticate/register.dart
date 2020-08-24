import 'package:CollegeManager/backend/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final AuthServices _auth = AuthServices();
String email = '';
String password1 = '';
String name = '';
// String error = '';
int selectedRadio;
final _formkey = GlobalKey<FormState>();
final TextEditingController _controller =
    new TextEditingController(); //controller for re enter password
final TextEditingController _passcontroller =
    new TextEditingController(); //controller to get password
final TextEditingController phoneNumberController =
    new TextEditingController(); //controller for phone number

var assetsImage = 'https://img.collegepravesh.com/2016/01/COEP-Logo.png';
var loading = false;

class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  void initState() {
    super.initState();
    selectedRadio = 1;
  }

  setSelectedRadio(int val) {
    setState(() {
      selectedRadio = val;
    });
  }

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
                SingleChildScrollView(
              child: Form(
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
                                    fontSize: 35.0,
                                    fontWeight: FontWeight.bold)),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(16.0, 175.0, 0.0, 0.0),
                            child: Text('Manager',
                                style: TextStyle(
                                    fontSize: 35.0,
                                    fontWeight: FontWeight.bold)),
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
                              textCapitalization: TextCapitalization.words,
                              onChanged: (val) {
                                setState(() {
                                  name = val;
                                });
                              },
                              decoration: InputDecoration(
                                  labelText: 'NAME',
                                  labelStyle: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0Xff357DED)))),
                            ),
                            SizedBox(height: 10.0),
                            TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              validator: validateEmail, //Email validation
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
                                      borderSide: BorderSide(
                                          color: Color(0Xff357DED)))),
                            ),
                            SizedBox(height: 10.0),
                            TextFormField(
                              controller: _passcontroller,
                              obscureText: true,
                              // validator: (val) =>
                              //     val.length < 6 ? 'Enter The long Password' : null,
                              validator: (value) {
                                _validatePassword(value);
                              },
                              onChanged: (val) {
                                setState(() {
                                  password1 = val;
                                });
                              },
                              decoration: InputDecoration(
                                  labelText: 'PASSWORD',
                                  labelStyle: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0XFF357DED)))),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                GestureDetector(
                                  onTap: () {
                                    print("Radio 1");
                                    setSelectedRadio(1);
                                  },
                                  child: Row(
                                    children: <Widget>[
                                      SizedBox(
                                        width: 25.0,
                                      ),
                                      Radio(
                                        value: 1,
                                        groupValue: selectedRadio,
                                        activeColor: Colors.blue,
                                        onChanged: (val) {
                                          print("Radio $val");
                                          setSelectedRadio(val);
                                        },
                                      ),
                                      Text(
                                        'Student',
                                        style: TextStyle(
                                            fontSize: 17.0,
                                            fontWeight: FontWeight.normal),
                                      ),
                                    ],
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    print("Radio 2");
                                    setSelectedRadio(2);
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: <Widget>[
                                      SizedBox(
                                        width: 25.0,
                                      ),
                                      Radio(
                                        value: 0,
                                        groupValue: selectedRadio,
                                        activeColor: Colors.green,
                                        onChanged: (val) {
                                          print("Radio $val");
                                          setSelectedRadio(val);
                                        },
                                      ),
                                      Text(
                                        'Teacher',
                                        style: TextStyle(
                                            fontSize: 17.0,
                                            fontWeight: FontWeight.normal),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 40.0),
                            Container(
                              height: 50.0,
                              child: GestureDetector(
                                onTap: () async {
                                  loading = true;
                                  if (_formkey.currentState.validate()) {
                                    dynamic result = await _auth.register(
                                        //register phone function
                                        email,
                                        password1,
                                        name,
                                        selectedRadio);
                                    loading = false;
                                    if (result == null) {
                                      showDialog(
                                          context: context, child: alert);
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
                                      'Register',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20.0,
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
                          'Already have the Account?',
                          style: TextStyle(
                              fontFamily: 'Montserrat', fontSize: 20.0),
                        ),
                        SizedBox(width: 5.0),
                        InkWell(
                          onTap: () {
                            widget.toggleView();
                          },
                          child: Text(
                            'SignIn',
                            style: TextStyle(
                                color: Color(0XFF1DC5A3),
                                fontSize: 20.0,
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
            ),
          );
  }

  String _validatePassword(String value) {
    print(password1);
    if (value.isEmpty) {
      return 'Password can\'t be empty';
    } else if (value.length < 6) {
      _controller.clear();
      return 'Password\'s length should be greater than 6';
    }
  }

  String validateEmail(String value) {
    // Pattern pattern =
    //     r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    String pattern = "[a-zA-Z0-9\+\.\_\%\-\+]{1,256}" +
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
}
