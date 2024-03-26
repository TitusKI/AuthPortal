import 'package:authenticateme/app.dart';
import 'package:authenticateme/firebase_options.dart';
import 'package:authenticateme/simple_bloc_observer.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import "package:user_repository/user_repository.dart";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp(
    // Initializes the firebase services example firestore, authentication , cloud messaging ..
    options: DefaultFirebaseOptions.currentPlatform,
    // specify the default options for firebase initialization based on the current platform ( ANDROID AND IOS)
);
  Bloc.observer = SimpleBlocObsever();
  runApp(MyApp(FirebaseUserRepo()));
}


