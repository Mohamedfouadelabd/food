import 'package:cloud_firestore/cloud_firestore.dart';

import 'Model/My_Meal.dart';
import 'Model/my_user.dart';

class FireBseUtils {
  FireBseUtils._();

  static FireBseUtils? _instance;

  static FireBseUtils getFirebaseInstance() {
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

  Future<void> addUser(MyUser myUser) {
    return getUserCollection().doc(myUser.id).set(myUser);
  }

  Future<MyUser?> readUser(String uId) async {
    var querySnapshot = await getUserCollection().doc(uId).get();
    return querySnapshot.data();
  }

  CollectionReference<MyMeal> geMytMealCollection() {
    return FirebaseFirestore.instance
        .collection(MyMeal.collectionName)
        .withConverter<MyMeal>(
          fromFirestore: (snapshot, options) =>
              MyMeal.fromFireStore(snapshot.data()!),
          toFirestore: (myMeal, options) => myMeal.toFireStore(),
        );
  }

  Future<void> addMeals(MyMeal myMeal) {
    var mealCollection = geMytMealCollection();
    var dovRef = mealCollection.doc(myMeal.id);
    return dovRef.set(myMeal);
  }

  Stream<List<MyMeal>> listenToMeals() {
    return geMytMealCollection().snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => doc.data()).toList());
  }
  Future<void> deleteMeal(String id) {
    return geMytMealCollection().doc(id).delete();
  }

}
