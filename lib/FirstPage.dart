import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/FormHelper.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
List<dynamic> branch=[];

String? branchId;
void initState(){
  super.initState();
  this.branch.add({"id":1,"label":"ISE"});
  this.branch.add({"id":1,"label":"ISE"});

}



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan.shade50,
      body: Column(
        children: <Widget>[
          Row(
            children: [
              Padding(
                padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height*0.05,
                  left: MediaQuery.of(context).size.height*0.01,),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width*0.5,
                  child: const Text(
                    "Contact App",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ],
          ),
          Container(
            decoration: BoxDecoration(
                color: const Color(0xfff5f8fd),
                borderRadius: BorderRadius.circular(30),
                border: Border.all(width: 2, color: Colors.cyan.shade400)),
            padding:  EdgeInsets.only(left: MediaQuery.of(context).size.width*0.03,right: MediaQuery.of(context).size.width*0.03),
            margin:  EdgeInsets.only(
                left: MediaQuery.of(context).size.width*0.03, top: MediaQuery.of(context).size.height*0.03, right: MediaQuery.of(context).size.width*0.03, bottom: MediaQuery.of(context).size.width*0.03),
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
          Column(
            children: [
            FormHelper.dropDownWidgetWithLabel(context,
              "branch",
              "select branch",
              this.branchId,
              this.branch,
                (onChangedVal){
              this.branchId=onChangedVal;
              print("selected branch:$onChangedVal");
                },
                (onValidateVal){
             if(onValidateVal==null){
               return 'please select branch';
             }
             return null;
            },
              borderColor: Theme.of(context).primaryColor,
              borderFocusColor: Theme.of(context).primaryColor,
              borderRadius: 40,
              optionValue: "id",
              optionLabel: "label",
            ),
            ],
          ),
        ],
      ),
    );
  }
}

