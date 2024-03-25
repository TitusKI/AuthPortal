import 'package:equatable/equatable.dart';
import 'package:user_repository/src/entities/entities.dart';

class MyUser extends Equatable {
  final String userId;
  final String email;
  final String name;

  const MyUser({
    required this.userId,
    required this.email,
    required this.name,
  });

  static const empty = MyUser(userId: '', email: '', name: '');
  // copyWith methods for modifying the MyUser variables
  MyUser copyWith({String? userId, String? email, String? name}) {
    return MyUser(
      userId: userId ?? this.userId,
       // this.userId is the one that is found in the MyUser object
      // that already have But userId is the one
      // that is passed by the copyWith method
      email: email ?? this.email,
      name: name ?? this.name,
    );
  }
// toEntity converts MyUser Object to MyUserEntity Object
  MyUserEntity toEntity() {
    return MyUserEntity(userId: userId, email: email, name: name);
  }
// fromEntity converts MyUserEntity Object to MyUser Object
  static MyUser fromEntity(MyUserEntity entity) {
    return MyUser(userId: entity.userId, email: entity.email, name: entity.name);
  }

  @override

  List<Object?> get props => [userId, email, name];
}
