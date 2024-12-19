class AdminUserModel {
  AdminUserModel({
    required this.uid,
    required this.customClaims,
    this.email,
  });

  factory AdminUserModel.fromJson(Map<dynamic, dynamic> json) => AdminUserModel(
        uid: json['uid'],
        email: json['email'],
        customClaims: json['customClaims'],
      );

  String uid;
  String? email;
  dynamic customClaims;

  @override
  String toString() =>
      'AdminUserModel(uid: $uid, email: $email, customClaims: $customClaims)';
}
