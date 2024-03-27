import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:user_repository/user_repository.dart';

part 'sign_in_bloc_event.dart';
part 'sign_in_bloc_state.dart';

class SignInBlocBloc extends Bloc<SignInBlocEvent, SignInBlocState> {
  final UserRepository _userRepository;

  SignInBlocBloc({
    required UserRepository userRepository,
  }) : _userRepository = userRepository,
  
  super(SignInBlocInitial()) {

    on<SignInRequired>((event, emit) async{
      
       try {
         await _userRepository.signIn(event.email, event.password);
         emit(SignInSuccess());
       } on FirebaseAuthException catch(e){
        emit(SignInFailure(messsage: e.code));
       }
       
        catch (e) {
         emit(const SignInFailure());
       }
    });
    on<SignOutRequired>((event, emit) async{
    await _userRepository.logOut();
    });
  }
}
