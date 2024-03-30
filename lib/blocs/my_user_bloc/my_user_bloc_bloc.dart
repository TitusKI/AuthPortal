import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';


part 'my_user_bloc_event.dart';
part 'my_user_bloc_state.dart';

class MyUserBlocBloc extends Bloc<MyUserBlocEvent, MyUserBlocState> {
  MyUserBlocBloc() : super(MyUserBlocInitial()) {
    on<MyUserBlocEvent>((event, emit) {

    });
  }
}
