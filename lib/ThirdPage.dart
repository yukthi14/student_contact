import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:student_contact/sqfliteDb/database.dart';

import 'FourthPage.dart';
import 'constants.dart';

class ThirdPage extends StatefulWidget {
  const ThirdPage({Key? key}) : super(key: key);

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}


class _ThirdPageState extends State<ThirdPage> {
  bool loadingData=true;
  static bool deleteCheck=true;
  String colorInt="" ;
  void getStudentData () async {
     setState((){
       loadingData=true;
     });
     Lists.studentData=await DatabaseHelper.instance.queryRecord();
    setState(() {
      loadingData=false;
    });
  }
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) =>getStudentData());
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
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Container(

                        margin: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.03),
                        child: Icon(Icons.arrow_back_ios,color: Colors.cyan.shade900,),),
                    ),
                    Container(
                        margin: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.23),
                        child: Text(
                          "Contact List",
                          style: TextStyle(fontSize: 30,color: Colors.cyan.shade900,fontWeight:FontWeight.w500),
                        )),
                  ],
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
                itemCount: Lists.studentData.length,
                itemBuilder: (BuildContext context,int index){

              return GestureDetector(
                onTap: (){
                  Navigator.push(context, CupertinoPageRoute(builder: (context)=> FourthPage(index: index,)));
                },
                onLongPress: (){

                 setState(() {
                   colorInt=index.toString();
                 });

                },
                child: Container(
                  margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height*0.02),
                  decoration: BoxDecoration(
                    border: Border.all(color: colorInt==index.toString()?Colors.red:Colors.cyan.shade100),
                    borderRadius: BorderRadius.circular(25),
                    boxShadow:  [
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
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height*0.08,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(

                        children: [

                          Container(
                              margin:EdgeInsets.only(left:MediaQuery.of(context).size.width*0.04,top: MediaQuery.of(context).size.height*0.01,),
                              child: Text(Lists.studentData[index]["studentName"],style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),)),
                          Container(
                              margin:EdgeInsets.only(left:MediaQuery.of(context).size.width*0.04,top: MediaQuery.of(context).size.height*0.01,),
                              child:  Text(Lists.studentData[index]["studentUsn"])),
                        ],
                      ),

                      Column(
                        children: [

                          GestureDetector(
                            onTap:() async {

                              if(colorInt==index.toString()){
                                await DatabaseHelper.instance.deleteRecord(Lists.studentData[index]["studentUsn"]);
                                Fluttertoast.showToast(msg: "Deleted");

                              }
                              else{
                                Navigator.push(context,MaterialPageRoute(builder: (context)=> FourthPage(index: index,)));
                              }
                           },
                            child: Container(

                            margin:EdgeInsets.only(top:MediaQuery.of(context).size.height*0.02,right:MediaQuery.of(context).size.width*0.04,),
                              child:  Icon(colorInt!=index.toString()?Icons.arrow_forward_ios:Icons.delete),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),


                ),
              );
            }),
          ),

        ],

      ),
    );
  }
}
