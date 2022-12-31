import 'package:firebase_database/firebase_database.dart';
import 'package:student_contact/sqfliteDb/database.dart';

class FirebaseData {
  String thirdSem = "3rd Sem";
  String fifthSem = "5th Sem";
  String seventhSem = "7th Sem";
  var studentData = [];
  bool sqflitePush = false;

  getData() async {
    try {
      final ref = FirebaseDatabase.instance.ref().child("7th Sem");
      ref.once().then((var snapshot) async {
        for (DataSnapshot element in snapshot.snapshot.children) {
          studentData.add(element.value);
        }
      });
      if (sqflitePush) {
        int i = 1;
        while (i < studentData.length) {
          print(i);
          await DatabaseHelper.instance.insertRecord({
            DatabaseHelper.dbStudentName: studentData[i]["studentName"],
            DatabaseHelper.dbStudentNumber: studentData[i]["studentNumber"],
            DatabaseHelper.dbStudentUsn: studentData[i]["usn"],
            DatabaseHelper.dbAdmittedQuota: studentData[i]["admittedQuota"],
            DatabaseHelper.dbSec: studentData[i]["section"],
            DatabaseHelper.dbBranch: studentData[i]["branch"],
            DatabaseHelper.dbEmailAddress: studentData[i]["emailAddress"],
            DatabaseHelper.dbGender: studentData[i]["gender"],
            DatabaseHelper.dbSem: studentData[i]["sem"],
            DatabaseHelper.dbYearOfAdmission: studentData[i]["yearOfAdmission"],
          });
          i++;
        }
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
