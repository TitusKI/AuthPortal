import 'package:equatable/equatable.dart';

class UserEntity extends Equatable{
  final String userId;
  final String email;
  final String name;

  const UserEntity({
    required this.userId,
    required this.email,
    required this.name,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [userId, email, name];

}