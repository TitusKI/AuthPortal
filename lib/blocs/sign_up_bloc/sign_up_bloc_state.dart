part of 'sign_up_bloc_bloc.dart';

@immutable
sealed class SignUpBlocState extends Equatable {
  const SignUpBlocState();

  @override
  List<Object?> get props => [];

}
class SignUpBlocInitial extends SignUpBlocState{}
class SignUpSuccess extends SignUpBlocState{}
class SignUpFailure extends SignUpBlocState{}
class SignUpProcess extends SignUpBlocState{}
