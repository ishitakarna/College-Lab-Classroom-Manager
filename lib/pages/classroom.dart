import 'package:CollegeManager/pages/classrooms/101.dart';
import 'package:flutter/material.dart';

TextStyle liteH = TextStyle(
  fontSize: 26.0,
  fontFamily: 'Raleway',
);
TextStyle liteS =
    TextStyle(color: Colors.black87, fontSize: 16.0, fontFamily: 'Raleway');

class Classroom extends StatefulWidget {
  @override
  _ClassroomState createState() => _ClassroomState();
}

class _ClassroomState extends State<Classroom> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
                expandedHeight: 200.0,
                floating: false,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Text("Classrooms",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      )),
                  background: Image.network(
                    "https://images.livemint.com/img/2019/11/12/600x338/1NFZ9S4X_1573580638652.jpg",
                    fit: BoxFit.cover,
                  ),
                ))
          ];
        },
        body: SingleChildScrollView(
                  child: Column(
            children: <Widget>[
              Container(
                height: 150.0,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(12, 12, 12, 2.5),
                  child: Card(
                    // color: Color.fromRGBO(58, 66, 86, 1.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    elevation: 3.0,
                    margin: new EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 10.0),
                    child: ListTile(
                      title: Text(
                        "AC 101",
                        style: TextStyle(
                            fontSize: 25.0,
                            fontFamily: 'Noto'), //fontWeight: FontWeight.w600,
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
                                  Text("Academic Complex"),
                                ],
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              Row(
                                children: <Widget>[
                                  Icon(Icons.location_on),
                                  SizedBox(width: 10.0),
                                  Text("First Floor"),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      trailing: Icon(Icons.keyboard_arrow_right),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ClassCalendar()),
                        );
                      },
                    ),
                  ),
                ),
              ),
              Container(
                height: 150.0,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(12, 5, 12, 2.5),
                  child: Card(
                    // color: Color.fromRGBO(58, 66, 86, 1.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    elevation: 3.0,
                    margin: new EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 10.0),
                    child: ListTile(
                      title: Text(
                        "AC 102",
                        style: TextStyle(
                            fontSize: 25.0,
                            fontFamily: 'Noto'), //fontWeight: FontWeight.w600,
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
                                  Text("Academic Complex"),
                                ],
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              Row(
                                children: <Widget>[
                                  Icon(Icons.location_on),
                                  SizedBox(width: 10.0),
                                  Text("First Floor"),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      trailing: Icon(Icons.keyboard_arrow_right),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ClassCalendar()),
                        );
                      },
                    ),
                  ),
                ),
              ),
              Container(
                height: 150.0,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(12, 12, 12, 2.5),
                  child: Card(
                    // color: Color.fromRGBO(58, 66, 86, 1.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    elevation: 3.0,
                    margin: new EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 10.0),
                    child: ListTile(
                      title: Text(
                        "AC 103",
                        style: TextStyle(
                            fontSize: 25.0,
                            fontFamily: 'Noto'), //fontWeight: FontWeight.w600,
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
                                  Text("Academic Complex"),
                                ],
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              Row(
                                children: <Widget>[
                                  Icon(Icons.location_on),
                                  SizedBox(width: 10.0),
                                  Text("First Floor"),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      trailing: Icon(Icons.keyboard_arrow_right),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ClassCalendar()),
                        );
                      },
                    ),
                  ),
                ),
              ),
              Container(
                height: 150.0,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(12, 12, 12, 2.5),
                  child: Card(
                    // color: Color.fromRGBO(58, 66, 86, 1.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    elevation: 3.0,
                    margin: new EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 10.0),
                    child: ListTile(
                      title: Text(
                        "AC 104",
                        style: TextStyle(
                            fontSize: 25.0,
                            fontFamily: 'Noto'), //fontWeight: FontWeight.w600,
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
                                  Text("Academic Complex"),
                                ],
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              Row(
                                children: <Widget>[
                                  Icon(Icons.location_on),
                                  SizedBox(width: 10.0),
                                  Text("First Floor"),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      trailing: Icon(Icons.keyboard_arrow_right),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ClassCalendar()),
                        );
                      },
                    ),
                  ),
                ),
              ),
              Container(
                height: 150.0,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(12, 12, 12, 2.5),
                  child: Card(
                    // color: Color.fromRGBO(58, 66, 86, 1.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    elevation: 3.0,
                    margin: new EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 10.0),
                    child: ListTile(
                      title: Text(
                        "AC 201",
                        style: TextStyle(
                            fontSize: 25.0,
                            fontFamily: 'Noto'), //fontWeight: FontWeight.w600,
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
                                  Text("Academic Complex"),
                                ],
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              Row(
                                children: <Widget>[
                                  Icon(Icons.location_on),
                                  SizedBox(width: 10.0),
                                  Text("Second Floor"),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      trailing: Icon(Icons.keyboard_arrow_right),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ClassCalendar()),
                        );
                      },
                    ),
                  ),
                ),
              ),
              Container(
                height: 150.0,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(12, 12, 12, 2.5),
                  child: Card(
                    // color: Color.fromRGBO(58, 66, 86, 1.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    elevation: 3.0,
                    margin: new EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 10.0),
                    child: ListTile(
                      title: Text(
                        "AC 202",
                        style: TextStyle(
                            fontSize: 25.0,
                            fontFamily: 'Noto'), //fontWeight: FontWeight.w600,
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
                                  Text("Academic Complex"),
                                ],
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              Row(
                                children: <Widget>[
                                  Icon(Icons.location_on),
                                  SizedBox(width: 10.0),
                                  Text("Second Floor"),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      trailing: Icon(Icons.keyboard_arrow_right),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ClassCalendar()),
                        );
                      },
                    ),
                  ),
                ),
              ),
              Container(
                height: 150.0,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(12, 12, 12, 2.5),
                  child: Card(
                    // color: Color.fromRGBO(58, 66, 86, 1.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    elevation: 3.0,
                    margin: new EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 10.0),
                    child: ListTile(
                      title: Text(
                        "AC 203",
                        style: TextStyle(
                            fontSize: 25.0,
                            fontFamily: 'Noto'), //fontWeight: FontWeight.w600,
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
                                  Text("Academic Complex"),
                                ],
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              Row(
                                children: <Widget>[
                                  Icon(Icons.location_on),
                                  SizedBox(width: 10.0),
                                  Text("Second Floor"),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      trailing: Icon(Icons.keyboard_arrow_right),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ClassCalendar()),
                        );
                      },
                    ),
                  ),
                ),
              ),
              Container(
                height: 150.0,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(12, 12, 12, 2.5),
                  child: Card(
                    // color: Color.fromRGBO(58, 66, 86, 1.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    elevation: 3.0,
                    margin: new EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 10.0),
                    child: ListTile(
                      title: Text(
                        "AC 204",
                        style: TextStyle(
                            fontSize: 25.0,
                            fontFamily: 'Noto'), //fontWeight: FontWeight.w600,
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
                                  Text("Academic Complex"),
                                ],
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              Row(
                                children: <Widget>[
                                  Icon(Icons.location_on),
                                  SizedBox(width: 10.0),
                                  Text("Second Floor"),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      trailing: Icon(Icons.keyboard_arrow_right),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ClassCalendar()),
                        );
                      },
                    ),
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
