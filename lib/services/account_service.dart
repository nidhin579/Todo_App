import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_app/entities/account_entity.dart';

class AccountService {
  final _accountsCollectionReference = FirebaseFirestore.instance
      .collection('accounts')
      .withConverter<AccountEntity>(
        fromFirestore: AccountEntity.fromFirestore,
        toFirestore: (AccountEntity entity, _) => entity.toFirestore(),
      );

  AccountEntity? account;

  bool get accountExist => account != null;

  // Return fetch status: which means if the account doesn't exist,
  // returns true if the request is completed
  Future<bool> fetchAccount() async {
    try {
      final userId = FirebaseAuth.instance.currentUser?.uid;
      if (userId == null) return false;

      final doc = await _accountsCollectionReference.doc(userId).get();
      account = doc.data();
      return true;
    } catch (e) {
      return false;
    }
  }

  // call this after user authenticated
  Future<bool> createAccount() async {
    try {
      final currentAuthUser = FirebaseAuth.instance.currentUser;
      final userId = currentAuthUser?.uid;
      final email = currentAuthUser?.email;
      final account = AccountEntity(
        id: userId,
        email: email,
      );
      await _accountsCollectionReference.doc(userId).set(account);
      return true;
    } catch (e) {
      return false;
    }
  }
}
