import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:estrellas_dashboard/app/data/models/product/product_firebase_lite/product_firebase_lite.dart';
import 'package:estrellas_dashboard/app/data/models/product_lite/product_lite.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../helpers/friendly_helpers.dart';
import '../../helpers/model_helpers.dart';
import '../product/product_firebase/product_firebase_model.dart';

part 'video_post_model.freezed.dart';
part 'video_post_model.g.dart';

@freezed
abstract class VideoPostModel implements _$VideoPostModel {
  const VideoPostModel._();

  const factory VideoPostModel({
    required String name,
    @Default(false) bool active,
    required String id,
    required String createdAt,
    required String thumbnail,
    required String videoUrl,
    required String createdByEmail,
    required String createdById,
    String? productId,
    ProductFirebaseModel? product,
    String? searchField,
    dynamic reference,
  }) = _VideoPostModel;

  factory VideoPostModel.fromJson(Map<String, dynamic> json) =>
      _$VideoPostModelFromJson(json);

  factory VideoPostModel.fromDocument(DocumentSnapshot doc) {
    VideoPostModel data =
        VideoPostModel.fromJson(ModelHelpers.fromDocument(doc.data()!));
    String searchField = data.name;

    return data.copyWith(
      reference: doc.reference,
      searchField: FriendlyHelpers.friendlySearchField(searchField),
    );
  }

  Map<String, dynamic> toDocument() => ModelHelpers.toDocument(toJson());

  static Future<VideoPostModel?> fromReference(dynamic reference) async {
    try {
      DocumentSnapshot<Object?>? data =
          await ModelHelpers.fromReference(reference as DocumentReference);

      if (data != null) {
        return VideoPostModel.fromDocument(data);
      }

      return null;
    } catch (_) {
      return null;
    }
  }
}
