import 'package:CollegeManager/backend/classroomEvent.dart';
import 'package:CollegeManager/backend/compStatus.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:CollegeManager/backend/user.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AuthServices {
  String userId;
  String name, email;
  int student;

  AuthServices() {
    DocumentReference documentReference = Firestore.instance.document("Users");

    documentReference.get().then((datasnapshot) {
      if (datasnapshot.exists) {
        this.userId = datasnapshot.data['user_id'];
        this.name = datasnapshot.data['name'];
        this.email = datasnapshot.data['email'];
        this.student = datasnapshot.data['student'];
      }
    });
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;

  //Creating the user object
  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  //auth change user stream
  Stream<User> get user {
    return _auth.onAuthStateChanged.map(_userFromFirebaseUser);
  }

  //sign in
  Future signIn(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //register
  Future register(
      String email, String password, String name, int student) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      databaseinit(user.uid, name, email, student);
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  void start(String userid) {
    DocumentReference documentReference =
        Firestore.instance.document("Users/" + userid);

    documentReference.get().then((datasnapshot) {
      if (datasnapshot.exists) {
        {
          this.userId = datasnapshot.data['user_id'];
          this.name = datasnapshot.data['name'];
          this.email = datasnapshot.data['email'];
          this.student = datasnapshot.data['student'];
        }
      }
    });
  }

  void databaseinit(String userid, String name, String email, int student) {
    final FirebaseMessaging firebaseMessaging = new FirebaseMessaging();
    DocumentReference documentReference =
        Firestore.instance.document("Users/" + userid);
    firebaseMessaging.getToken().then((token) {
      var data = {
        "user_id": userid,
        "name": name,
        "email": email,
        "student": student,
      };
      documentReference.setData(data).whenComplete(() {
        print("Document Added");
      }).catchError((e) {
        print(e);
        // print(userid);
        // print(name);
        // print(email);
      });
      var tokendata = {
        "pushToken": token,
      };
      DocumentReference doc = Firestore.instance.document("Token/" + userid);
      doc.setData(tokendata).whenComplete(() {
        print("Document Added");
      }).catchError((e) => print(e));
    }).catchError((err) {
      Fluttertoast.showToast(msg: err.message.toString());
    });
  }

  //sign out
  Future signout() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<CompStatus> getGMLLabComp(String compId) async {
    CompStatus compStatus;
    bool working, keyboard, mouse, internet, boot;
    String userId, changedDate, name;

    print("get function");
    print(compId);

    //DocumentReference documentReference = await
    //Firestore.instance.document("GM-Lab/" + compId);
    DocumentReference documentReference =
        Firestore.instance.collection("GM-Lab").document(compId);
    var datasnapshot = await documentReference.get();
    if (datasnapshot.exists) {
      working = datasnapshot.data['working'];
      keyboard = datasnapshot.data['keyboard'];
      mouse = datasnapshot.data['mouse'];
      internet = datasnapshot.data['internet'];
      boot = datasnapshot.data['boot'];
      compId = datasnapshot.data['comp_id'];
      userId = datasnapshot.data['user_id'];
      changedDate = datasnapshot.data['changed_date'];
      name = datasnapshot.data['name'];
      print("Data received");
    }

    print("working" + working.toString());
    compStatus = new CompStatus(working, keyboard, mouse, internet, boot,
        changedDate, name, compId, userId);
    return compStatus;
  }

  void updateGMLabComp(String compId, CompStatus compStatus) async {
    DocumentReference documentReference =
        Firestore.instance.document("GM-Lab/" + compId);
    var data = {
      "comp_id": compId,
      "user_id": compStatus.userId,
      "working": compStatus.working,
      "keyboard": compStatus.keyboard,
      "mouse": compStatus.mouse,
      "internet": compStatus.internet,
      "boot": compStatus.boot,
      "changed_date": compStatus.changedDate,
      "name": compStatus.name
    };
    documentReference.updateData(data).whenComplete(() {
      print("GML-Lab Computer Document Updated");
    }).catchError((e) => documentReference.setData(data).whenComplete(() {
          print("GML-Lab Computer Document Added");
        }).catchError((e) => print(e)));
  }

  Future<List<ClassEvent>> getClass(String className, String day) async {

    List<ClassEvent> events = List<ClassEvent>();

    QuerySnapshot querySnapshot = await Firestore.instance.collection(className).document(day).collection("Events").getDocuments();
    var list = querySnapshot.documents;
    for(int i = 0; i < querySnapshot.documents.length; i++) {
      int startMin, duration;
      String title;
      bool free;

      startMin =  list.elementAt(i).data["startMin"];
      duration =  list.elementAt(i).data["duration"];
      title =  list.elementAt(i).data["title"];
      free =  list.elementAt(i).data["free"];

      ClassEvent event = new ClassEvent(startMin, duration, title, free);
      events.add(event);
    }
    
    return events;
  }

  void updateClass(String day, ClassEvent classEvent) async {
    CollectionReference documentReference =
        Firestore.instance.collection("AC-101/" + day + "/Events");
    var data = {
      "startMin" : classEvent.startMin,
      "duration" : classEvent.duration,
      "title" : classEvent.title, 
      "free" : classEvent.free
    };
    documentReference.add(data).whenComplete(() {
      print("AC-101 Document Updated");
    }).catchError((e) => print(e));

  }

  Future<CompStatus> getFOSS1LabComp(String compId) async {
    CompStatus compStatus;
    bool working, keyboard, mouse, internet, boot;
    String userId, changedDate, name;

    print("get function");
    print(compId);

    //DocumentReference documentReference = await
    //Firestore.instance.document("GM-Lab/" + compId);
    DocumentReference documentReference =
        Firestore.instance.collection("FOSS1-Lab").document(compId);
    var datasnapshot = await documentReference.get();
    if (datasnapshot.exists) {
      working = datasnapshot.data['working'];
      keyboard = datasnapshot.data['keyboard'];
      mouse = datasnapshot.data['mouse'];
      internet = datasnapshot.data['internet'];
      boot = datasnapshot.data['boot'];
      compId = datasnapshot.data['comp_id'];
      userId = datasnapshot.data['user_id'];
      changedDate = datasnapshot.data['changed_date'];
      name = datasnapshot.data['name'];
      print("Data received");
    }

    print("working" + working.toString());
    compStatus = new CompStatus(working, keyboard, mouse, internet, boot,
        changedDate, name, compId, userId);
    return compStatus;
  }

  void updateFOSS1LabComp(String compId, CompStatus compStatus) async {
    DocumentReference documentReference =
        Firestore.instance.document("FOSS1-Lab/" + compId);
    var data = {
      "comp_id": compId,
      "user_id": compStatus.userId,
      "working": compStatus.working,
      "keyboard": compStatus.keyboard,
      "mouse": compStatus.mouse,
      "internet": compStatus.internet,
      "boot": compStatus.boot,
      "changed_date": compStatus.changedDate,
      "name": compStatus.name
    };
    documentReference.updateData(data).whenComplete(() {
      print("FOSS1-Lab Computer Document Updated");
    }).catchError((e) => documentReference.setData(data).whenComplete(() {
          print("FOSS1-Lab Computer Document Added");
        }).catchError((e) => print(e)));
  }

  Future<CompStatus> getFOSS2LabComp(String compId) async {
    CompStatus compStatus;
    bool working, keyboard, mouse, internet, boot;
    String userId, changedDate, name;

    print("get function");
    print(compId);

    //DocumentReference documentReference = await
    //Firestore.instance.document("GM-Lab/" + compId);
    DocumentReference documentReference =
        Firestore.instance.collection("FOSS2-Lab").document(compId);
    var datasnapshot = await documentReference.get();
    if (datasnapshot.exists) {
      working = datasnapshot.data['working'];
      keyboard = datasnapshot.data['keyboard'];
      mouse = datasnapshot.data['mouse'];
      internet = datasnapshot.data['internet'];
      boot = datasnapshot.data['boot'];
      compId = datasnapshot.data['comp_id'];
      userId = datasnapshot.data['user_id'];
      changedDate = datasnapshot.data['changed_date'];
      name = datasnapshot.data['name'];
      print("Data received");
    }

    print("working" + working.toString());
    compStatus = new CompStatus(working, keyboard, mouse, internet, boot,
        changedDate, name, compId, userId);
    return compStatus;
  }

  void updateFOSS2LabComp(String compId, CompStatus compStatus) async {
    DocumentReference documentReference =
        Firestore.instance.document("FOSS2-Lab/" + compId);
    var data = {
      "comp_id": compId,
      "user_id": compStatus.userId,
      "working": compStatus.working,
      "keyboard": compStatus.keyboard,
      "mouse": compStatus.mouse,
      "internet": compStatus.internet,
      "boot": compStatus.boot,
      "changed_date": compStatus.changedDate,
      "name": compStatus.name
    };
    documentReference.updateData(data).whenComplete(() {
      print("FOSS2-Lab Computer Document Updated");
    }).catchError((e) => documentReference.setData(data).whenComplete(() {
          print("FOSS2-Lab Computer Document Added");
        }).catchError((e) => print(e)));
  }

  Future<CompStatus> getISLLabComp(String compId) async {
    CompStatus compStatus;
    bool working, keyboard, mouse, internet, boot;
    String userId, changedDate, name;

    print("get function");
    print(compId);

    //DocumentReference documentReference = await
    //Firestore.instance.document("GM-Lab/" + compId);
    DocumentReference documentReference =
        Firestore.instance.collection("ISL-Lab").document(compId);
    var datasnapshot = await documentReference.get();
    if (datasnapshot.exists) {
      working = datasnapshot.data['working'];
      keyboard = datasnapshot.data['keyboard'];
      mouse = datasnapshot.data['mouse'];
      internet = datasnapshot.data['internet'];
      boot = datasnapshot.data['boot'];
      compId = datasnapshot.data['comp_id'];
      userId = datasnapshot.data['user_id'];
      changedDate = datasnapshot.data['changed_date'];
      name = datasnapshot.data['name'];
      print("Data received");
    }

    print("working" + working.toString());
    compStatus = new CompStatus(working, keyboard, mouse, internet, boot,
        changedDate, name, compId, userId);
    return compStatus;
  }

  void updateISLLabComp(String compId, CompStatus compStatus) async {
    DocumentReference documentReference =
        Firestore.instance.document("ISL-Lab/" + compId);
    var data = {
      "comp_id": compId,
      "user_id": compStatus.userId,
      "working": compStatus.working,
      "keyboard": compStatus.keyboard,
      "mouse": compStatus.mouse,
      "internet": compStatus.internet,
      "boot": compStatus.boot,
      "changed_date": compStatus.changedDate,
      "name": compStatus.name
    };
    documentReference.updateData(data).whenComplete(() {
      print("ISL-Lab Computer Document Updated");
    }).catchError((e) => documentReference.setData(data).whenComplete(() {
          print("ISL-Lab Computer Document Added");
        }).catchError((e) => print(e)));
  }

  Future<CompStatus> getProgramLabComp(String compId) async {
    CompStatus compStatus;
    bool working, keyboard, mouse, internet, boot;
    String userId, changedDate, name;

    print("get function");
    print(compId);

    //DocumentReference documentReference = await
    //Firestore.instance.document("GM-Lab/" + compId);
    DocumentReference documentReference =
        Firestore.instance.collection("Program-Lab").document(compId);
    var datasnapshot = await documentReference.get();
    if (datasnapshot.exists) {
      working = datasnapshot.data['working'];
      keyboard = datasnapshot.data['keyboard'];
      mouse = datasnapshot.data['mouse'];
      internet = datasnapshot.data['internet'];
      boot = datasnapshot.data['boot'];
      compId = datasnapshot.data['comp_id'];
      userId = datasnapshot.data['user_id'];
      changedDate = datasnapshot.data['changed_date'];
      name = datasnapshot.data['name'];
      print("Data received");
    }

    print("working" + working.toString());
    compStatus = new CompStatus(working, keyboard, mouse, internet, boot,
        changedDate, name, compId, userId);
    return compStatus;
  }

  void updateProgramLabComp(String compId, CompStatus compStatus) async {
    DocumentReference documentReference =
        Firestore.instance.document("Program-Lab/" + compId);
    var data = {
      "comp_id": compId,
      "user_id": compStatus.userId,
      "working": compStatus.working,
      "keyboard": compStatus.keyboard,
      "mouse": compStatus.mouse,
      "internet": compStatus.internet,
      "boot": compStatus.boot,
      "changed_date": compStatus.changedDate,
      "name": compStatus.name
    };
    documentReference.updateData(data).whenComplete(() {
      print("Program-Lab Computer Document Updated");
    }).catchError((e) => documentReference.setData(data).whenComplete(() {
          print("Program-Lab Computer Document Added");
        }).catchError((e) => print(e)));
  }

  Future<CompStatus> getASLLabComp(String compId) async {
    CompStatus compStatus;
    bool working, keyboard, mouse, internet, boot;
    String userId, changedDate, name;

    print("get function");
    print(compId);

    //DocumentReference documentReference = await
    //Firestore.instance.document("GM-Lab/" + compId);
    DocumentReference documentReference =
        Firestore.instance.collection("ASL-Lab").document(compId);
    var datasnapshot = await documentReference.get();
    if (datasnapshot.exists) {
      working = datasnapshot.data['working'];
      keyboard = datasnapshot.data['keyboard'];
      mouse = datasnapshot.data['mouse'];
      internet = datasnapshot.data['internet'];
      boot = datasnapshot.data['boot'];
      compId = datasnapshot.data['comp_id'];
      userId = datasnapshot.data['user_id'];
      changedDate = datasnapshot.data['changed_date'];
      name = datasnapshot.data['name'];
      print("Data received");
    }

    print("working" + working.toString());
    compStatus = new CompStatus(working, keyboard, mouse, internet, boot,
        changedDate, name, compId, userId);
    return compStatus;
  }

  void updateASLLabComp(String compId, CompStatus compStatus) async {
    DocumentReference documentReference =
        Firestore.instance.document("ASL-Lab/" + compId);
    var data = {
      "comp_id": compId,
      "user_id": compStatus.userId,
      "working": compStatus.working,
      "keyboard": compStatus.keyboard,
      "mouse": compStatus.mouse,
      "internet": compStatus.internet,
      "boot": compStatus.boot,
      "changed_date": compStatus.changedDate,
      "name": compStatus.name
    };
    documentReference.updateData(data).whenComplete(() {
      print("ASL-Lab Computer Document Updated");
    }).catchError((e) => documentReference.setData(data).whenComplete(() {
          print("ASL-Lab Computer Document Added");
        }).catchError((e) => print(e)));
  }

  Future<CompStatus> getDLLabComp(String compId) async {
    CompStatus compStatus;
    bool working, keyboard, mouse, internet, boot;
    String userId, changedDate, name;

    print("get function");
    print(compId);

    //DocumentReference documentReference = await
    //Firestore.instance.document("GM-Lab/" + compId);
    DocumentReference documentReference =
        Firestore.instance.collection("DL-Lab").document(compId);
    var datasnapshot = await documentReference.get();
    if (datasnapshot.exists) {
      working = datasnapshot.data['working'];
      keyboard = datasnapshot.data['keyboard'];
      mouse = datasnapshot.data['mouse'];
      internet = datasnapshot.data['internet'];
      boot = datasnapshot.data['boot'];
      compId = datasnapshot.data['comp_id'];
      userId = datasnapshot.data['user_id'];
      changedDate = datasnapshot.data['changed_date'];
      name = datasnapshot.data['name'];
      print("Data received");
    }

    print("working" + working.toString());
    compStatus = new CompStatus(working, keyboard, mouse, internet, boot,
        changedDate, name, compId, userId);
    return compStatus;
  }

  void updateDLLabComp(String compId, CompStatus compStatus) async {
    DocumentReference documentReference =
        Firestore.instance.document("DL-Lab/" + compId);
    var data = {
      "comp_id": compId,
      "user_id": compStatus.userId,
      "working": compStatus.working,
      "keyboard": compStatus.keyboard,
      "mouse": compStatus.mouse,
      "internet": compStatus.internet,
      "boot": compStatus.boot,
      "changed_date": compStatus.changedDate,
      "name": compStatus.name
    };
    documentReference.updateData(data).whenComplete(() {
      print("DL-Lab Computer Document Updated");
    }).catchError((e) => documentReference.setData(data).whenComplete(() {
          print("DL-Lab Computer Document Added");
        }).catchError((e) => print(e)));
  }
}
