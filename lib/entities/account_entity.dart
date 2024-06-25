import 'package:cloud_firestore/cloud_firestore.dart';

class AccountEntity {
  String? id;
  String? email;

  AccountEntity({
    this.id,
    this.email,
  });

  AccountEntity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
  }

  factory AccountEntity.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options,
      ) {
    final data = snapshot.data();
    return AccountEntity(
      id: snapshot.id,
      email: data?['email'],
    );
  }

  AccountEntity copyWith({
    String? id,
    String? profilePictureReference,
    String? email,
    String? username,
    String? description,
    String? occupation,
  }) =>
      AccountEntity(
        id: id ?? this.id,
        email: email ?? this.email,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['email'] = email;
    return map;
  }

  Map<String, dynamic> toFirestore() {
    final map = <String, dynamic>{};
    map['email'] = email;
    return map;
  }
}
