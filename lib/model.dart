class Welcome {
  Welcome({
    required this.usn,
    required this.studentName,
    required this.branch,
    required this.emailAddress,
    required this.studentNumber,
    required this.gender,
    required this.sem,
  });

  String usn;
  String studentName;
  String branch;
  String emailAddress;
  int studentNumber;
  String gender;
  int sem;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        usn: json["usn"],
        studentName: json["studentName"],
        branch: json["branch"],
        emailAddress: json["emailAddress"],
        studentNumber: json["studentNumber"],
        gender: json["gender"],
        sem: json["sem"],
      );

  Map<String, dynamic> toMap() {
    Map<String, dynamic> data = {
      "usn": usn,
      "studentName": studentName,
      "branch": branch,
      "emailAddress ": emailAddress,
      "studentNumber ": studentNumber,
      "gender ": gender,
      "sem": sem
    };
    return data;
  }
}
