import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
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
  String? value;
  String? value1;
  final branch = ['ISE', 'CSE', 'ME', 'ECE', 'AI'];
  final sem = ['1', '2', '3', '4', '5', '6', '7', '8'];
  final TextEditingController _controllerSearch = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FirebaseData>(context);
    provider.getData();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.cyan.shade100,
      body: Column(
        children: <Widget>[
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.05,
                  left: MediaQuery.of(context).size.height * 0.01,
                ),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: const Text(
                    "Contact App",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
          //------------------SEARCH BAR---------------------------------
          Container(
            decoration: BoxDecoration(
              color: const Color(0xfff5f8fd),
              borderRadius: BorderRadius.circular(30),
              border: Border.all(width: 2, color: Colors.cyan.shade200),
              boxShadow: [
                BoxShadow(
                  color: Colors.cyan.shade200,
                  offset: const Offset(
                    8.0,
                    8.0,
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
            padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.03,
                right: MediaQuery.of(context).size.width * 0.03),
            margin: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.03,
                top: MediaQuery.of(context).size.height * 0.03,
                right: MediaQuery.of(context).size.width * 0.03,
                bottom: MediaQuery.of(context).size.width * 0.03),
            child: Row(
              children: <Widget>[
                Expanded(
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
                          Lists.studentData = await DatabaseHelper.instance
                              .queryStudentRecord(_controllerSearch.text);
                        } catch (e) {
                          print(e.toString());
                          Fluttertoast.showToast(msg: "Invalid USN");
                        }
                      } else if (_controllerSearch.text.length < 10) {
                        Fluttertoast.showToast(msg: "Invalid USN");
                      }
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => const ThirdPage(
                                    dataCall: false,
                                  )));
                    },
                    child: const Icon(Icons.search))
              ],
            ),
          ),
          Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.45,
                margin: EdgeInsets.only(
                    left: MediaQuery.of(context).size.height * 0.02),
                child: DropdownButton<String>(
                  hint: const Center(child: Text("Branch")),
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
                    left: MediaQuery.of(context).size.height * 0.01),
                child: DropdownButton<String>(
                  hint: const Center(child: Text("Sem")),
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
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.1,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.2,
                child: const Text(
                  "Student Strength - ",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
                ),
              ),
            ),
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
              height: MediaQuery.of(context).size.height * 0.05,
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.15),
              decoration: BoxDecoration(
                color: Colors.cyan.shade100,
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  width: 2,
                  color: Colors.white,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.cyan.shade500,
                    offset: const Offset(
                      5.0,
                      5.0,
                    ),
                    blurRadius: 10.0,
                    spreadRadius: 2.0,
                  ), //BoxShadow
                  BoxShadow(
                    color: Colors.cyan.shade900,
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
                    fontSize: 25,
                    color: Colors.black,
                    fontStyle: FontStyle.italic),
              )),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 20.0,
        backgroundColor: Colors.cyan.shade200,
        child: const Text(
          "+",
          style: TextStyle(
            fontSize: 25,
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
