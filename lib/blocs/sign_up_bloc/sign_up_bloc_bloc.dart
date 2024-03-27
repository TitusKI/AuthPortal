import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:user_repository/user_repository.dart';

part 'sign_up_bloc_event.dart';
part 'sign_up_bloc_state.dart';

class SignUpBlocBloc extends Bloc<SignUpBlocEvent, SignUpBlocState> {
  final UserRepository _userRepository;

  SignUpBlocBloc({required UserRepository userRepository})
      : _userRepository = userRepository,
        super(SignUpBlocInitial()) {
    on<SignUpRequired>((event, emit) async {
      emit(SignUpProcess());
      try {
        MyUser user = await _userRepository.signUp(event.user, event.password);
        await _userRepository.setUserData(user);
      } catch (e) {
        emit(SignUpFailure());
      }
    });
  }
}
