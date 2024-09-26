import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:notes_app/data/model/WorkModel.dart';

class WorkRepository extends GetxController {
  var _email = ''.obs;
  DatabaseReference? db;
  var aw = <WorkModel>[].obs;
  var l = <String>[].obs;
  TextEditingController workController = TextEditingController();
  TextEditingController descController = TextEditingController();

  Future<String?> GetEmailData() async {
    User? user = FirebaseAuth.instance.currentUser;
    return user?.email?.substring(0, 5) ?? 'Empty';
  }

  @override
  void onInit() {
    super.onInit();
    init();
  }

  void init() async {
    _email.value = (await GetEmailData()) ?? '';
    if (_email.isNotEmpty) {
      db = FirebaseDatabase.instance.ref().child('users').child(_email.value);
      fetchData();
    }
  }

  void addData(String title, String desc, bool val) {
    Map<String, dynamic> m1 = {
      'title': title,
      'desc': desc,
      'isChecked': val,
    };
    db?.push().set(m1);
  }

  void fetchData() {
    if (db != null) {
      db?.onChildAdded.listen((event) {
        try {
          var sent = event.snapshot.value as Map;
          var k = event.snapshot.key as String;
          if (!l.contains(k)) {
            l.add(k);
            aw.add(WorkModel(
                title: sent['title'],
                description: sent['desc'],
                isChecked: sent['isChecked']));
          }
        } catch (error) {
          print('Error fetching data: $error');
        }
      });
    }
  }

  void deleteData(int index) {
    // Initialize_db(db_str);
    if (index == aw.length - 1) {
      db?.child(l[index]).remove();
    } else {
      db?.child(l[index]).remove();
    }
    aw.removeAt(index);
    
  }

}
