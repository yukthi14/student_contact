import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:student_contact/sqfliteDb/database.dart';

import 'constants.dart';

class FourthPage extends StatefulWidget {
  const FourthPage({Key? key,required this.index}) : super(key: key);
  final int index;
  @override
  State<FourthPage> createState() => _FourthPageState();
}

class _FourthPageState extends State<FourthPage> {
  final TextEditingController _controllerName=TextEditingController();
  final TextEditingController _controllerPhoneNumber=TextEditingController();
  final TextEditingController _controllerFatherName=TextEditingController();
  final TextEditingController _controllerFatherNumber=TextEditingController();
  final TextEditingController _controllerEmailId=TextEditingController();
  final TextEditingController _controllerBranch=TextEditingController();
  final TextEditingController _controllerSem=TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controllerName.text=Lists.studentData[widget.index]["studentName"];
    _controllerPhoneNumber.text=Lists.studentData[widget.index]["studentNumber"];
    _controllerFatherName.text=Lists.studentData[widget.index]["fatherName"];
    _controllerFatherNumber.text=Lists.studentData[widget.index]["fatherNumber"];
    _controllerEmailId.text=Lists.studentData[widget.index]["emailAddress"];
    _controllerBranch.text=Lists.studentData[widget.index]["branch"];
    _controllerSem.text=Lists.studentData[widget.index]["sem"];
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.cyan.shade100,
      body: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.1,
            child: Row(
              children: [
                GestureDetector(

                  onTap: (){
                    Navigator.pop(context);
                  },

                  child: Container(
                    margin: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.03),
                      child: Icon(Icons.arrow_back_ios,color: Colors.cyan.shade900,),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width*0.4,
                  height: MediaQuery.of(context).size.height*0.04,
                  margin: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.21),

                   child: Center(
                     child: Text(
                       Lists.studentData[widget.index]["studentUsn"],style: const TextStyle(fontSize: 25,fontWeight: FontWeight.w500),
                     ),
                   ),
                ),
                InkWell(
                  onTap: (){
                  DatabaseHelper.instance.updateRecord(Lists.studentData[widget.index]["studentUsn"], {
                    DatabaseHelper.dbStudentName:_controllerName.text,
                    DatabaseHelper.dbStudentNumber:_controllerPhoneNumber.text,
                    DatabaseHelper.dbFatherName:_controllerFatherName.text,
                    DatabaseHelper.dbFatherNumber:_controllerFatherNumber.text,
                    DatabaseHelper.dbEmailAddress:_controllerEmailId.text,
                    DatabaseHelper.dbBranch:_controllerBranch.text,
                    DatabaseHelper.dbSem:_controllerSem.text,
                  });
                    Fluttertoast.showToast(msg: "Saved");
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width*0.1,
                    height: MediaQuery.of(context).size.height*0.04,
                    margin: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.19),

                    child: const Icon(Icons.check,size: 30,),

                  ),
                ),
              ],
            ),
          ),
          //------------------------------EDITOR-----------------------------------------------
          Container(
            width:  MediaQuery.of(context).size.width,
            height:  MediaQuery.of(context).size.height*0.07,
            margin: EdgeInsets.only(top:  MediaQuery.of(context).size.height*0.13),
            decoration: BoxDecoration(
              border: Border.all(color:Colors.cyan.shade100 ),
              borderRadius: BorderRadius.circular(40),
              boxShadow: [
                BoxShadow(
                  color: Colors.cyan.shade200,
                  offset: Offset(
                    5.0,
                    5.0,
                  ),
                  blurRadius: 10.0,
                  spreadRadius: 2.0,
                ), //BoxShadow
                BoxShadow(
                  color: Colors.cyan.shade100,
                  offset: Offset(0.0, 0.0),
                  blurRadius: 0.0,
                  spreadRadius: 0.0,
                ), //BoxShadow
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 30.0,top: 2),
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
            width:  MediaQuery.of(context).size.width,
            height:  MediaQuery.of(context).size.height*0.07,
            margin: EdgeInsets.only(top:  MediaQuery.of(context).size.height*0.005),
            decoration: BoxDecoration(
              border: Border.all(color:Colors.cyan.shade100 ),
              borderRadius: BorderRadius.circular(40),
              boxShadow: [
                BoxShadow(
                  color: Colors.cyan.shade200,
                  offset: Offset(
                    5.0,
                    5.0,
                  ),
                  blurRadius: 10.0,
                  spreadRadius: 2.0,
                ), //BoxShadow
                BoxShadow(
                  color: Colors.cyan.shade100,
                  offset: Offset(0.0, 0.0),
                  blurRadius: 0.0,
                  spreadRadius: 0.0,
                ), //BoxShadow
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 30.0,top: 2),
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
            width:  MediaQuery.of(context).size.width,
            height:  MediaQuery.of(context).size.height*0.07,
            margin: EdgeInsets.only(top:  MediaQuery.of(context).size.height*0.005),
            decoration: BoxDecoration(
              border: Border.all(color:Colors.cyan.shade100 ),
              borderRadius: BorderRadius.circular(40),
              boxShadow: [
                BoxShadow(
                  color: Colors.cyan.shade200,
                  offset: Offset(
                    5.0,
                    5.0,
                  ),
                  blurRadius: 10.0,
                  spreadRadius: 2.0,
                ), //BoxShadow
                BoxShadow(
                  color: Colors.cyan.shade100,
                  offset: Offset(0.0, 0.0),
                  blurRadius: 0.0,
                  spreadRadius: 0.0,
                ), //BoxShadow
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 30.0,top: 2),
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
            width:  MediaQuery.of(context).size.width,
            height:  MediaQuery.of(context).size.height*0.07,
            margin: EdgeInsets.only(top:  MediaQuery.of(context).size.height*0.005),
            decoration: BoxDecoration(
              border: Border.all(color:Colors.cyan.shade100 ),
              borderRadius: BorderRadius.circular(40),
              boxShadow: [
                BoxShadow(
                  color: Colors.cyan.shade200,
                  offset: Offset(
                    5.0,
                    5.0,
                  ),
                  blurRadius: 10.0,
                  spreadRadius: 2.0,
                ), //BoxShadow
                BoxShadow(
                  color: Colors.cyan.shade100,
                  offset: Offset(0.0, 0.0),
                  blurRadius: 0.0,
                  spreadRadius: 0.0,
                ), //BoxShadow
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 30.0,top: 2),
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
            width:  MediaQuery.of(context).size.width,
            height:  MediaQuery.of(context).size.height*0.07,
            margin: EdgeInsets.only(top:  MediaQuery.of(context).size.height*0.005),
            decoration: BoxDecoration(
              border: Border.all(color:Colors.cyan.shade100 ),
              borderRadius: BorderRadius.circular(40),
              boxShadow: [
                BoxShadow(
                  color: Colors.cyan.shade200,
                  offset: Offset(
                    5.0,
                    5.0,
                  ),
                  blurRadius: 10.0,
                  spreadRadius: 2.0,
                ), //BoxShadow
                BoxShadow(
                  color: Colors.cyan.shade100,
                  offset: Offset(0.0, 0.0),
                  blurRadius: 0.0,
                  spreadRadius: 0.0,
                ), //BoxShadow
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 30.0,top: 2),
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
               width:  MediaQuery.of(context).size.width*0.4,
               height:  MediaQuery.of(context).size.height*0.07,
               margin: EdgeInsets.only(top:  MediaQuery.of(context).size.height*0.01,left: MediaQuery.of(context).size.width*0.07),
               decoration: BoxDecoration(
                 border: Border.all(color:Colors.cyan.shade100 ),
                 borderRadius: BorderRadius.circular(40),
                 boxShadow: [
                   BoxShadow(
                     color: Colors.cyan.shade200,
                     offset: Offset(
                       5.0,
                       5.0,
                     ),
                     blurRadius: 10.0,
                     spreadRadius: 2.0,
                   ), //BoxShadow
                   BoxShadow(
                     color: Colors.cyan.shade100,
                     offset: Offset(0.0, 0.0),
                     blurRadius: 0.0,
                     spreadRadius: 0.0,
                   ), //BoxShadow
                 ],
               ),
               child: Padding(
                 padding: const EdgeInsets.only(left: 30.0,top: 2),
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
               width:  MediaQuery.of(context).size.width*0.4,
               height:  MediaQuery.of(context).size.height*0.07,
               margin: EdgeInsets.only(top:  MediaQuery.of(context).size.height*0.01,left: MediaQuery.of(context).size.width*0.07),
               decoration: BoxDecoration(
                 border: Border.all(color:Colors.cyan.shade100 ),
                 borderRadius: BorderRadius.circular(40),
                 boxShadow: [
                   BoxShadow(
                     color: Colors.cyan.shade200,
                     offset: Offset(
                       5.0,
                       5.0,
                     ),
                     blurRadius: 10.0,
                     spreadRadius: 2.0,
                   ), //BoxShadow
                   BoxShadow(
                     color: Colors.cyan.shade100,
                     offset: Offset(0.0, 0.0),
                     blurRadius: 0.0,
                     spreadRadius: 0.0,
                   ), //BoxShadow
                 ],
               ),
               child: Padding(
                 padding: const EdgeInsets.only(left: 30.0,top: 2),
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
    );
  }
}
