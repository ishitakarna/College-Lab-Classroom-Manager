import 'package:CollegeManager/pages/labs/ASL/ASLlab.dart';
import 'package:CollegeManager/pages/labs/DL/DLlab.dart';
import 'package:CollegeManager/pages/labs/FOSS1/FOSS1lab.dart';
import 'package:CollegeManager/pages/labs/FOSS2/FOSS2lab.dart';
import 'package:CollegeManager/pages/labs/GML/GMlab.dart';
import 'package:CollegeManager/pages/labs/ISL/ISLlab.dart';
import 'package:CollegeManager/pages/labs/Program/Programlab.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LabList extends StatefulWidget {
  @override
  _LabListState createState() => _LabListState();
}

class _LabListState extends State<LabList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey[200],
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
                expandedHeight: 200.0,
                floating: false,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Text("Labs",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      )),
                  //put comp lab building pic
                  background: Image.network(
                    "https://resize.hswstatic.com/w_907/gif/what-is-the-worlds-fastest-supercomputer-used-for.jpg",
                    fit: BoxFit.cover,
                  ),
                ))
          ];
        },
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Card(
                  // color: Color.fromRGBO(58, 66, 86, 1.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  elevation: 3.0,
                  margin: new EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 00.0),
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 10.0),
                      SizedBox(height: 10.0),
                      ListTile(
                        title: Text(
                          "Advanced Software Lab",
                          style: TextStyle(
                              fontSize: 25.0,
                              fontFamily:
                                  'Noto'), //fontWeight: FontWeight.w600,
                        ),
                        subtitle: Row(
                          children: <Widget>[
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(
                                  height: 5.0,
                                ),
                                Row(
                                  children: <Widget>[
                                    Icon(Icons.location_city),
                                    SizedBox(width: 10.0),
                                    Text("Computer Department"),
                                  ],
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Row(
                                  children: <Widget>[
                                    Icon(Icons.location_on),
                                    SizedBox(width: 10.0),
                                    Text("2nd Floor"),
                                  ],
                                ),
                                SizedBox(
                                  height: 12.0,
                                )
                              ],
                            ),
                          ],
                        ),
                        trailing: Icon(Icons.keyboard_arrow_right),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ASLLab()),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Card(
                  // color: Color.fromRGBO(58, 66, 86, 1.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  elevation: 3.0,
                  margin: new EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 00.0),
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 10.0),
                      ListTile(
                        title: Text(
                          "Database Lab",
                          style: TextStyle(
                              fontSize: 25.0,
                              fontFamily:
                                  'Noto'), //fontWeight: FontWeight.w600,
                        ),
                        subtitle: Row(
                          children: <Widget>[
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(
                                  height: 5.0,
                                ),
                                Row(
                                  children: <Widget>[
                                    Icon(Icons.location_city),
                                    SizedBox(width: 10.0),
                                    Text("Computer Department"),
                                  ],
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Row(
                                  children: <Widget>[
                                    Icon(Icons.location_on),
                                    SizedBox(width: 10.0),
                                    Text("2nd Floor"),
                                  ],
                                ),
                                SizedBox(
                                  height: 12.0,
                                )
                              ],
                            ),
                          ],
                        ),
                        trailing: Icon(Icons.keyboard_arrow_right),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => DLLab()),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Card(
                  // color: Color.fromRGBO(58, 66, 86, 1.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  elevation: 3.0,
                  margin:
                      new EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 10.0,
                      ),
                      SizedBox(height: 10.0),
                      ListTile(
                        title: Text(
                          "FOSS 1 Lab",
                          style: TextStyle(
                              fontSize: 25.0,
                              fontFamily:
                                  'Noto'), //fontWeight: FontWeight.w600,
                        ),
                        subtitle: Row(
                          children: <Widget>[
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(
                                  height: 5.0,
                                ),
                                Row(
                                  children: <Widget>[
                                    Icon(Icons.location_city),
                                    SizedBox(width: 10.0),
                                    Text("ENTC Extension"),
                                  ],
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Row(
                                  children: <Widget>[
                                    Icon(Icons.location_on),
                                    SizedBox(width: 10.0),
                                    Text("3rd Floor"),
                                  ],
                                ),
                                SizedBox(
                                  height: 12.0,
                                )
                              ],
                            ),
                          ],
                        ),
                        trailing: Icon(Icons.keyboard_arrow_right),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => FOSS1Lab()),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Card(
                  // color: Color.fromRGBO(58, 66, 86, 1.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  elevation: 3.0,
                  margin: new EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 00.0),
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 10.0),
                      ListTile(
                        title: Text(
                          "FOSS 2 Lab",
                          style: TextStyle(
                              fontSize: 25.0,
                              fontFamily:
                                  'Noto'), //fontWeight: FontWeight.w600,
                        ),
                        subtitle: Row(
                          children: <Widget>[
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(
                                  height: 5.0,
                                ),
                                Row(
                                  children: <Widget>[
                                    Icon(Icons.location_city),
                                    SizedBox(width: 10.0),
                                    Text("ENTC Extension"),
                                  ],
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Row(
                                  children: <Widget>[
                                    Icon(Icons.location_on),
                                    SizedBox(width: 10.0),
                                    Text("3rd Floor"),
                                  ],
                                ),
                                SizedBox(
                                  height: 12.0,
                                )
                              ],
                            ),
                          ],
                        ),
                        trailing: Icon(Icons.keyboard_arrow_right),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => FOSS2Lab()),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Card(
                  // color: Color.fromRGBO(58, 66, 86, 1.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  elevation: 3.0,
                  margin: new EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 00.0),
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 5.0),
                      ListTile(
                        title: Text(
                          "Graphics and Multimedia Lab",
                          style: TextStyle(
                              fontSize: 25.0,
                              fontFamily:
                                  'Noto'), //fontWeight: FontWeight.w600,
                        ),
                        subtitle: Row(
                          children: <Widget>[
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(
                                  height: 7.0,
                                ),
                                Row(
                                  children: <Widget>[
                                    Icon(Icons.location_city),
                                    SizedBox(width: 10.0),
                                    Text("Computer Department"),
                                  ],
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Row(
                                  children: <Widget>[
                                    Icon(Icons.location_on),
                                    SizedBox(width: 10.0),
                                    Text("Ground Floor"),
                                  ],
                                ),
                                SizedBox(
                                  height: 12.0,
                                )
                              ],
                            ),
                          ],
                        ),
                        trailing: Icon(Icons.keyboard_arrow_right),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => GMLLab()),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Card(
                  // color: Color.fromRGBO(58, 66, 86, 1.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  elevation: 3.0,
                  margin: new EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 00.0),
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 10.0),
                      ListTile(
                        title: Text(
                          "ISL Lab",
                          style: TextStyle(
                              fontSize: 25.0,
                              fontFamily:
                                  'Noto'), //fontWeight: FontWeight.w600,
                        ),
                        subtitle: Row(
                          children: <Widget>[
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(
                                  height: 5.0,
                                ),
                                Row(
                                  children: <Widget>[
                                    Icon(Icons.location_city),
                                    SizedBox(width: 10.0),
                                    Text("ENTC Extension"),
                                  ],
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Row(
                                  children: <Widget>[
                                    Icon(Icons.location_on),
                                    SizedBox(width: 10.0),
                                    Text("3rd Floor"),
                                  ],
                                ),
                                SizedBox(
                                  height: 12.0,
                                )
                              ],
                            ),
                          ],
                        ),
                        trailing: Icon(Icons.keyboard_arrow_right),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ISLLab()),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Card(
                  // color: Color.fromRGBO(58, 66, 86, 1.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  elevation: 3.0,
                  margin: new EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 00.0),
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 10.0),
                      ListTile(
                        title: Text(
                          "Programming Lab",
                          style: TextStyle(
                              fontSize: 25.0,
                              fontFamily:
                                  'Noto'), //fontWeight: FontWeight.w600,
                        ),
                        subtitle: Row(
                          children: <Widget>[
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(
                                  height: 5.0,
                                ),
                                Row(
                                  children: <Widget>[
                                    Icon(Icons.location_city),
                                    SizedBox(width: 10.0),
                                    Text("Computer Department"),
                                  ],
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Row(
                                  children: <Widget>[
                                    Icon(Icons.location_on),
                                    SizedBox(width: 10.0),
                                    Text("Ground Floor"),
                                  ],
                                ),
                                SizedBox(
                                  height: 12.0,
                                )
                              ],
                            ),
                          ],
                        ),
                        trailing: Icon(Icons.keyboard_arrow_right),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProgramLab()),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
