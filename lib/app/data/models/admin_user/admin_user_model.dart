class AdminUserModel {
  AdminUserModel({
    required this.uid,
    required this.claims,
    this.email,
  });

  factory AdminUserModel.fromJson(Map<dynamic, dynamic> json) => AdminUserModel(
        uid: json['uid'],
        email: json['email'],
        claims: json['claims'],
      );

  String uid;
  String? email;
  dynamic claims;

  @override
  String toString() =>
      'AdminUserModel(uid: $uid, email: $email, claims: $claims)';
}
