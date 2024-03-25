

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:user_repository/src/models/models.dart';
import 'package:user_repository/src/user_repository.dart';

class FirebaseUserRepo implements UserRepository{

  final userCollection = FirebaseFirestore.instance.collection('user');
  final FirebaseAuth _firebaseAuth;
  FirebaseUserRepo({
    FirebaseAuth? firebaseAuth
  }):
    _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;
   @override
  Stream<User?> get user{
    return _firebaseAuth.authStateChanges().map((firebaseUser) {
      return firebaseUser;
    });
  }
 

  @override
  Future<void> signIn(String email, String password) async{
    try {
      await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<MyUser> signUp(MyUser myUser, String password) async{
      try {
     UserCredential user = await _firebaseAuth.createUserWithEmailAndPassword(email: myUser.email, password: password);

     myUser = myUser.copyWith(
      userId: user.user!.uid
     );
     return myUser;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
 
  @override
  Future<void> setUserData(MyUser myUser) async{
    
      try {
      await userCollection.doc().set(myUser.toEntity().toDocument());
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
 

}