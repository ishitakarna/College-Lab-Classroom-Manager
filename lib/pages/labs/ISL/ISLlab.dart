import 'package:CollegeManager/backend/compStatus.dart';
import 'package:CollegeManager/pages/labs/ISL/ISLlabEdit.dart';
import 'package:flutter/material.dart';
import 'package:CollegeManager/backend/auth.dart';

class ISLLab extends StatefulWidget {
  @override
  _ISLLabState createState() => _ISLLabState();
}

class _ISLLabState extends State<ISLLab> {
  AuthServices authServices = new AuthServices();
  CompStatus compStatus;
  bool loading = true;
  bool loadingSeats = true;

  Future getData() async {
    compStatus = await authServices.getISLLabComp(compID);
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
        loading = false;
        loadingSeats = false;
      });
    }
  }

  bool compState00 = false;
  bool compState01 = false;
  bool compState02 = false;
  bool compState03 = false;
  bool compState04 = false;
  bool compState05 = false;
  bool compState06 = false;
  bool compState07 = false;
  bool compState08 = false;
  bool compState09 = false;
  bool compState10 = false;
  bool compState11 = false;
  bool compState12 = false;
  bool compState13 = false;
  bool compState14 = false;
  bool compState15 = false;
  bool compState16 = false;
  bool compState17 = false;
  bool compState18 = false;
  bool compState19 = false;

  bool loadingCompState00 = true;
  bool loadingCompState01 = true;
  bool loadingCompState02 = true;
  bool loadingCompState03 = true;
  bool loadingCompState04 = true;
  bool loadingCompState05 = true;
  bool loadingCompState06 = true;
  bool loadingCompState07 = true;
  bool loadingCompState08 = true;
  bool loadingCompState09 = true;
  bool loadingCompState10 = true;
  bool loadingCompState11 = true;
  bool loadingCompState12 = true;
  bool loadingCompState13 = true;
  bool loadingCompState14 = true;
  bool loadingCompState15 = true;
  bool loadingCompState16 = true;
  bool loadingCompState17 = true;
  bool loadingCompState18 = true;
  bool loadingCompState19 = true;

  String compID;

  var seatSize = 40.0;
  bool working = false;
  bool keyboard = false;
  bool mouse = false;
  bool internet = false;
  bool boot = false;
  var name = 'Kohinoor Chatterjee';
  var changedDate = '21st March, 2020';

  AuthServices auth = new AuthServices();
  List<CompStatus> comp = List(20);

  init() async {
    loadingSeats = true;
    compID = "00";
    // if (loadingCompState00)
    await getData();
    compState00 = compStatus.working;
    loadingCompState00 = false;

    loadingSeats = true;
    compID = "01";
    // if (loadingCompState01)
    await getData();
    compState01 = compStatus.working;
    loadingCompState01 = false;

    loadingSeats = true;
    compID = "02";
    // if (loadingCompState02)
    await getData();
    compState02 = compStatus.working;
    loadingCompState02 = false;

    loadingSeats = true;
    compID = "03";
    // if (loadingCompState03)
    await getData();
    compState03 = compStatus.working;
    loadingCompState03 = false;

    loadingSeats = true;
    compID = "04";
    // if (loadingCompState04)
    await getData();
    compState04 = compStatus.working;
    loadingCompState04 = false;

    loadingSeats = true;
    compID = "05";
    // if (loadingCompState05)
    await getData();
    compState05 = compStatus.working;
    loadingCompState05 = false;

    loadingSeats = true;
    compID = "06";
    // if (loadingCompState06)
    await getData();
    compState06 = compStatus.working;
    loadingCompState06 = false;

    loadingSeats = true;
    compID = "07";
    // if (loadingCompState07)
    await getData();
    compState07 = compStatus.working;
    loadingCompState07 = false;

    loadingSeats = true;
    compID = "08";
    // if (loadingCompState08)
    await getData();
    compState08 = compStatus.working;
    loadingCompState08 = false;

    loadingSeats = true;
    compID = "09";
    // if (loadingCompState09)
    await getData();
    compState09 = compStatus.working;
    loadingCompState09 = false;

    loadingSeats = true;
    compID = "10";
    // if (loadingCompState10)
    await getData();
    compState10 = compStatus.working;
    loadingCompState10 = false;

    loadingSeats = true;
    compID = "11";
    // if (loadingCompState11)
    await getData();
    compState11 = compStatus.working;
    loadingCompState11 = false;

    loadingSeats = true;
    compID = "12";
    // if (loadingCompState12)
    await getData();
    compState12 = compStatus.working;
    loadingCompState12 = false;

    loadingSeats = true;
    compID = "13";
    // if (loadingCompState13)
    await getData();
    compState13 = compStatus.working;
    loadingCompState13 = false;

    loadingSeats = true;
    compID = "14";
    // if (loadingCompState14)
    await getData();
    compState14 = compStatus.working;
    loadingCompState14 = false;

    loadingSeats = true;
    compID = "15";
    // if (loadingCompState15)
    await getData();
    compState15 = compStatus.working;
    loadingCompState15 = false;

    loadingSeats = true;
    compID = "16";
    // if (loadingCompState16)
    await getData();
    compState16 = compStatus.working;
    loadingCompState16 = false;

    loadingSeats = true;
    compID = "17";
    // if (loadingCompState17)
    await getData();
    compState17 = compStatus.working;
    loadingCompState17 = false;

    loadingSeats = true;
    compID = "18";
    // if (loadingCompState18)
    await getData();
    compState18 = compStatus.working;
    loadingCompState18 = false;

    loadingSeats = true;
    compID = "19";
    // if (loadingCompState19)
    await getData();
    compState19 = compStatus.working;
    loadingCompState19 = false;
  }

  @override
  void initState() {
    init();
    compID = "00";
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
                  title: Text("Labs Seating Arrangement",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      )),
                  background: Image.network(
                    "https://cdn.rit.edu/images/facility/ComputerAidedDesignLab.jpg",
                    fit: BoxFit.cover,
                  ),
                ))
          ];
        },
        body: loadingSeats
            ? Center(
                child: CircularProgressIndicator(
                    // backgroundColor: Colors.white,
                    ),
              )
            : Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                loadingCompState00
                    ? Center(
                        child: CircularProgressIndicator(
                            // backgroundColor: Colors.white,
                            ),
                      )
                    : IconButton(
                        icon: Icon(
                          Icons.event_seat,
                          color: compState00 ? Colors.green : Colors.red,
                          size: seatSize,
                        ),
                        onPressed: () async {
                          setState(() {
                            loading = true;
                            // compState00 = !compState00;
                            compID = "00";
                            // print(compState);
                          });
                          await getData();
                          loading
                              ? Center(
                                  child: CircularProgressIndicator(
                                      // backgroundColor: Colors.white,
                                      ),
                                )
                              : detailDialog(compState00, loadingCompState00);
                        }),
                SizedBox(
                  height: 15.0,
                ),
                loadingCompState01
                    ? Center(
                        child: CircularProgressIndicator(
                            // backgroundColor: Colors.white,
                            ),
                      )
                    : IconButton(
                        icon: Icon(
                          Icons.event_seat,
                          color: compState01 ? Colors.green : Colors.red,
                          size: seatSize,
                        ),
                        onPressed: () async {
                          setState(() {
                            loading = true;
                            // compState01 = !compState01;
                            // print(compState);
                            compID = "01";
                          });
                          await getData();
                          loading
                              ? Center(
                                  child: CircularProgressIndicator(
                                      // backgroundColor: Colors.white,
                                      ),
                                )
                              : detailDialog(compState01, loadingCompState01);
                        }),
                SizedBox(
                  height: 15.0,
                ),
                loadingCompState02
                    ? Center(
                        child: CircularProgressIndicator(
                            // backgroundColor: Colors.white,
                            ),
                      )
                    : IconButton(
                        icon: Icon(
                          Icons.event_seat,
                          color: compState02 ? Colors.green : Colors.red,
                          size: seatSize,
                        ),
                        onPressed: () async {
                          setState(() {
                            loading = true;
                            // compState02 = !compState02;
                            // print(compState);
                            compID = "02";
                          });
                          await getData();
                          loading
                              ? Center(
                                  child: CircularProgressIndicator(
                                      // backgroundColor: Colors.white,
                                      ),
                                )
                              : detailDialog(compState02, loadingCompState02);
                        }),
                SizedBox(
                  height: 15.0,
                ),
                loadingCompState03
                    ? Center(
                        child: CircularProgressIndicator(
                            // backgroundColor: Colors.white,
                            ),
                      )
                    : IconButton(
                        icon: Icon(
                          Icons.event_seat,
                          color: compState03 ? Colors.green : Colors.red,
                          size: seatSize,
                        ),
                        onPressed: () async {
                          setState(() {
                            loading = true;
                            // compState03 = !compState03;
                            // print(compState);
                            compID = "03";
                          });
                          await getData();
                          loading
                              ? Center(
                                  child: CircularProgressIndicator(
                                      // backgroundColor: Colors.white,
                                      ),
                                )
                              : detailDialog(compState03, loadingCompState03);
                        }),
                SizedBox(
                  height: 15.0,
                ),
                loadingCompState04
                    ? Center(
                        child: CircularProgressIndicator(
                            // backgroundColor: Colors.white,
                            ),
                      )
                    : IconButton(
                        icon: Icon(
                          Icons.event_seat,
                          color: compState04 ? Colors.green : Colors.red,
                          size: seatSize,
                        ),
                        onPressed: () async {
                          setState(() {
                            loading = true;
                            // compState04 = !compState04;
                            // print(compState);
                            compID = "04";
                          });
                          await getData();
                          loading
                              ? Center(
                                  child: CircularProgressIndicator(
                                      // backgroundColor: Colors.white,
                                      ),
                                )
                              : detailDialog(compState04, loadingCompState04);
                        }),
                SizedBox(
                  height: 15.0,
                ),
              ],
            ),
            SizedBox(width: 20.0),
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                loadingCompState05
                    ? Center(
                        child: CircularProgressIndicator(
                            // backgroundColor: Colors.white,
                            ),
                      )
                    : IconButton(
                        icon: Icon(
                          Icons.event_seat,
                          color: compState05 ? Colors.green : Colors.red,
                          size: seatSize,
                        ),
                        onPressed: () async {
                          setState(() {
                            loading = true;
                            // compState05 = !compState05;
                            // print(compState);
                            compID = "05";
                          });
                          await getData();
                          loading
                              ? Center(
                                  child: CircularProgressIndicator(
                                      // backgroundColor: Colors.white,
                                      ),
                                )
                              : detailDialog(compState05, loadingCompState05);
                        }),
                SizedBox(
                  height: 15.0,
                ),
                loadingCompState06
                    ? Center(
                        child: CircularProgressIndicator(
                            // backgroundColor: Colors.white,
                            ),
                      )
                    : IconButton(
                        icon: Icon(
                          Icons.event_seat,
                          color: compState06 ? Colors.green : Colors.red,
                          size: seatSize,
                        ),
                        onPressed: () async {
                          setState(() {
                            loading = true;
                            // compState06 = !compState06;
                            // print(compState);
                            compID = "06";
                          });
                          await getData();
                          loading
                              ? Center(
                                  child: CircularProgressIndicator(
                                      // backgroundColor: Colors.white,
                                      ),
                                )
                              : detailDialog(compState06, loadingCompState06);
                        }),
                SizedBox(
                  height: 15.0,
                ),
                loadingCompState07
                    ? Center(
                        child: CircularProgressIndicator(
                            // backgroundColor: Colors.white,
                            ),
                      )
                    : IconButton(
                        icon: Icon(
                          Icons.event_seat,
                          color: compState07 ? Colors.green : Colors.red,
                          size: seatSize,
                        ),
                        onPressed: () async {
                          setState(() {
                            loading = true;
                            // compState07 = !compState07;
                            // print(compState);
                            compID = "07";
                          });
                          await getData();
                          loading
                              ? Center(
                                  child: CircularProgressIndicator(
                                      // backgroundColor: Colors.white,
                                      ),
                                )
                              : detailDialog(compState07, loadingCompState07);
                        }),
                SizedBox(
                  height: 15.0,
                ),
                loadingCompState08
                    ? Center(
                        child: CircularProgressIndicator(
                            // backgroundColor: Colors.white,
                            ),
                      )
                    : IconButton(
                        icon: Icon(
                          Icons.event_seat,
                          color: compState08 ? Colors.green : Colors.red,
                          size: seatSize,
                        ),
                        onPressed: () async {
                          setState(() {
                            loading = true;
                            // compState08 = !compState08;
                            // print(compState);
                            compID = "08";
                          });
                          await getData();
                          loading
                              ? Center(
                                  child: CircularProgressIndicator(
                                      // backgroundColor: Colors.white,
                                      ),
                                )
                              : detailDialog(compState08, loadingCompState08);
                        }),
                SizedBox(
                  height: 15.0,
                ),
                loadingCompState09
                    ? Center(
                        child: CircularProgressIndicator(
                            // backgroundColor: Colors.white,
                            ),
                      )
                    : IconButton(
                        icon: Icon(
                          Icons.event_seat,
                          color: compState09 ? Colors.green : Colors.red,
                          size: seatSize,
                        ),
                        onPressed: () async {
                          setState(() {
                            loading = true;
                            // compState09 = !compState09;
                            // print(compState);
                            compID = "09";
                          });
                          await getData();
                          loading
                              ? Center(
                                  child: CircularProgressIndicator(
                                      // backgroundColor: Colors.white,
                                      ),
                                )
                              : detailDialog(compState09, loadingCompState09);
                        }),
                SizedBox(
                  height: 15.0,
                ),
              ],
            ),
            SizedBox(width: 40.0),
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                loadingCompState10
                    ? Center(
                        child: CircularProgressIndicator(
                            // backgroundColor: Colors.white,
                            ),
                      )
                    : IconButton(
                        icon: Icon(
                          Icons.event_seat,
                          color: compState10 ? Colors.green : Colors.red,
                          size: seatSize,
                        ),
                        onPressed: () async {
                          setState(() {
                            loading = true;
                            // compState10 = !compState10;
                            // print(compState);
                            compID = "10";
                          });
                          await getData();
                          loading
                              ? Center(
                                  child: CircularProgressIndicator(
                                      // backgroundColor: Colors.white,
                                      ),
                                )
                              : detailDialog(compState10, loadingCompState10);
                        }),
                SizedBox(
                  height: 15.0,
                ),
                loadingCompState11
                    ? Center(
                        child: CircularProgressIndicator(
                            // backgroundColor: Colors.white,
                            ),
                      )
                    : IconButton(
                        icon: Icon(
                          Icons.event_seat,
                          color: compState11 ? Colors.green : Colors.red,
                          size: seatSize,
                        ),
                        onPressed: () async {
                          setState(() {
                            loading = true;
                            // compState11 = !compState11;
                            // print(compState);
                            compID = "11";
                          });
                          await getData();
                          loading
                              ? Center(
                                  child: CircularProgressIndicator(
                                      // backgroundColor: Colors.white,
                                      ),
                                )
                              : detailDialog(compState11, loadingCompState11);
                        }),
                SizedBox(
                  height: 15.0,
                ),
                loadingCompState12
                    ? Center(
                        child: CircularProgressIndicator(
                            // backgroundColor: Colors.white,
                            ),
                      )
                    : IconButton(
                        icon: Icon(
                          Icons.event_seat,
                          color: compState12 ? Colors.green : Colors.red,
                          size: seatSize,
                        ),
                        onPressed: () async {
                          setState(() {
                            loading = true;
                            // compState12 = !compState12;
                            // print(compState);
                            compID = "12";
                          });
                          await getData();
                          loading
                              ? Center(
                                  child: CircularProgressIndicator(
                                      // backgroundColor: Colors.white,
                                      ),
                                )
                              : detailDialog(compState12, loadingCompState12);
                        }),
                SizedBox(
                  height: 15.0,
                ),
                loadingCompState13
                    ? Center(
                        child: CircularProgressIndicator(
                            // backgroundColor: Colors.white,
                            ),
                      )
                    : IconButton(
                        icon: Icon(
                          Icons.event_seat,
                          color: compState13 ? Colors.green : Colors.red,
                          size: seatSize,
                        ),
                        onPressed: () async {
                          setState(() {
                            loading = true;
                            // compState13 = !compState13;
                            // print(compState);
                            compID = "13";
                          });
                          await getData();
                          loading
                              ? Center(
                                  child: CircularProgressIndicator(
                                      // backgroundColor: Colors.white,
                                      ),
                                )
                              : detailDialog(compState13, loadingCompState13);
                        }),
                SizedBox(
                  height: 15.0,
                ),
                loadingCompState14
                    ? Center(
                        child: CircularProgressIndicator(
                            // backgroundColor: Colors.white,
                            ),
                      )
                    : IconButton(
                        icon: Icon(
                          Icons.event_seat,
                          color: compState14 ? Colors.green : Colors.red,
                          size: seatSize,
                        ),
                        onPressed: () async {
                          setState(() {
                            loading = true;
                            // compState14 = !compState14;
                            // print(compState);
                            compID = "14";
                          });
                          await getData();
                          loading
                              ? Center(
                                  child: CircularProgressIndicator(
                                      // backgroundColor: Colors.white,
                                      ),
                                )
                              : detailDialog(compState14, loadingCompState14);
                        }),
                SizedBox(
                  height: 15.0,
                ),
              ],
            ),
            SizedBox(width: 20.0),
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                loadingCompState15
                    ? Center(
                        child: CircularProgressIndicator(
                            // backgroundColor: Colors.white,
                            ),
                      )
                    : IconButton(
                        icon: Icon(
                          Icons.event_seat,
                          color: compState15 ? Colors.green : Colors.red,
                          size: seatSize,
                        ),
                        onPressed: () async {
                          setState(() {
                            loading = true;
                            // compState15 = !compState15;
                            // print(compState);
                            compID = "15";
                          });
                          await getData();
                          loading
                              ? Center(
                                  child: CircularProgressIndicator(
                                      // backgroundColor: Colors.white,
                                      ),
                                )
                              : detailDialog(compState15, loadingCompState15);
                        }),
                SizedBox(
                  height: 15.0,
                ),
                loadingCompState16
                    ? Center(
                        child: CircularProgressIndicator(
                            // backgroundColor: Colors.white,
                            ),
                      )
                    : IconButton(
                        icon: Icon(
                          Icons.event_seat,
                          color: compState16 ? Colors.green : Colors.red,
                          size: seatSize,
                        ),
                        onPressed: () async {
                          setState(() {
                            loading = true;
                            // compState16 = !compState16;
                            // print(compState);
                            compID = "16";
                          });
                          await getData();
                          loading
                              ? Center(
                                  child: CircularProgressIndicator(
                                      // backgroundColor: Colors.white,
                                      ),
                                )
                              : detailDialog(compState16, loadingCompState16);
                        }),
                SizedBox(
                  height: 15.0,
                ),
                loadingCompState17
                    ? Center(
                        child: CircularProgressIndicator(
                            // backgroundColor: Colors.white,
                            ),
                      )
                    : IconButton(
                        icon: Icon(
                          Icons.event_seat,
                          color: compState17 ? Colors.green : Colors.red,
                          size: seatSize,
                        ),
                        onPressed: () async {
                          setState(() {
                            loading = true;
                            // compState17 = !compState17;
                            // print(compState);
                            compID = "17";
                          });
                          await getData();
                          loading
                              ? Center(
                                  child: CircularProgressIndicator(
                                      // backgroundColor: Colors.white,
                                      ),
                                )
                              : detailDialog(compState17, loadingCompState17);
                        }),
                SizedBox(
                  height: 15.0,
                ),
                loadingCompState18
                    ? Center(
                        child: CircularProgressIndicator(
                            // backgroundColor: Colors.white,
                            ),
                      )
                    : IconButton(
                        icon: Icon(
                          Icons.event_seat,
                          color: compState18 ? Colors.green : Colors.red,
                          size: seatSize,
                        ),
                        onPressed: () async {
                          setState(() {
                            loading = true;
                            // compState18 = !compState18;
                            // print(compState);
                            compID = "18";
                          });
                          await getData();
                          loading
                              ? Center(
                                  child: CircularProgressIndicator(
                                      // backgroundColor: Colors.white,
                                      ),
                                )
                              : detailDialog(compState18, loadingCompState18);
                        }),
                SizedBox(
                  height: 15.0,
                ),
                loadingCompState19
                    ? Center(
                        child: CircularProgressIndicator(
                            // backgroundColor: Colors.white,
                            ),
                      )
                    : IconButton(
                        icon: Icon(
                          Icons.event_seat,
                          color: compState19 ? Colors.green : Colors.red,
                          size: seatSize,
                        ),
                        onPressed: () async {
                          setState(() {
                            loading = true;
                            // compState19 = !compState19;
                            // print(compState);
                            compID = "19";
                          });
                          await getData();
                          loading
                              ? Center(
                                  child: CircularProgressIndicator(
                                      // backgroundColor: Colors.white,
                                      ),
                                )
                              : detailDialog(compState19, loadingCompState19);
                        }),
                SizedBox(
                  height: 15.0,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> detailDialog(bool compState, bool loading) async {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Seat Information'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Status'),
                    compState ? Text('Working') : Text('Not Working'),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Keyboard'),
                    keyboard
                        ? Icon(
                            Icons.check,
                            color: Colors.green,
                          )
                        : Icon(Icons.cancel, color: Colors.red),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Mouse'),
                    mouse
                        ? Icon(
                            Icons.check,
                            color: Colors.green,
                          )
                        : Icon(Icons.cancel, color: Colors.red),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Internet'),
                    internet
                        ? Icon(
                            Icons.check,
                            color: Colors.green,
                          )
                        : Icon(Icons.cancel, color: Colors.red),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Booting'),
                    boot
                        ? Icon(
                            Icons.check,
                            color: Colors.green,
                          )
                        : Icon(Icons.cancel, color: Colors.red),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Reported By:'),
                    SizedBox(width: 5.0),
                    Flexible(
                        child: Text(
                      name,
                      // overflow: TextOverflow.fade,
                    )),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Changed On:'),
                    SizedBox(width: 10.0),
                    Flexible(child: Text(changedDate)),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    FlatButton(
                      child: Text(
                        'Edit',
                        style: TextStyle(fontSize: 17),
                      ),
                      color: Colors.transparent,
                      textColor: Colors.green,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LabEdit(compID)),
                        );
                      },
                    ),
                    FlatButton(
                      child: Text(
                        'OK',
                        style: TextStyle(fontSize: 17),
                      ),
                      color: Colors.transparent,
                      textColor: Colors.blue,
                      onPressed: () async {
                        Navigator.pop(context);
                        setState(() {
                          loading = true;
                        });
                        await init();
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          /* actions: , */
        );
      },
    );
  }
}
