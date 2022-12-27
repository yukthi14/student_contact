import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:student_contact/sqflitedb/database.dart';


class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  final TextEditingController _controllerName=TextEditingController();
  final TextEditingController _controllerUSN=TextEditingController();
  final TextEditingController _controllerPhoneNumber=TextEditingController();
  final TextEditingController _controllerFatherName=TextEditingController();
  final TextEditingController _controllerFatherNumber=TextEditingController();
  final TextEditingController _controllerEmailId=TextEditingController();

  String? value;
  String? value1;
  final branch = ['ISE', 'CSE', 'ME', 'ECE', 'AI'];
  final sem = ['1', '2', '3', '4', '5', '6', '7', '8'];

  DropdownMenuItem<String> buildMenuItem(String item) =>
      DropdownMenuItem(value: item, child: Text(item));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.cyan.shade50,
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
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Container(

                        margin: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.03),
                        child: Icon(Icons.arrow_back_ios,color: Colors.cyan.shade900,),),
                    ),
                    Container(
                        margin: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.18),
                        child: Text(
                          "Student Details",
                          style: TextStyle(fontSize: 30,color: Colors.cyan.shade900,fontWeight:FontWeight.w500),
                        )),
                  ],
                ),
              ),
            ],
          ),
          // --------------------------------CONTAINER WITH TEXTFIELD-------------------------------------
          Container(
            width:  MediaQuery.of(context).size.width,
            height:  MediaQuery.of(context).size.height*0.07,
            margin: EdgeInsets.only(top:  MediaQuery.of(context).size.height*0.005),
            decoration: BoxDecoration(
              border: Border.all(color:Colors.cyan.shade600 ),
              borderRadius: BorderRadius.circular(40),
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
              border: Border.all(color:Colors.cyan.shade600 ),
              borderRadius: BorderRadius.circular(40),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 30.0,top: 2),
              child: TextField(
                controller: _controllerUSN,
                maxLength: 10,
                decoration: const InputDecoration(
                  hintText: "USN",
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
              border: Border.all(color:Colors.cyan.shade600 ),
              borderRadius: BorderRadius.circular(40),
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
              border: Border.all(color:Colors.cyan.shade600 ),
              borderRadius: BorderRadius.circular(40),
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
              border: Border.all(color:Colors.cyan.shade600 ),
              borderRadius: BorderRadius.circular(40),
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
              border: Border.all(color:Colors.cyan.shade600 ),
              borderRadius: BorderRadius.circular(40),
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
          // ----------------------DROPDOWN BOX--------------------------------------------
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
          //------------------------SUBMIT BUTTON-------------------------------------------------
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () async {
                  await DatabaseHelper.instance.insertRecord({
                    DatabaseHelper.dbStudentName:_controllerName.text,
                    DatabaseHelper.dbStudentUsn:_controllerUSN.text,
                    DatabaseHelper.dbStudentNumber:_controllerPhoneNumber.text,
                    DatabaseHelper.dbFatherName:_controllerFatherName.text,
                    DatabaseHelper.dbFatherNumber:_controllerFatherNumber.text,
                    DatabaseHelper.dbEmailAddress:_controllerEmailId.text,
                    DatabaseHelper.dbBranch:value,
                    DatabaseHelper.dbSem:value1,
                  });
                  Fluttertoast.showToast(msg: "Inserted");
                  Navigator.pop(context);
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.3,
                  height: MediaQuery.of(context).size.height * 0.07,
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.28),
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