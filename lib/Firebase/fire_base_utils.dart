


import 'package:cloud_firestore/cloud_firestore.dart';

import 'Model/my_user.dart';

class FireBseUtils {

  FireBseUtils._();

  static FireBseUtils? _instance;

  static FireBseUtils getApiInstance() {
    _instance ??= FireBseUtils._();
    return _instance!;
  }

 CollectionReference<MyUser> getUserCollection() {
    return FirebaseFirestore.instance
        .collection(MyUser.userCollection)
        .withConverter<MyUser>(
          fromFirestore: (snapshot, options) =>
              MyUser.fromFireStore(snapshot.data()!),
          toFirestore: (myuser, options) => myuser.toFireStore(),
        );
  }

  Future<void> addUser(MyUser myUser){

   return getUserCollection().doc(myUser.id).set(myUser);

  }

  Future<MyUser?> readUser(String uId)async{
  var querySnapshot=await getUserCollection().doc(uId).get();
return querySnapshot.data();
}

}
