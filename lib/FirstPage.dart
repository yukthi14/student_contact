import 'package:flutter/material.dart';

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
      backgroundColor: Colors.cyan.shade50,
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
          )
        ],
      ),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String item) =>
      DropdownMenuItem(value: item, child: Text(item));
}
