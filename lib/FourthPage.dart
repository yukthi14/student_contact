import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:student_contact/FirstPage.dart';
import 'package:student_contact/firebase.dart';
import 'package:student_contact/sqfliteDb/database.dart';

import 'constants.dart';

class FourthPage extends StatefulWidget {
  const FourthPage({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  State<FourthPage> createState() => _FourthPageState();
}

class _FourthPageState extends State<FourthPage> {
  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerPhoneNumber = TextEditingController();
  final TextEditingController _controllerFatherName = TextEditingController();
  final TextEditingController _controllerFatherNumber = TextEditingController();
  final TextEditingController _controllerEmailId = TextEditingController();
  final TextEditingController _controllerBranch = TextEditingController();
  final TextEditingController _controllerSem = TextEditingController();
  String imageUrl = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controllerName.text = Lists.studentData[widget.index]["studentName"];
    _controllerPhoneNumber.text =
        Lists.studentData[widget.index]["studentNumber"];
    _controllerFatherName.text = Lists.studentData[widget.index]["fatherName"];
    _controllerFatherNumber.text =
        Lists.studentData[widget.index]["fatherNumber"];
    _controllerEmailId.text = Lists.studentData[widget.index]["emailAddress"];
    _controllerBranch.text = Lists.studentData[widget.index]["branch"];
    _controllerSem.text = Lists.studentData[widget.index]["sem"];
  }

  Object imageHandler() {
    if (Lists.studentData[widget.index]["imageUrl"] == "") {
      return const AssetImage("assets/images.png");
    } else {
      return NetworkImage(Lists.studentData[widget.index]["imageUrl"]);
    }
  }

  void showCustomDialog(BuildContext context) => showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            backgroundColor: Colors.blue.shade100,
            title: const Text("Select Option"),
            children: <Widget>[
              SimpleDialogOption(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 20.0,
                ),
                onPressed: () async {
                  try {
                    ImagePicker imagePicker = ImagePicker();

                    XFile? file =
                        await imagePicker.pickImage(source: ImageSource.camera);

                    Reference referenceRoot = FirebaseStorage.instance.ref();
                    Reference referenceDirImg =
                        referenceRoot.child('fifthSemImage');
                    Reference referenceToUpload =
                        referenceDirImg.child('${file?.name}');
                    await referenceToUpload.putFile(File(file!.path));
                    imageUrl = await referenceToUpload.getDownloadURL();
                    FirebaseData().imageUpload(
                        Lists.studentData[widget.index]["usn"], imageUrl);
                    DatabaseHelper.instance.updateImageRecord(
                        Lists.studentData[widget.index]["usn"],
                        {DatabaseHelper.dbimageUrl: imageUrl});
                  } catch (e) {
                    print(e);
                  }
                },
                child: const Text("Camera"),
              ),
              SimpleDialogOption(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 20.0,
                ),
                onPressed: () async {
                  ImagePicker imagePicker = ImagePicker();
                  XFile? file =
                      await imagePicker.pickImage(source: ImageSource.gallery);
                  Reference referenceRoot = FirebaseStorage.instance.ref();
                  Reference referenceDirImg =
                      referenceRoot.child('fifthSemImage');
                  Reference referenceToUpload =
                      referenceDirImg.child('${file?.name}');
                  await referenceToUpload.putFile(File(file!.path));
                  imageUrl = await referenceToUpload.getDownloadURL();
                  FirebaseData().imageUpload(
                      Lists.studentData[widget.index]["usn"], imageUrl);
                  DatabaseHelper.instance.updateImageRecord(
                      Lists.studentData[widget.index]["usn"],
                      {DatabaseHelper.dbimageUrl: imageUrl});
                },
                child: const Text("Gallery"),
              )
            ],
          );
        },
      );
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
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.03,
                        top: MediaQuery.of(context).size.height * 0.05),
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.blue.shade100,
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  height: MediaQuery.of(context).size.height * 0.04,
                  margin: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.21,
                      top: MediaQuery.of(context).size.height * 0.05),
                  child: Center(
                    child: Text(
                      Lists.studentData[widget.index]["usn"],
                      style: TextStyle(
                          color: Colors.blue.shade200,
                          fontSize: 25,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    if (int.parse(_controllerPhoneNumber.text) < 6000000000) {
                      Fluttertoast.showToast(msg: "Invaild");
                    } else if (int.parse(_controllerFatherNumber.text) <
                        6000000000) {
                      Fluttertoast.showToast(msg: "Invaild");
                    } else if (_controllerEmailId.text.contains(' ')) {
                      Fluttertoast.showToast(msg: "Remove Space");
                    } else if (!(_controllerEmailId.text
                            .endsWith("@gmail.com")) &&
                        !(_controllerEmailId.text.endsWith("@hotmail.com")) &&
                        !(_controllerEmailId.text.endsWith(".in"))) {
                      Fluttertoast.showToast(msg: "Invalid Email Id");
                    } else {
                      DatabaseHelper.instance.updateRecord(
                          Lists.studentData[widget.index]["usn"], {
                        DatabaseHelper.dbStudentName: _controllerName.text,
                        DatabaseHelper.dbStudentNumber:
                            _controllerPhoneNumber.text,
                        DatabaseHelper.dbFatherName: _controllerFatherName.text,
                        DatabaseHelper.dbFatherNumber:
                            _controllerFatherNumber.text,
                        DatabaseHelper.dbEmailAddress: _controllerEmailId.text,
                        DatabaseHelper.dbBranch: _controllerBranch.text,
                        DatabaseHelper.dbSem: _controllerSem.text,
                      });
                      FirebaseData().updateData(
                          _controllerName.text,
                          _controllerPhoneNumber.text,
                          Lists.studentData[widget.index]["usn"],
                          _controllerFatherName.text,
                          _controllerFatherNumber.text,
                          _controllerEmailId.text,
                          _controllerBranch.text,
                          _controllerSem.text);
                      Fluttertoast.showToast(msg: "Saved");
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => const FirstPage()));
                    }
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.07,
                    height: MediaQuery.of(context).size.height * 0.04,
                    margin: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.19,
                        top: MediaQuery.of(context).size.height * 0.05),
                    child: Icon(
                      Icons.check,
                      color: Colors.blue.shade100,
                      size: 30,
                    ),
                  ),
                ),
              ],
            ),
            //------------------------------EDITOR-----------------------------------------------
            Hero(
              tag: '${widget.index}',
              child: Container(
                width: MediaQuery.of(context).size.width * 1,
                height: MediaQuery.of(context).size.height * 0.3,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue.shade200),
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: imageHandler() as ImageProvider,
                    )),
                child: Stack(
                  children: [
                    GestureDetector(
                      onTap: () {
                        showCustomDialog(context);
                      },
                      child: Container(
                        height: 30,
                        width: 50,
                        margin: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.65,
                          top: MediaQuery.of(context).size.height * 0.25,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.blue.shade100,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Icon(Icons.edit),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.07,
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.03),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue.shade100),
                borderRadius: BorderRadius.circular(40),
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue.shade900,
                    offset: const Offset(
                      5.0,
                      5.0,
                    ),
                    blurRadius: 10.0,
                    spreadRadius: 2.0,
                  ), //BoxShadow
                  BoxShadow(
                    color: Colors.blue.shade100,
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
                border: Border.all(color: Colors.blue.shade100),
                borderRadius: BorderRadius.circular(40),
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue.shade900,
                    offset: const Offset(
                      5.0,
                      5.0,
                    ),
                    blurRadius: 10.0,
                    spreadRadius: 2.0,
                  ), //BoxShadow
                  BoxShadow(
                    color: Colors.blue.shade100,
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
                    color: Colors.blue.shade900,
                    offset: const Offset(
                      5.0,
                      5.0,
                    ),
                    blurRadius: 10.0,
                    spreadRadius: 2.0,
                  ), //BoxShadow
                  BoxShadow(
                    color: Colors.blue.shade100,
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
                border: Border.all(color: Colors.blue.shade100),
                borderRadius: BorderRadius.circular(40),
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue.shade900,
                    offset: const Offset(
                      5.0,
                      5.0,
                    ),
                    blurRadius: 10.0,
                    spreadRadius: 2.0,
                  ), //BoxShadow
                  BoxShadow(
                    color: Colors.blue.shade100,
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
                border: Border.all(color: Colors.blue.shade100),
                borderRadius: BorderRadius.circular(40),
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue.shade900,
                    offset: const Offset(
                      5.0,
                      5.0,
                    ),
                    blurRadius: 10.0,
                    spreadRadius: 2.0,
                  ), //BoxShadow
                  BoxShadow(
                    color: Colors.blue.shade100,
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
            Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  height: MediaQuery.of(context).size.height * 0.07,
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.01,
                      left: MediaQuery.of(context).size.width * 0.07),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue.shade100),
                    borderRadius: BorderRadius.circular(40),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blue.shade900,
                        offset: const Offset(
                          5.0,
                          5.0,
                        ),
                        blurRadius: 10.0,
                        spreadRadius: 2.0,
                      ), //BoxShadow
                      BoxShadow(
                        color: Colors.blue.shade100,
                        offset: const Offset(0.0, 0.0),
                        blurRadius: 0.0,
                        spreadRadius: 0.0,
                      ), //BoxShadow
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30.0, top: 2),
                    child: TextField(
                      controller: _controllerBranch,
                      decoration: const InputDecoration(
                        hintText: "Branch",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  height: MediaQuery.of(context).size.height * 0.07,
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.01,
                      left: MediaQuery.of(context).size.width * 0.07),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.cyan.shade100),
                    borderRadius: BorderRadius.circular(40),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blue.shade900,
                        offset: const Offset(
                          5.0,
                          5.0,
                        ),
                        blurRadius: 10.0,
                        spreadRadius: 2.0,
                      ), //BoxShadow
                      BoxShadow(
                        color: Colors.blue.shade100,
                        offset: const Offset(0.0, 0.0),
                        blurRadius: 0.0,
                        spreadRadius: 0.0,
                      ), //BoxShadow
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30.0, top: 2),
                    child: TextField(
                      controller: _controllerSem,
                      maxLength: 1,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        hintText: "Semester",
                        counterText: "",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
