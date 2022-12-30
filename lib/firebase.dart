import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class FirebaseData{

  final ref=FirebaseDatabase.instance.ref().child("3rd Sem");
  getData() async {

    try{
      // var snapshot=ref.child('3rd Sem').get();
      //
      // print(snapshot);
      // if(snapshot.exists){
      //
      // }
      ref.once().then((snapshot) {
        print(snapshot);
      });
    }
    catch(e){
      print("jhgfiusjklffffffffffffffffffffffffffffffffffffffffffffffffffflcnsnsjdk");
      throw Exception(e.toString());
    }
  }
}

