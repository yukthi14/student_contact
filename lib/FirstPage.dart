import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:student_contact/SecondPage.dart';
import 'package:student_contact/ThirdPage.dart';

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

  @override
  Widget build(BuildContext context) {
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
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500,),
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
              boxShadow:  [
                BoxShadow(
                  color: Colors.cyan.shade200,
                  offset: Offset(
                    8.0,
                    8.0,
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
            padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.03,
                right: MediaQuery.of(context).size.width * 0.03),
            margin: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.03,
                top: MediaQuery.of(context).size.height * 0.03,
                right: MediaQuery.of(context).size.width * 0.03,
                bottom: MediaQuery.of(context).size.width * 0.03),
            child: Row(
              children: const <Widget>[
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: "Search by USN", border: InputBorder.none),
                  ),
                ),
                Icon(Icons.search)
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
          GestureDetector(
            onTap: (){
              Navigator.push(context, CupertinoPageRoute(builder: (context)=> const ThirdPage()));
            },

            child: Container(
              width: MediaQuery.of(context).size.width*0.3,
              height: MediaQuery.of(context).size.height*0.06,
              margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.68),
              decoration: BoxDecoration(
                color:  Colors.cyan.shade800,
                borderRadius: BorderRadius.circular(30),
              ),
              child:const Center(child: Text("Show",style: TextStyle(fontSize: 25,color: Colors.white),)),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 25.0,
        backgroundColor: Colors.cyan.shade800,
        foregroundColor:  Colors.white,
        child: const Text("+",style: TextStyle(fontSize: 25),),
        onPressed: (){
          Navigator.push(context,MaterialPageRoute(builder: (context)=>const SecondPage()));
        },
      ),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String item) =>
      DropdownMenuItem(value: item, child: Text(item));
}
