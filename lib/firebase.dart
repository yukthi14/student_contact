import 'package:firebase_database/firebase_database.dart';
import 'package:student_contact/sqfliteDb/database.dart';

class FirebaseData {
  String thirdSem = "3rd Sem";
  String fifthSem = "5th Sem";
  String seventhSem = "7th Sem";
  var studentData = [];
  static bool sqflitePush = true;

  getStudentData() async {
    if (sqflitePush) {
      try {
        final ref = FirebaseDatabase.instance.ref();
        ref.once().then((var snapshot) async {
          print(snapshot.snapshot.children.length);

          for (DataSnapshot element in snapshot.snapshot.children) {
            studentData.add(element.value);
          }
          int i = 1;

          for (i = 1; i < studentData.length; i++) {
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
              DatabaseHelper.dbYearOfAdmission: studentData[i]
                  ["yearOfAdmission"],
            });
          }
        });
      } catch (e) {
        throw Exception(e.toString());
      }
      sqflitePush = false;
    }
  }

  checkingData() {
    print(studentData);
  }
}
