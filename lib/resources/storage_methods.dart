import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';

class StorageMethods {
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  // add image to firebase
  Future<String> uploadImageToDb(
      String childName, Uint8List imgPath, bool isPost) async {
    Reference ref =
        _storage.ref().child(childName).child(_auth.currentUser!.uid);
    if (isPost) {
      String id = const Uuid().v1();
      ref = ref.child(id);
    }
    //
    UploadTask uploadTask = ref.putData(imgPath);

    TaskSnapshot snap = await uploadTask;
    //get img url
    String downloadUrl = await snap.ref.getDownloadURL();
    return downloadUrl;
  }
}
