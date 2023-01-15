import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:student_contact/SecondPage.dart';
import 'package:student_contact/ThirdPage.dart';
import 'package:student_contact/firebase.dart';
import 'package:student_contact/sqfliteDb/database.dart';

import 'constants.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  void initState() {
    setVal();
    if (checker == "") {
      FirebaseData().getStudentData();
    }
    super.initState();
  }

  setVal() async {
    SharedPreferences ref = await SharedPreferences.getInstance();
    ref.setString("checker", "");
    checker = ref.getString("checker")!;
  }

  String checker = "";
  String? value;
  String? value1;
  final branch = ['ISE', 'CSE', 'ME', 'ECE', 'AI'];
  final sem = ['1', '2', '3', '4', '5', '6', '7', '8'];
  final TextEditingController _controllerSearch = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // backgroundColor: Colors.cyan.shade100,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/dark.jpg'),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          children: <Widget>[
            Row(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.35,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.lightBlue.shade600,
                      borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(90),
                          bottomLeft: Radius.circular(90))),
                  child: Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.13,
                          left: MediaQuery.of(context).size.width * 0.02,
                        ),
                        child: const Text(
                          "Contact App",
                          style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.293,
                          left: MediaQuery.of(context).size.width * 0.03,
                          right: MediaQuery.of(context).size.width * 0.03,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.blue.shade100,
                          borderRadius: BorderRadius.circular(30),
                          border:
                              Border.all(width: 3, color: Colors.blue.shade900),
                          // boxShadow: [
                          //   BoxShadow(
                          //     color: Colors.cyan.shade200,
                          //     offset: const Offset(
                          //       8.0,
                          //       8.0,
                          //     ),
                          //     blurRadius: 10.0,
                          //     spreadRadius: 2.0,
                          //   ), //BoxShadow
                          //   BoxShadow(
                          //     color: Colors.cyan.shade100,
                          //     offset: const Offset(0.0, 0.0),
                          //     blurRadius: 0.0,
                          //     spreadRadius: 0.0,
                          //   ), //BoxShadow
                          // ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.75,
                              height: MediaQuery.of(context).size.height * 0.05,
                              // margin: EdgeInsets.only(
                              //   left: MediaQuery.of(context).size.width * 0.07,
                              // ),
                              child: TextField(
                                maxLength: 10,
                                controller: _controllerSearch,
                                decoration: const InputDecoration(
                                    counterText: "",
                                    hintText: "Search by USN",
                                    border: InputBorder.none),
                              ),
                            ),
                            GestureDetector(
                                onTap: () async {
                                  if (_controllerSearch.text.length == 10) {
                                    try {
                                      Lists.studentData = await DatabaseHelper
                                          .instance
                                          .queryStudentRecord(_controllerSearch
                                              .text
                                              .toUpperCase());

                                      Navigator.push(
                                          context,
                                          CupertinoPageRoute(
                                              builder: (context) =>
                                                  const ThirdPage(
                                                    dataCall: false,
                                                  )));
                                    } catch (e) {
                                      print(e.toString());
                                      Fluttertoast.showToast(
                                          msg: "Invalid USN");
                                    }
                                  } else if (_controllerSearch.text.length <
                                      10) {
                                    Fluttertoast.showToast(msg: "Invalid USN");
                                  }
                                },
                                child: const Icon(Icons.search))
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            //------------------SEARCH BAR---------------------------------
            Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.45,
                  margin: EdgeInsets.only(
                      left: MediaQuery.of(context).size.height * 0.02,
                      top: MediaQuery.of(context).size.height * 0.02),
                  child: DropdownButton<String>(
                    style: const TextStyle(color: Colors.white),
                    iconEnabledColor: Colors.blue.shade50,
                    dropdownColor: Colors.blue.shade200,
                    hint: Center(
                        child: Text(
                      "Branch",
                      style: TextStyle(color: Colors.blue.shade50),
                    )),
                    isExpanded: true,
                    value: value,
                    items: branch.map(buildMenuItem).toList(),
                    onChanged: (value) {
                      setState(() {
                        this.value = value!;
                      });
                    },
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.45,
                  margin: EdgeInsets.only(
                      left: MediaQuery.of(context).size.height * 0.01,
                      top: MediaQuery.of(context).size.height * 0.02),
                  child: DropdownButton<String>(
                    style: const TextStyle(color: Colors.white),
                    iconEnabledColor: Colors.blue.shade50,
                    dropdownColor: Colors.blue.shade200,
                    hint: Center(
                        child: Text(
                      "Sem",
                      style: TextStyle(color: Colors.blue.shade50),
                    )),
                    isExpanded: true,
                    value: value1,
                    items: sem.map(buildMenuItem).toList(),
                    onChanged: (value) {
                      setState(() {
                        value1 = value!;
                      });
                    },
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: () async {
                if (value != null || value1 != null) {
                  if (value == null) {
                    Lists.studentData =
                        await DatabaseHelper.instance.queryBySemester(value1!);
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => const ThirdPage(
                                  dataCall: false,
                                )));
                  } else if (value1 == null) {
                    Lists.studentData =
                        await DatabaseHelper.instance.queryByBranch(value!);
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => const ThirdPage(
                                  dataCall: false,
                                )));
                  } else if (value != null && value1 != null) {
                    Lists.studentData =
                        await DatabaseHelper.instance.queryBySemester(value1!);
                    for (var branch in Lists.studentData) {
                      if (branch["branch"] == value) {
                        Lists.tempData.add(branch);
                      }
                    }
                    Lists.studentData = Lists.tempData;
                    Lists.tempData = [];
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => const ThirdPage(
                                  dataCall: false,
                                )));
                  }
                } else {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => const ThirdPage(
                                dataCall: true,
                              )));
                }
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.3,
                height: MediaQuery.of(context).size.height * 0.06,
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.465),
                decoration: BoxDecoration(
                  color: Colors.blue.shade200,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    width: 2,
                    color: Colors.lightBlue.shade900,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.lightBlue.shade900,
                      offset: const Offset(
                        5.0,
                        5.0,
                      ),
                      blurRadius: 10.0,
                      spreadRadius: 2.0,
                    ), //BoxShadow
                    BoxShadow(
                      color: Colors.lightBlue.shade900,
                      offset: const Offset(0.0, 0.0),
                      blurRadius: 0.0,
                      spreadRadius: 0.0,
                    ), //BoxShadow
                  ],
                ),
                child: const Center(
                    child: Text(
                  "Show",
                  style: TextStyle(
                      fontSize: 26,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.italic),
                )),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 20.0,
        backgroundColor: Colors.blue.shade200,
        child: const Text(
          "+",
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const SecondPage()));
        },
      ),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String item) =>
      DropdownMenuItem(value: item, child: Text(item));
}
