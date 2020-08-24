import 'package:CollegeManager/backend/auth.dart';
import 'package:CollegeManager/backend/classroomEvent.dart';
import 'package:CollegeManager/pages/classrooms/classEdit.dart';
import 'package:CollegeManager/pages/utils/all.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import 'package:calendar_views/day_view.dart';

@immutable
class Event {
  Event({
    @required this.startMinuteOfDay,
    @required this.duration,
    @required this.title,
  });

  final int startMinuteOfDay;
  final int duration;

  final String title;
}

/*List<Event> eventsOfDay0 = <Event>[
  new Event(startMinuteOfDay: 0, duration: 60, title: "Midnight Party"),
  new Event(
      startMinuteOfDay: 6 * 60, duration: 2 * 60, title: "Morning Routine"),
  new Event(startMinuteOfDay: 6 * 60, duration: 60, title: "Eat Breakfast"),
  new Event(startMinuteOfDay: 7 * 60, duration: 60, title: "Get Dressed"),
  new Event(
      startMinuteOfDay: 18 * 60, duration: 60, title: "Take Dog For A Walk"),
];*/

List<Event> eventsOfDay0 = List<Event>();
/*List<Event> eventsOfDay1 = <Event>[
  new Event(startMinuteOfDay: 1 * 60, duration: 90, title: "Sleep Walking"),
  new Event(startMinuteOfDay: 7 * 60, duration: 60, title: "Drive To Work"),
  new Event(startMinuteOfDay: 8 * 60, duration: 20, title: "A"),
  new Event(startMinuteOfDay: 8 * 60, duration: 30, title: "B"),
  new Event(startMinuteOfDay: 8 * 60, duration: 60, title: "C"),
  new Event(startMinuteOfDay: 8 * 60 + 10, duration: 20, title: "D"),
  new Event(startMinuteOfDay: 8 * 60 + 30, duration: 30, title: "E"),
  new Event(startMinuteOfDay: 23 * 60, duration: 60, title: "Midnight Snack"),
];*/

class ClassCalendar extends StatefulWidget {
  @override
  State createState() => new _ClassCalendarState();
}

class _ClassCalendarState extends State<ClassCalendar> {
  DateTime _day0;
  DateTime _day1;
  AuthServices authServices = new AuthServices();
  List<ClassEvent> classevents;

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

  getEvents() async {
    String day = getDay(DateTime.now().weekday.toString());
    classevents = await authServices.getClass("AC-101", day);
    List<Event> list = List<Event>();
    for (int i = 0; i < classevents.length; i++) {
      ClassEvent classEvent = classevents.elementAt(i);
      Event ev = new Event(
          startMinuteOfDay: classEvent.startMin,
          duration: classEvent.duration,
          title: classEvent.title);
      list.add(ev);
    }
    if (eventsOfDay0 != null) {
      setState(() {
        eventsOfDay0 = list;
      });
    }
  }

  @override
  void initState() {
    getEvents();

    //ClassEvent classEvent = new ClassEvent(0, 100, "my event", false);
    //authServices.updateAC101("Tuesday", classEvent);

    _day0 = new DateTime.now();
    //_day1 = _day0.toUtc().add(new Duration(days: 1)).toLocal();

    super.initState();
  }

  String _minuteOfDayToHourMinuteString(int minuteOfDay) {
    return "${(minuteOfDay ~/ 60).toString().padLeft(2, "0")}"
        ":"
        "${(minuteOfDay % 60).toString().padLeft(2, "0")}";
  }

