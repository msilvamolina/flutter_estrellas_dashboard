import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

import '../../../models/videos/video_post_model.dart';

class VideosRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = Get.find<FirebaseFirestore>();

  Stream<List<VideoPostModel>> getVideos() async* {
    try {
      String uid = _firebaseAuth.currentUser!.uid;

      Stream<QuerySnapshot> snapshots = _firebaseFirestore
          .collection('videos')
          .doc(uid)
          .collection('expenses')
          .snapshots();

      yield* snapshots.map((snapshot) {
        return snapshot.docs
            .map((doc) => VideoPostModel.fromDocument(doc))
            .toList();
      });
    } catch (e) {
      print(e);
    }
  }

  Future<Either<String, Unit>> saveVideo({
    required String name,
  }) async {
    try {
      String uid = _firebaseAuth.currentUser!.uid;
      String uuid = const Uuid().v4();
      String id = 'video-$uuid';

      await _firebaseFirestore.collection('videos').doc(id).set(
        {
          'name': name,
          'id': id,
          'createdBy': uid,
          'createdAt': DateTime.now(),
        },
      );
      return right(unit);
    } on FirebaseException catch (e) {
      return left(e.code);
    }
  }
}
