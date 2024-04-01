part of 'sign_in_bloc_bloc.dart';

@immutable
sealed class SignInBlocState extends Equatable {
  const SignInBlocState();
  @override
  List<Object?> get props => [];

}

final class SignInBlocInitial extends SignInBlocState {}
 class SignInSuccess extends SignInBlocState{}
 class SignInFailure extends SignInBlocState{
  final String? messsage;
 const SignInFailure({this.messsage});
 }
 class SignInProgress extends SignInBlocState{}
 class ForgetPassword extends SignInBlocState{}
