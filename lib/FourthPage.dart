import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FourthPage extends StatefulWidget {
  const FourthPage({Key? key,required this.index}) : super(key: key);
  final int index;
  @override
  State<FourthPage> createState() => _FourthPageState();
}

class _FourthPageState extends State<FourthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.cyan.shade50,

    );
  }
}
