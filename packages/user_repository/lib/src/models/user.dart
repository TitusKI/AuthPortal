import 'package:equatable/equatable.dart';
import 'package:user_repository/src/entities/user_entities.dart';

class User extends Equatable {
  final String userId;
  final String email;
  final String name;

  const User({
    required this.userId,
    required this.email,
    required this.name,
  });

  static const empty = User(userId: '', email: '', name: '');
  User copyWith({String? userId, String? email, String? name}) {
    return User(
        userId: userId ?? this.userId,
        email: email ?? this.email,
        name: name ?? this.name);
  }
  UserEntity toEntity(){
    return UserEntity(
       userId: userId,
        email: email ,
        name: name 
    );
  }
static User fromEntity(UserEntity entity){
  return User(userId: entity.userId, email: entity.email, name: entity.name);
}
  @override
  // TODO: implement props
  List<Object?> get props => [userId, email, name];
}
