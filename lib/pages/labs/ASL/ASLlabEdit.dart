import 'package:CollegeManager/backend/auth.dart';
import 'package:CollegeManager/backend/compStatus.dart';
import 'package:flutter/material.dart';

class LabEdit extends StatefulWidget {
  String compID;

  LabEdit(String compID) {
    this.compID = compID;
  }

  @override
  _LabEditState createState() => _LabEditState();
}

class _LabEditState extends State<LabEdit> {
  AuthServices authServices = new AuthServices();
  CompStatus compStatus;
  var loading = true;

  int selectedRadio = 0;
  bool working = false,
      keyboard = false,
      mouse = false,
      internet = false,
      boot = false;
  String name = "Ishita",
      changedDate = "20 March, 2020",
      userId = "0",
      compId = "1";

  getData() async {
    compStatus = await authServices.getASLLabComp(widget.compID);
    if (compStatus.working != null) {
      setState(() {
        working = compStatus.working;
        print(working);
        keyboard = compStatus.keyboard;
        mouse = compStatus.mouse;
        internet = compStatus.internet;
        boot = compStatus.boot;
        name = compStatus.name;
        changedDate = compStatus.changedDate;
        if (working == true)
          selectedRadio = 1;
        else
          selectedRadio = 2;
      });
    }
    loading = false;
  }

  @override
  void initState() {
    getData();
    //print(compStatus.compId);
    super.initState();
  }

  setSelectedRadio(int val) {
    setState(() {
      selectedRadio = val;
      if (val == 1) {
        working = true;
        keyboard = true;
        mouse = true;
        internet = true;
        boot = true;
      } else
        working = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                    expandedHeight: 200.0,
                    floating: false,
                    pinned: true,
                    flexibleSpace: FlexibleSpaceBar(
                      centerTitle: true,
                      title: Text("Seat Edit Page",
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
            body: loading
                ? Center(
                    child: CircularProgressIndicator(
                        // backgroundColor: Colors.white,
                        ),
                  )
                : SingleChildScrollView(
                    child: Container(
                        width: MediaQuery.of(context).size.width * 0.85,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              height: 20.0,
                            ),
                            Row(
                              children: <Widget>[
                                SizedBox(
                                  width: 25.0,
                                ),
                                Text(
                                  'Computer Status:',
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                GestureDetector(
                                  onTap: () {
                                    print("Radio 1");
                                    working = true;
                                    setSelectedRadio(1);
                                    setState(() {});
                                  },
                                  child: Row(
                                    children: <Widget>[
                                      SizedBox(
                                        width: 25.0,
                                      ),
                                      Radio(
                                        value: 1,
                                        groupValue: selectedRadio,
                                        activeColor: Colors.green,
                                        onChanged: (val) {
                                          print("Radio $val");
                                          setSelectedRadio(val);
                                        },
                                      ),
                                      Text(
                                        'Working',
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
                                    working = false;
                                    setSelectedRadio(2);
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: <Widget>[
                                      SizedBox(
                                        width: 25.0,
                                      ),
                                      Radio(
                                        value: 2,
                                        groupValue: selectedRadio,
                                        activeColor: Colors.red,
                                        onChanged: (val) {
                                          print("Radio $val");
                                          setSelectedRadio(val);
                                        },
                                      ),
                                      Text(
                                        'Not Working',
                                        style: TextStyle(
                                            fontSize: 17.0,
                                            fontWeight: FontWeight.normal),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            // SizedBox(
                            //   height: 20.0,
                            // ),
                            new Divider(
                              color: Colors.black,
                              height: 30.0,
                            ),
                            //checkbox
                            Row(
                              children: <Widget>[
                                SizedBox(
                                  width: 25.0,
                                ),
                                Text(
                                  'Working components',
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(
                                  width: 25.0,
                                ),
                                Checkbox(
                                  value: keyboard,
                                  onChanged: (bool value) {
                                    setState(() {
                                      keyboard = value;
                                    });
                                  },
                                ),
                                Text(
                                  "Keyboard",
                                  style: TextStyle(
                                      fontSize: 17.0,
                                      fontWeight: FontWeight.normal),
                                ),
                              ],
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(
                                  width: 25.0,
                                ),
                                Checkbox(
                                  value: mouse,
                                  onChanged: (bool value) {
                                    setState(() {
                                      mouse = value;
                                    });
                                  },
                                ),
                                Text(
                                  "Mouse",
                                  style: TextStyle(
                                      fontSize: 17.0,
                                      fontWeight: FontWeight.normal),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(
                                  width: 25.0,
                                ),
                                Checkbox(
                                  value: internet,
                                  onChanged: (bool value) {
                                    setState(() {
                                      internet = value;
                                    });
                                  },
                                ),
                                Text(
                                  "Internet",
                                  style: TextStyle(
                                      fontSize: 17.0,
                                      fontWeight: FontWeight.normal),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(
                                  width: 25.0,
                                ),
                                Checkbox(
                                  value: boot,
                                  onChanged: (bool value) {
                                    setState(() {
                                      boot = value;
                                    });
                                  },
                                ),
                                Text(
                                  "Booting",
                                  style: TextStyle(
                                      fontSize: 17.0,
                                      fontWeight: FontWeight.normal),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                FlatButton(
                                  child: Text(
                                    'Submit',
                                    style: TextStyle(fontSize: 17),
                                  ),
                                  // color: Colors.transparent,
                                  textColor: Colors.green,
                                  onPressed: () {
                                    print('Submit Button Pressed');
                                    changedDate = DateTime.now().toString();
                                    compStatus = new CompStatus(
                                        working,
                                        keyboard,
                                        mouse,
                                        internet,
                                        boot,
                                        changedDate,
                                        name,
                                        compId,
                                        userId);
                                    authServices.updateASLLabComp(
                                        widget.compID, compStatus);
                                    Navigator.pop(context);
                                  },
                                ),
                                FlatButton(
                                  child: Text(
                                    'Cancel',
                                    style: TextStyle(fontSize: 17),
                                  ),
                                  // color: Colors.transparent,
                                  textColor: Colors.red,
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            ),
                          ],
                        )),
                  )));
  }
}
