
import 'package:cloud_firestore/cloud_firestore.dart';

import '../model_class/classmodel.dart';

class UserRepository {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<DocumentReference<Map<String, dynamic>>> createdata(
      Student user) async {
    return await firestore.collection("Users").add(user.toJson());
  }

  Future getData() async {
    return await firestore.collection("Users").doc("documentId").get();
    print('hjnkm');

  }

  Future updateData(Student user) async {
    await firestore.collection("Users").doc("documentId").update(user.toJson());
  }

  Future deleteData(DocumentId) async {
    await firestore.collection("Users").doc(DocumentId).delete();
  }
}
