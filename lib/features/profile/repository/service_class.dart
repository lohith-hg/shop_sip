import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/user.dart';

class UserService {
   final usersRef =
      FirebaseFirestore.instance.collection('users').withConverter<AppUser>(
            fromFirestore: (snapshot, _) => AppUser.fromSnapshot(snapshot),
            toFirestore: (user, _) => user.toJson(),
          );

  Future<void> setUser(AppUser appUser) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      return;
    }

    await usersRef.doc(user.uid).set(appUser);
  }

   Future<AppUser?> getUser({required String userId}) async {
    var querySnapshot = await usersRef.doc(userId).get();
    if (querySnapshot.exists) {
      var user = querySnapshot.data()!;
      return user;
    } else {}
    return null;
  }
}
