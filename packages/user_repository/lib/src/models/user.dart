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
  // copyWith methods for modifying the user variables
  User copyWith({String? userId, String? email, String? name}) {
    return User(
      userId: userId ?? this.userId,
      // this.userId is the one that is found in the User object
      // that already have But userId is the one
      // that is passed by the copyWith method
      email: email ?? this.email,
      name: name ?? this.name,
    );
  }
// toEntity converts User Object to UserEntity Object
  UserEntity toEntity() {
    return UserEntity(userId: userId, email: email, name: name);
  }
// fromEntity converts UserEntity Object to User Object
  static User fromEntity(UserEntity entity) {
    return User(userId: entity.userId, email: entity.email, name: entity.name);
  }

  @override

  List<Object?> get props => [userId, email, name];
}
