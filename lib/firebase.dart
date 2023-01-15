import 'package:firebase_database/firebase_database.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:student_contact/sqfliteDb/database.dart';

import 'constants.dart';

class FirebaseData {
  String thirdSem = "3rd Sem";
  String fifthSem = "5th Sem";
  String seventhSem = "7th Sem";
  var studentData = [];
  static bool sqfLitePush = true;

  getStudentData() async {
    SharedPreferences refps = await SharedPreferences.getInstance();
    try {
      final ref = FirebaseDatabase.instance.ref();
      ref.once().then((var snapshot) async {
        print(snapshot.snapshot.children.length);

        for (DataSnapshot element in snapshot.snapshot.children) {
          studentData.add(element.value);
        }
        int i = 1;

        for (i = 0; i < studentData.length; i++) {
          await DatabaseHelper.instance.insertRecord({
            DatabaseHelper.dbStudentName: studentData[i]["studentName"],
            DatabaseHelper.dbStudentNumber: studentData[i]["studentNumber"],
            DatabaseHelper.dbStudentUsn: studentData[i]["usn"],
            DatabaseHelper.dbAdmittedQuota: studentData[i]["admittedQuota"],
            DatabaseHelper.dbSec: studentData[i]["section"],
            DatabaseHelper.dbFatherName: studentData[i]["fatherName"],
            DatabaseHelper.dbFatherNumber: studentData[i]["fatherNumber"],
            DatabaseHelper.dbBranch: studentData[i]["branch"],
            DatabaseHelper.dbEmailAddress: studentData[i]["emailAddress "],
            DatabaseHelper.dbGender: studentData[i]["gender"],
            DatabaseHelper.dbSem: studentData[i]["sem"],
            DatabaseHelper.dbYearOfAdmission: studentData[i]["yearOfAdmission"],
            DatabaseHelper.dbimageUrl: studentData[i]["imageUrl"],
          });
        }
      });
    } catch (e) {
      throw Exception(e.toString());
    }
    refps.setString("checker", "done");
  }

  pushData(String name, String number, String usn, String fname, String fnumber,
      String email, String branch, String sem) async {
    SharedPreferences refs = await SharedPreferences.getInstance();
    int? val = refs.getInt("dataLength");

    DatabaseReference databse =
        FirebaseDatabase.instance.ref().child("${val! + 1}");
    await databse.update({
      'studentName': name,
      'studentNumber': number,
      'usn': usn,
      'branch': branch,
      'fatherName': fname,
      'fatherNumber': fnumber,
      'emailAddress ': email,
      'sem': sem,
    });
    refs.setInt("dataLength", val + 1);
  }

  deleteData(String usn) async {
    for (int i = 0; i <= Lists.lengthData; i++) {
      DatabaseReference databse =
          FirebaseDatabase.instance.ref().child("$i").child("usn");
      databse.once().then((var snapshot) async {
        if (snapshot.snapshot.value == usn) {
          DatabaseReference deleteDatabase =
              FirebaseDatabase.instance.ref().child("$i");
          await deleteDatabase.remove();
        }
      });
    }
  }

  updateData(String name, String number, String usn, String fname,
      String fnumber, String email, String branch, String sem) async {
    for (int i = 0; i <= Lists.lengthData; i++) {
      DatabaseReference databse =
          FirebaseDatabase.instance.ref().child("$i").child("usn");
      databse.once().then((var snapshot) async {
        if (snapshot.snapshot.value == usn) {
          DatabaseReference updateDatabase =
              FirebaseDatabase.instance.ref().child("$i");
          await updateDatabase.update({
            'studentName': name,
            'studentNumber': number,
            'branch': branch,
            'fatherName': fname,
            'fatherNumber': fnumber,
            'emailAddress ': email,
            'sem': sem,
          });
        }
      });
    }
  }

  imageUpload(String usn, String url) {
    for (int i = 0; i <= Lists.lengthData; i++) {
      DatabaseReference databse =
          FirebaseDatabase.instance.ref().child("$i").child("usn");
      databse.once().then((var snapshot) async {
        if (snapshot.snapshot.value == usn) {
          DatabaseReference deleteDatabase =
              FirebaseDatabase.instance.ref().child("$i");
          await deleteDatabase.update({'imageUrl': url});
        }
      });
    }
  }
}
