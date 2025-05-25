import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:music_app/data/model/MusicModel.dart';
import 'package:music_app/util/app_constants.dart';

class ServiceRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<MusicModel>> fetchServices() async {
    final snapshot = await _firestore.collection(AppConstants.serviceUri).get();
    return snapshot.docs
        .map((doc) => MusicModel.fromFirestore(doc))
        .toList();
  }
}
