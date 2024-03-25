import 'package:MyUser_repository/src/models/models.dart';
import 'package:firebase_auth/firebase_auth.dart';



abstract class MyUserRepo{
Stream<User?> get user;
Future<void> signIn(String email, String password);
Future<MyUser> signUp(MyUser myUser, String password);
Future<void> setUserData(MyUser myUser);
}