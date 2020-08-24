import 'package:CollegeManager/backend/auth.dart';
import 'package:CollegeManager/backend/classroomEvent.dart';
import 'package:flutter/material.dart';

class ClassEditPage extends StatefulWidget {
  @override
  _ClassEditPageState createState() => _ClassEditPageState();
}

class _ClassEditPageState extends State<ClassEditPage> {
  AuthServices authServices = new AuthServices();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController startTime = TextEditingController();
  TextEditingController duration = TextEditingController();
  TextEditingController title = TextEditingController();

  @override
  void initState() {
    //print(compStatus.compId);
    super.initState();
  }

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
                    title: Text("Class Edit Page",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                        )),
                    background: Image.network(
                      "https://cdn.clipart.email/73eb42bf1633aaf4d7f5ecf20709c406_pencil-phone-clipart_640-480.png",
                      fit: BoxFit.fill,
                    ),
                  )),
            ];
          },
          body: Form(
              key: _formKey, //disable if req
              child: ListView(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(right: 20, left: 20),
                    child: TextFormField(
                      keyboardType: TextInputType
                          .number, // Use email input type for emails.
                      decoration: InputDecoration(
                        hintText: 'Ex : 9 --> 9 am; 18 --> 6 pm',
                        labelText: 'Start Time: ',
                        // contentPadding:
                        //     const EdgeInsets.symmetric(horizontal: 40.0),
                      ),
                      controller: startTime,
                      onSaved: (v) => startTime.text = v,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 20, left: 20),
                    child: TextFormField(
                      keyboardType: TextInputType
                          .number, // Use email input type for emails.
                      decoration: InputDecoration(
                        hintText: 'in minutes-->60 min',
                        labelText: 'Duration: ',
                      ),
                      controller: duration,
                      onSaved: (v) => duration.text = v,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 20, left: 20),
                    child: new ConstrainedBox(
                      constraints: BoxConstraints(
                        maxHeight: 300.0,
                        // maxWidth: MediaQuery.of(context).size.width * 0.8,
                      ),
                      child: new Scrollbar(
                        child: new SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          reverse: true,
                          child: new TextFormField(
                            maxLines: null,
                            decoration: InputDecoration(
                              hintText: 'Activity name',
                              labelText: 'Title: ',
                            ),
                            controller: title,
                            onSaved: (v) => title.text = v,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ))),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          int startMin, durationFinal;
          String titleFinal;
          String day = getDay(DateTime.now().weekday.toString());

          startMin = convertStartTime(startTime.text);
          durationFinal = int.parse(duration.text);
          titleFinal = title.text;

          ClassEvent classEvent = new ClassEvent(startMin, durationFinal, titleFinal, false);
          authServices.updateClass(day, classEvent);

          Navigator.pop(context);
        },
        icon: Icon(Icons.check),
        label: Text("Submit"),
      ),
    );
  }

  String getDay(String weekday) {
    switch (weekday) {
      case "1":
        return "Monday";
      case "2":
        return "Tuesday";
      case "3":
        return "Wednesday";
      case "4":
        return "Thursday";
      case "5":
        return "Friday";
      case "6":
        return "Saturday";
      case "7":
        return "Sunday";
    }
  }

  int convertStartTime(String time) {
    int startTime;
    startTime = int.parse(time) * 60;
    return startTime;
  }
}
