import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';
import 'package:video_compress/video_compress.dart';

import '../../../models/videos/video_post_model.dart';

class VideosRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = Get.find<FirebaseFirestore>();
  final FirebaseStorage _firebaseStorage = Get.find<FirebaseStorage>();

  Stream<List<VideoPostModel>> getVideos() async* {
    try {
      Stream<QuerySnapshot> snapshots = _firebaseFirestore
          .collection('videos')
          .orderBy('name', descending: true)
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

  _compressVideo(String videoPath) async {
    final compressedVideo = await VideoCompress.compressVideo(
      videoPath,
      quality: VideoQuality.MediumQuality,
    );

    return compressedVideo!.file;
  }

  Future<String> _uploadVideoToStorage(String id, String videoPath) async {
    Reference ref = _firebaseStorage.ref().child('videos').child(id);

    UploadTask uploadTask = ref.putFile(await _compressVideo(videoPath));
    TaskSnapshot snap = await uploadTask;
    String downloadUrl = await snap.ref.getDownloadURL();
    return downloadUrl;
  }

  Future<String> _uploadImageToStorage(String id, String videoPath) async {
    Reference ref = _firebaseStorage.ref().child('thumbnails').child(id);
    UploadTask uploadTask = ref.putFile((await _getThumbnail(videoPath)));
    TaskSnapshot snap = await uploadTask;
    String downloadUrl = await snap.ref.getDownloadURL();
    return downloadUrl;
  }

  _getThumbnail(String videoPath) async {
    final thumbnail = await VideoCompress.getFileThumbnail(videoPath);
    return thumbnail;
  }

  Future<Either<String, Unit>> uploadVideo(
      String videoId, String videoPath) async {
    try {
      String videoUrl = await _uploadVideoToStorage(videoId, videoPath);
      String thumbnail = await _uploadImageToStorage(videoId, videoPath);

      await _firebaseFirestore.collection('videos').doc(videoId).update({
        'videoUrl': videoUrl,
        'thumbnail': thumbnail,
      });

      return right(unit);
    } catch (e) {
      return left(e.toString());
    }
  }
}
