import 'package:CollegeManager/backend/auth.dart';
import 'package:CollegeManager/pages/classroom.dart';
import 'package:CollegeManager/pages/labList.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

AuthServices _auth = AuthServices();

class MyHomePage extends StatefulWidget {
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
                expandedHeight: 200.0,
                floating: false,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Text("Home",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      )),
                  background: Image.network(
                    "https://img.collegepravesh.com/2016/01/COEP-Pune.jpg",
                    fit: BoxFit.cover,
                  ),
                )),
          ];
        },
        body: Padding(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Card(
                // color: Color.fromRGBO(58, 66, 86, 1.0),
                elevation: 3.0,
                margin:
                    new EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                child: ListTile(
                  onLongPress: () {
                    showDialog(
                        context: context,
                        child: new CupertinoAlertDialog(
                          title: new Text("Alert"),
                          content: new Text(
                            "Tap on this to get more information about the status of Computers in the Lab",
                            style: TextStyle(
                              fontSize: 15.0,
                              fontFamily: 'Noto',
                            ),
                          ),
                          actions: <Widget>[
                            new CupertinoDialogAction(
                                child: const Text('OK'),
                                isDefaultAction: true,
                                onPressed: () {
                                  Navigator.of(context, rootNavigator: true)
                                      .pop("OK");
                                }),
                          ],
                        ));
                  },
                  leading: Container(
                    padding: EdgeInsets.only(
                      right: 12.0,
                    ),
                    decoration: new BoxDecoration(
                        border: new Border(
                            right: new BorderSide(
                                width: 1.0, color: Colors.black))),
                    child: Image.asset(
                      'assets/images/lab.png',
                      width: 65.0,
                      height: 65.0,
                    ),
                  ),
                  title: Text(
                    "Computer Lab",
                    style: TextStyle(
                        fontSize: 25.0,
                        fontFamily: 'Noto'), //fontWeight: FontWeight.w600,
                  ),
                  subtitle: Text("Active/Inactive Status"),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LabList()),
                    );
                  },
                ),
              ),
              Card(
                // color: Color.fromRGBO(58, 66, 86, 1.0),
                elevation: 3.0,
                margin:
                    new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                child: ListTile(
                  onLongPress: () {
                    showDialog(
                        context: context,
                        child: new CupertinoAlertDialog(
                          title: new Text("Alert"),
                          content: new Text(
                            "Tap on this to get more information about the availibility of your Classroom's",
                            style: TextStyle(
                              fontSize: 15.0,
                              fontFamily: 'Noto',
                            ),
                          ),
                          actions: <Widget>[
                            new CupertinoDialogAction(
                                child: const Text('OK'),
                                isDefaultAction: true,
                                onPressed: () {
                                  Navigator.of(context, rootNavigator: true)
                                      .pop("OK");
                                }),
                          ],
                        ));
                  },
                  leading: Container(
                    padding: EdgeInsets.only(
                      right: 12.0,
                    ),
                    decoration: new BoxDecoration(
                        border: new Border(
                            right: new BorderSide(
                                width: 1.0, color: Colors.black))),
                    child: Image.asset(
                      'assets/images/classroom.png',
                      width: 65.0,
                      height: 65.0,
                    ),
                  ),
                  title: Text(
                    "Classroom",
                    style: TextStyle(
                        fontSize: 25.0,
                        fontFamily: 'Noto'), //fontWeight: FontWeight.w600,
                  ),
                  subtitle: Text("Availibility of Classroom's"),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Classroom()),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          await _auth.signout();
        },
        icon: Icon(Icons.account_box),
        label: Text("Logout"),
      ),
    );
  }
}