  List<StartDurationItem> _getEventsOfDay(DateTime day) {
    List<Event> events;
    /*if (day.year == _day0.year &&
        day.month == _day0.month &&
        day.day == _day0.day) {
      events = eventsOfDay0;
    } else {
      //events = eventsOfDay1;
    }*/
    events = eventsOfDay0;

    return events
        .map(
          (event) => new StartDurationItem(
            startMinuteOfDay: event.startMinuteOfDay,
            duration: event.duration,
            builder: (context, itemPosition, itemSize) => _eventBuilder(
              context,
              itemPosition,
              itemSize,
              event,
            ),
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ClassEditPage()),
          ).then((value) {
                  setState(() {
                    getEvents();
                  });
                });
        },
        child: Icon(Icons.add),
      ),
      appBar: new AppBar(
        title: new Text("AC-101 Schedule"),
      ),
      body: new DayViewEssentials(
        properties: new DayViewProperties(
          days: <DateTime>[
            _day0,
            //_day1,
          ],
        ),
        child: new Column(
          children: <Widget>[
            new Container(
              color: Colors.grey[200],
              child: new DayViewDaysHeader(
                headerItemBuilder: _headerItemBuilder,
              ),
            ),
            new Expanded(
              child: new SingleChildScrollView(
                child: new DayViewSchedule(
                  heightPerMinute: 1.0,
                  components: <ScheduleComponent>[
                    new TimeIndicationComponent.intervalGenerated(
                      generatedTimeIndicatorBuilder:
                          _generatedTimeIndicatorBuilder,
                    ),
                    new SupportLineComponent.intervalGenerated(
                      generatedSupportLineBuilder: _generatedSupportLineBuilder,
                    ),
                    new DaySeparationComponent(
                      generatedDaySeparatorBuilder:
                          _generatedDaySeparatorBuilder,
                    ),
                    new EventViewComponent(
                      getEventsOfDay: _getEventsOfDay,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _headerItemBuilder(BuildContext context, DateTime day) {
    return new Container(
      color: Colors.grey[300],
      padding: new EdgeInsets.symmetric(vertical: 4.0),
      child: new Column(
        children: <Widget>[
          new Text(
            "${weekdayToAbbreviatedString(day.weekday)}",
            style: new TextStyle(fontWeight: FontWeight.bold),
          ),
          new Text("${day.day}"),
        ],
      ),
    );
  }

  Positioned _generatedTimeIndicatorBuilder(
    BuildContext context,
    ItemPosition itemPosition,
    ItemSize itemSize,
    int minuteOfDay,
  ) {
    return new Positioned(
      top: itemPosition.top,
      left: itemPosition.left,
      width: itemSize.width,
      height: itemSize.height,
      child: new Container(
        child: new Center(
          child: new Text(_minuteOfDayToHourMinuteString(minuteOfDay)),
        ),
      ),
    );
  }

  Positioned _generatedSupportLineBuilder(
    BuildContext context,
    ItemPosition itemPosition,
    double itemWidth,
    int minuteOfDay,
  ) {
    return new Positioned(
      top: itemPosition.top,
      left: itemPosition.left,
      width: itemWidth,
      child: new Container(
        height: 0.7,
        color: Colors.grey[700],
      ),
    );
  }

  Positioned _generatedDaySeparatorBuilder(
    BuildContext context,
    ItemPosition itemPosition,
    ItemSize itemSize,
    int daySeparatorNumber,
  ) {
    return new Positioned(
      top: itemPosition.top,
      left: itemPosition.left,
      width: itemSize.width,
      height: itemSize.height,
      child: new Center(
        child: new Container(
          width: 0.7,
          color: Colors.grey,
        ),
      ),
    );
  }

  Positioned _eventBuilder(
    BuildContext context,
    ItemPosition itemPosition,
    ItemSize itemSize,
    Event event,
  ) {
    return new Positioned(
      top: itemPosition.top,
      left: itemPosition.left,
      width: itemSize.width,
      height: itemSize.height,
      child: new Container(
        margin: new EdgeInsets.only(left: 1.0, right: 1.0, bottom: 1.0),
        padding: new EdgeInsets.all(3.0),
        color: Colors.green[200],
        child: new Text("${event.title}"),
      ),
    );
  }
}
