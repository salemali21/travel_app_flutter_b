import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class FireStorageService {
  FireStorageService._();
  static final instance = FireStorageService._();

  final _fireStorage = FirebaseStorage.instance.ref();

  Future<bool> deleteFile(String fileName) async {
    try {
      final desertRef = _fireStorage.child("user_image/$fileName");
      await desertRef.delete();
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<String> uploadImage(File file) async {
    TaskSnapshot taskSnapshot =
        await _fireStorage.child("user_image/${file.path.split("/").last}").putFile(file);
    return await taskSnapshot.ref.getDownloadURL();
  }
}
