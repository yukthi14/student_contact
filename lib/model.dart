// // To parse this JSON data, do
// //
// //     final welcome = welcomeFromJson(jsonString);
//
// import 'dart:convert';
//
// Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));
//
// String welcomeToJson(Welcome data) => json.encode(data.toJson());
//
// class Welcome {
//   Welcome({
//     required this.the3RdSem,
//     required this.the5ThSem,
//     required this.the7ThSem,
//   });
//
//   List<The3RdSem> the3RdSem;
//   List<The5ThSem> the5ThSem;
//   List<The7ThSem> the7ThSem;
//
//   factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
//     the3RdSem: List<The3RdSem>.from(json["3rd Sem "].map((x) => The3RdSem.fromJson(x))),
//     the5ThSem: List<The5ThSem>.from(json["5th Sem"].map((x) => The5ThSem.fromJson(x))),
//     the7ThSem: List<The7ThSem>.from(json["7th Sem"].map((x) => The7ThSem.fromJson(x))),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "3rd Sem ": List<dynamic>.from(the3RdSem.map((x) => x.toJson())),
//     "5th Sem": List<dynamic>.from(the5ThSem.map((x) => x.toJson())),
//     "7th Sem": List<dynamic>.from(the7ThSem.map((x) => x.toJson())),
//   };
// }
//
// class The3RdSem {
//   The3RdSem({
//     required this.usn,
//     required this.studentName,
//     required this.branch,
//     required this.emailAddress,
//     this.studentNumber,
//     required this.gender,
//     required this.sem,
//   });
//
//   String usn;
//   String studentName;
//   Branch branch;
//   The3RdSemYearOfAdmission yearOfAdmission;
//   String admittedQuota;
//   String emailAddress;
//   dynamic studentNumber;
//   Gender gender;
//   int sem;
//
//   factory The3RdSem.fromJson(Map<String, dynamic> json) => The3RdSem(
//     usn: json["usn"],
//     studentName: json["studentName"],
//     branch: branchValues.map[json["branch"]],
//     emailAddress: json["emailAddress "],
//     studentNumber: json["studentNumber "],
//     gender: genderValues.map[json["gender "]],
//     sem: json["sem"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "usn": usn,
//     "studentName": studentName,
//     "branch": branchValues.reverse[branch],
//     "yearOfAdmission": the3RdSemYearOfAdmissionValues.reverse[yearOfAdmission],
//     "admittedQuota": admittedQuota,
//     "emailAddress ": emailAddress,
//     "studentNumber ": studentNumber,
//     "gender ": genderValues.reverse[gender],
//     "sem": sem,
//   };
// }
//
// enum Branch { ISE, BRANCH_ISE }
//
// final branchValues = EnumValues({
//   "ISE ": Branch.BRANCH_ISE,
//   "ISE": Branch.ISE
// });
//
//
//
//
//
// class The5ThSem {
//   The5ThSem({
//     required this.usn,
//     required this.studentName,
//     required this.branch,
//
//     required this.section,
//
//     required this.emailAddress,
//     this.studentNumber,
//     required this.gender,
//     required this.sem,
//   });
//
//   String usn;
//   String studentName;
//   Branch branch;
//
//   Section section;
//
//   String emailAddress;
//   dynamic studentNumber;
//
//   int sem;
//
//   factory The5ThSem.fromJson(Map<String, dynamic> json) => The5ThSem(
//     usn: json["usn"],
//     studentName: json["studentName"],
//     branch: branchValues.map[json["branch"]],
//
//     section: sectionValues.map[json["section"]],
//
//     emailAddress: json["emailAddress "],
//     studentNumber: json["studentNumber"],
//
//     sem: json["sem"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "usn": usn,
//     "studentName": studentName,
//     "branch": branchValues.reverse[branch],
//
//     "section": sectionValues.reverse[section],
//
//     "emailAddress ": emailAddress,
//     "studentNumber": studentNumber,
//
//     "sem": sem,
//   };
// }
//
//
//
// enum Section { B, A }
//
// final sectionValues = EnumValues({
//   "A": Section.A,
//   "B": Section.B
// });
//
// class The7ThSem {
//   The7ThSem({
//     required this.studentUsn,
//     required this.studentName,
//     required this.branch,
//
//     required this.section,
//
//     required this.emailAddress,
//     required this.studentNumber,
//
//     required this.sem,
//   });
//
//   String studentUsn;
//   String studentName;
//   Branch branch;
//
//   Section section;
//
//   String emailAddress;
//   int studentNumber;
//
//   int sem;
//
//   factory The7ThSem.fromJson(Map<String, dynamic> json) => The7ThSem(
//     studentUsn: json["studentUsn"],
//     studentName: json["studentName"],
//     branch: branchValues.map[json["branch"]],
//
//     section: sectionValues.map[json["section"]],
//     emailAddress: json["emailAddress"],
//     studentNumber: json["studentNumber"],
//     sem: json["sem"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "studentUsn": studentUsn,
//     "studentName": studentName,
//     "branch": branchValues.reverse[branch],
//     "section": sectionValues.reverse[section],
//     "emailAddress": emailAddress,
//     "studentNumber": studentNumber,
//     "sem": sem,
//   };
// }
//
//
//
//
// class EnumValues<T> {
//   Map<String, T> map;
//   Map<T, String> reverseMap;
//
//   EnumValues(this.map);
//
//   Map<T, String> get reverse {
//     if (reverseMap == null) {
//       reverseMap = map.map((k, v) => new MapEntry(v, k));
//     }
//     return reverseMap;
//   }
// }
