import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:student_contact/firebase.dart';
import 'package:student_contact/sqflitedb/database.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerUSN = TextEditingController();
  final TextEditingController _controllerPhoneNumber = TextEditingController();
  final TextEditingController _controllerFatherName = TextEditingController();
  final TextEditingController _controllerFatherNumber = TextEditingController();
  final TextEditingController _controllerEmailId = TextEditingController();

  String? branchValue;
  String? semValue;
  final branch = ['ISE', 'CSE', 'ME', 'ECE', 'AI'];
  final sem = ['1', '2', '3', '4', '5', '6', '7', '8'];

  DropdownMenuItem<String> buildMenuItem(String item) =>
      DropdownMenuItem(value: item, child: Text(item));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.cyan.shade100,
      body: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.1,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        margin: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.03),
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.cyan.shade900,
                        ),
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.18),
                        child: Text(
                          "Student Details",
                          style: TextStyle(
                              fontSize: 30,
                              color: Colors.cyan.shade900,
                              fontWeight: FontWeight.w500),
                        )),
                  ],
                ),
              ),
            ],
          ),
          // --------------------------------CONTAINER WITH TEXTFIELD-------------------------------------
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.07,
            margin:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.cyan.shade100),
              borderRadius: BorderRadius.circular(40),
              boxShadow: [
                BoxShadow(
                  color: Colors.cyan.shade200,
                  offset: const Offset(
                    5.0,
                    5.0,
                  ),
                  blurRadius: 10.0,
                  spreadRadius: 2.0,
                ), //BoxShadow
                BoxShadow(
                  color: Colors.cyan.shade100,
                  offset: const Offset(0.0, 0.0),
                  blurRadius: 0.0,
                  spreadRadius: 0.0,
                ), //BoxShadow
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 30.0, top: 2),
              child: TextField(
                controller: _controllerName,
                decoration: const InputDecoration(
                  hintText: "Name",
                  border: InputBorder.none,
                ),
              ),
            ),
          ),

          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.07,
            margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.005),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.cyan.shade100),
              borderRadius: BorderRadius.circular(40),
              boxShadow: [
                BoxShadow(
                  color: Colors.cyan.shade200,
                  offset: const Offset(
                    5.0,
                    5.0,
                  ),
                  blurRadius: 10.0,
                  spreadRadius: 2.0,
                ), //BoxShadow
                BoxShadow(
                  color: Colors.cyan.shade100,
                  offset: const Offset(0.0, 0.0),
                  blurRadius: 0.0,
                  spreadRadius: 0.0,
                ), //BoxShadow
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 30.0, top: 2),
              child: TextField(
                controller: _controllerUSN,
                maxLength: 10,
                decoration: const InputDecoration(
                  hintText: "USN (can be delete,but not edited)",
                  counterText: "",
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.07,
            margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.005),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.cyan.shade100),
              borderRadius: BorderRadius.circular(40),
              boxShadow: [
                BoxShadow(
                  color: Colors.cyan.shade200,
                  offset: const Offset(
                    5.0,
                    5.0,
                  ),
                  blurRadius: 10.0,
                  spreadRadius: 2.0,
                ), //BoxShadow
                BoxShadow(
                  color: Colors.cyan.shade100,
                  offset: const Offset(0.0, 0.0),
                  blurRadius: 0.0,
                  spreadRadius: 0.0,
                ), //BoxShadow
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 30.0, top: 2),
              child: TextField(
                controller: _controllerPhoneNumber,
                keyboardType: TextInputType.number,
                maxLength: 10,
                decoration: const InputDecoration(
                  counterText: "",
                  hintText: "Phone Number",
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.07,
            margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.005),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.cyan.shade100),
              borderRadius: BorderRadius.circular(40),
              boxShadow: [
                BoxShadow(
                  color: Colors.cyan.shade200,
                  offset: const Offset(
                    5.0,
                    5.0,
                  ),
                  blurRadius: 10.0,
                  spreadRadius: 2.0,
                ), //BoxShadow
                BoxShadow(
                  color: Colors.cyan.shade100,
                  offset: const Offset(0.0, 0.0),
                  blurRadius: 0.0,
                  spreadRadius: 0.0,
                ), //BoxShadow
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 30.0, top: 2),
              child: TextField(
                controller: _controllerFatherName,
                decoration: const InputDecoration(
                  hintText: "Father Name",
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.07,
            margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.005),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.cyan.shade100),
              borderRadius: BorderRadius.circular(40),
              boxShadow: [
                BoxShadow(
                  color: Colors.cyan.shade200,
                  offset: const Offset(
                    5.0,
                    5.0,
                  ),
                  blurRadius: 10.0,
                  spreadRadius: 2.0,
                ), //BoxShadow
                BoxShadow(
                  color: Colors.cyan.shade100,
                  offset: const Offset(0.0, 0.0),
                  blurRadius: 0.0,
                  spreadRadius: 0.0,
                ), //BoxShadow
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 30.0, top: 2),
              child: TextField(
                controller: _controllerFatherNumber,
                keyboardType: TextInputType.number,
                maxLength: 10,
                decoration: const InputDecoration(
                  hintText: "Father Number",
                  counterText: "",
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.07,
            margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.005),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.cyan.shade100),
              borderRadius: BorderRadius.circular(40),
              boxShadow: [
                BoxShadow(
                  color: Colors.cyan.shade200,
                  offset: const Offset(
                    5.0,
                    5.0,
                  ),
                  blurRadius: 10.0,
                  spreadRadius: 2.0,
                ), //BoxShadow
                BoxShadow(
                  color: Colors.cyan.shade100,
                  offset: const Offset(0.0, 0.0),
                  blurRadius: 0.0,
                  spreadRadius: 0.0,
                ), //BoxShadow
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 30.0, top: 2),
              child: TextField(
                controller: _controllerEmailId,
                decoration: const InputDecoration(
                  hintText: "Email Id",
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          // ----------------------DROPDOWN BOX--------------------------------------------
          Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.45,
                margin: EdgeInsets.only(
                    left: MediaQuery.of(context).size.height * 0.02,
                    top: MediaQuery.of(context).size.height * 0.01),
                child: DropdownButton<String>(
                  hint: const Center(child: Text("Branch")),
                  isExpanded: true,
                  value: branchValue,
                  items: branch.map(buildMenuItem).toList(),
                  onChanged: (value) {
                    setState(() {
                      this.branchValue = value!;
                    });
                  },
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.45,
                margin: EdgeInsets.only(
                    left: MediaQuery.of(context).size.height * 0.01,
                    top: MediaQuery.of(context).size.height * 0.01),
                child: DropdownButton<String>(
                  hint: const Center(child: Text("Sem")),
                  isExpanded: true,
                  value: semValue,
                  items: sem.map(buildMenuItem).toList(),
                  onChanged: (value) {
                    setState(() {
                      semValue = value!;
                    });
                  },
                ),
              ),
            ],
          ),
          //------------------------SUBMIT BUTTON-------------------------------------------------
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () async {
                  if (_controllerUSN.text.contains(' ')) {
                    Fluttertoast.showToast(msg: "Remove Space");
                  } else if (int.parse(_controllerFatherNumber.text) <
                      6000000000) {
                    Fluttertoast.showToast(msg: "Invaild");
                  } else if (int.parse(_controllerPhoneNumber.text) <
                      6000000000) {
                    Fluttertoast.showToast(msg: "Invaild");
                  } else if (_controllerUSN.text.length != 10) {
                    Fluttertoast.showToast(msg: "Invalid USN");
                  } else if (_controllerEmailId.text.contains(' ')) {
                    Fluttertoast.showToast(msg: "Remove Space");
                  } else if (!(_controllerEmailId.text
                          .endsWith("@gmail.com")) &&
                      !(_controllerEmailId.text.endsWith("@hotmail.com")) &&
                      !(_controllerEmailId.text.endsWith(".in"))) {
                    Fluttertoast.showToast(msg: "Invalid Email Id");
                  } else {
                    await DatabaseHelper.instance.insertRecord({
                      DatabaseHelper.dbStudentName: _controllerName.text,
                      DatabaseHelper.dbStudentUsn: _controllerUSN.text,
                      DatabaseHelper.dbStudentNumber:
                          _controllerPhoneNumber.text,
                      DatabaseHelper.dbFatherName: _controllerFatherName.text,
                      DatabaseHelper.dbFatherNumber:
                          _controllerFatherNumber.text,
                      DatabaseHelper.dbEmailAddress: _controllerEmailId.text,
                      DatabaseHelper.dbBranch: branchValue,
                      DatabaseHelper.dbSem: semValue,
                    });
                    FirebaseData().pushData(
                        _controllerName.text,
                        _controllerPhoneNumber.text,
                        _controllerUSN.text,
                        _controllerFatherName.text,
                        _controllerFatherNumber.text,
                        _controllerEmailId.text,
                        branchValue!,
                        semValue!);
                    Fluttertoast.showToast(msg: "Inserted");
                    Navigator.pop(context);
                  }
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.3,
                  height: MediaQuery.of(context).size.height * 0.06,
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.09),
                  decoration: BoxDecoration(
                    color: Colors.cyan.shade800,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: const Center(
                      child: Text(
                    "Submit",
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  )),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
