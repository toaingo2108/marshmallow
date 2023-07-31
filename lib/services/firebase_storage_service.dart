import 'package:firebase_storage/firebase_storage.dart';

abstract class FirebaseStorageService {
  Future<String> getImageUrl(String path);
}

class FirebaseStorageServiceImpl extends FirebaseStorageService {
  final firebaseStorage = FirebaseStorage.instance;

  @override
  Future<String> getImageUrl(String path) async {
    final ref = firebaseStorage.ref(path);
    return ref.getDownloadURL();
  }
}
