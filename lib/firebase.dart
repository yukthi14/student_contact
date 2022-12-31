import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

import 'model.dart';

class FirebaseData{
String thirdSem="3rd Sem";
String fifthSem="5th Sem";
String seventhSem="7th Sem";
int num=0;
bool indexCheck=true;
List< Welcome> studentData=[];

  getData() async {

    try{

        final ref = await FirebaseDatabase.instance.ref()
            .child("5th Sem")
            .child(num.toString());
        ref.once().then((var snapshot) {
          print(snapshot.snapshot.value);
          for(var element in snapshot.snapshot.children){
            studentData.add(Welcome.fromJson(element.value as Map<Object?,Object?>));
          }
        });

    }
    catch(e){

      throw Exception(e.toString());
    }
  }
}

