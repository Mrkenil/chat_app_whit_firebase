import 'dart:developer';

import 'package:chat_app/component/helpers/auth_helper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FireStore_Helper {
  FireStore_Helper._();
  static final FireStore_Helper fireStore_Helper = FireStore_Helper._();
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  CollectionReference users = FirebaseFirestore.instance.collection('users');

  Future<void> addUser({required Map<String, dynamic> data}) async {
    // return users.add(data);
    await firestore
        .collection("users")
        .doc("${Auth_Helper.auth_helper.firebaseAuth.currentUser?.uid}")
        .set(data);
  }

  //TODO:Display User to UI from Cloud_Firestore
  Stream<QuerySnapshot<Map<String, dynamic>>> fetchUsers() {
    return firestore
        .collection("users")
        .where("uid",
            isNotEqualTo: Auth_Helper.auth_helper.firebaseAuth.currentUser?.uid)
        .snapshots();
  }

  //Delete User From Cloud_Firestore
  Future<void> deleteUser({required String uid}) async {
    await firestore.collection("users").doc(uid).delete();
  }

  //Send Message
  Future<void> sendMessage({
    required String uid1,
    required String uid2,
    required String msg,
  }) async {
    String user1 = uid1;
    String user2 = uid2;

    //Check If User Already Exist or not
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await firestore.collection("chat").get();
    List<QueryDocumentSnapshot<Map<String, dynamic>>> allDocs =
        await querySnapshot.docs;

    bool isChatRoomAvailable = false;
    String fetcheduser1 = "";
    String fetcheduser2 = "";

    //Check ChatRoom Already Available or Not
    for (QueryDocumentSnapshot<Map<String, dynamic>> element in allDocs) {
      String u1 = element.id.split("_")[0];
      String u2 = element.id.split("_")[1];

      if ((user1 == u1 || user2 == u1) && (user1 == u2 || user2 == u2)) {
        isChatRoomAvailable = true;
        fetcheduser1 = element.data()["users"][0];
        fetcheduser2 = element.data()["users"][1];
      }
    }

    //What if ChatRoom is Not Available
    if (isChatRoomAvailable == false) {

      await firestore.collection("chat").doc("${uid1}_${uid2}").set({
        "users": [uid1, uid2],
      });

      await firestore
          .collection("chat")
          .doc("${uid1}_${uid2}")
          .collection("messages")
          .add({
        "sentby": uid1,
        "receivedby": uid2,
        "msg": msg,
      });
    } else {
      await firestore
          .collection("chat")
          .doc("${fetcheduser1}_${fetcheduser2}")
          .collection("messages")
          .add({
        "sentby": uid1,
        "receivedby": uid2,
        "timestamp": FieldValue.serverTimestamp(),
        "msg": msg,
      });
    }
  }


  Future<Stream<QuerySnapshot<Map<String, dynamic>>>> DisplayMessage({
    required String uid1,
    required String uid2,
  }) async {
    String user1 = uid1;
    String user2 = uid2;
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await firestore.collection("chat").get();
    List<QueryDocumentSnapshot<Map<String, dynamic>>> allDocs =
        await querySnapshot.docs;
    bool isChatRoomAvailable = false;
    String fetcheduser1 = "";
    String fetcheduser2 = "";
    for (QueryDocumentSnapshot<Map<String, dynamic>> element in allDocs) {
      String u1 = element.id.split("_")[0];
      String u2 = element.id.split("_")[1];

      if ((user1 == u1 || user2 == u1) && (user1 == u2 || user2 == u2)) {
        isChatRoomAvailable = true;
        fetcheduser1 = element.data()["users"][0];
        fetcheduser2 = element.data()["users"][1];
      }
    }
    if (isChatRoomAvailable == false) {
      await firestore.collection("chat").doc("${uid1}_${uid2}").set({
        "users": [uid1, uid2],
      });

      return firestore
          .collection("chat")
          .doc("${uid1}_${uid2}")
          .collection("messages")
          .orderBy('timestamp', descending: true)
          .snapshots();
    } else {
      log("==============Chat Room is Available==============");
      return firestore
          .collection("chat")
          .doc("${fetcheduser1}_${fetcheduser2}")
          .collection("messages")
          .orderBy('timestamp', descending: true)
          .snapshots();
    }
  }

  Future<void> DeleteChat(
      {required String uid, required String uid1, required String uid2}) async {
    await firestore
        .collection("chat")
        .doc("${uid1}_${uid2}")
        .collection("messages")
        .doc(uid)
        .delete();
  }
}
