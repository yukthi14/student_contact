import 'package:firebase_database/firebase_database.dart';
import 'package:student_contact/sqfliteDb/database.dart';

class FirebaseData {
  String thirdSem = "3rd Sem";
  String fifthSem = "5th Sem";
  String seventhSem = "7th Sem";
  var studentData = [];
  static bool sqflitePush = true;

  getStudentData() async {
    // if (sqflitePush) {----make it visible for once run
    // try {
    //   final ref = FirebaseDatabase.instance.ref().child("5th Sem");
    //   ref.once().then((var snapshot) async {
    //     for (DataSnapshot element in snapshot.snapshot.children) {
    //       studentData.add(element.value);
    //     }
    //     int i = 1;
    //
    //     for (i = 1; i < studentData.length; i++) {
    //       print(i);
    //       await DatabaseHelper.instance.insertRecord({
    //         DatabaseHelper.dbStudentName: studentData[i]["studentName"],
    //         DatabaseHelper.dbStudentNumber: studentData[i]["studentNumber"],
    //         DatabaseHelper.dbStudentUsn: studentData[i]["usn"],
    //         DatabaseHelper.dbAdmittedQuota: studentData[i]["admittedQuota"],
    //         DatabaseHelper.dbSec: studentData[i]["section"],
    //         DatabaseHelper.dbBranch: studentData[i]["branch"],
    //         DatabaseHelper.dbEmailAddress: studentData[i]["emailAddress"],
    //         DatabaseHelper.dbGender: studentData[i]["gender"],
    //         DatabaseHelper.dbSem: studentData[i]["sem"],
    //         DatabaseHelper.dbYearOfAdmission: studentData[i]
    //             ["yearOfAdmission"],
    //       });
    //     }
    //   });
    // } catch (e) {
    //   throw Exception(e.toString());
    // }
    try {
      final ref = FirebaseDatabase.instance.ref();
      ref.once().then((var snapshot) async {
        print(snapshot.snapshot.children.length);

        for (DataSnapshot element in snapshot.snapshot.children) {
          // print(element.value);
          studentData.add(element.value);
          print(studentData);
          for (int k = 1; k < studentData.length; k++) {
            print("Hello $k ${studentData[k]["emailAddress "]}");
          }
        }

        int i = 1;

        for (i = 1; i < studentData.length; i++) {
          // print("Hello $i ${studentData[i]["studentNumber"]}");
          await DatabaseHelper.instance.insertRecord({
            DatabaseHelper.dbStudentName: studentData[i]["studentName"],
            DatabaseHelper.dbStudentNumber: studentData[i]["studentNumber"],
            DatabaseHelper.dbStudentUsn: studentData[i]["usn"],
            DatabaseHelper.dbAdmittedQuota: studentData[i]["admittedQuota"],
            DatabaseHelper.dbSec: studentData[i]["section"],
            DatabaseHelper.dbBranch: studentData[i]["branch"],
            DatabaseHelper.dbEmailAddress: studentData[i]["emailAddress "],
            DatabaseHelper.dbGender: studentData[i]["gender"],
            DatabaseHelper.dbSem: studentData[i]["sem"],
            DatabaseHelper.dbYearOfAdmission: studentData[i]["yearOfAdmission"],
          });
        }
      });
    } catch (e) {
      throw Exception(e.toString());
    }
    sqflitePush = false;
    // }----make it visible for once run
  }

  checkingData() {
    print(studentData);
  }
}
