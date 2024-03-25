import 'package:equatable/equatable.dart';
import 'package:MyUser_repository/src/entities/user_entities.dart';

class MyUser extends Equatable {
  final String MyUserId;
  final String email;
  final String name;

  const MyUser({
    required this.MyUserId,
    required this.email,
    required this.name,
  });

  static const empty = MyUser(MyUserId: '', email: '', name: '');
  // copyWith methods for modifying the MyUser variables
  MyUser copyWith({String? MyUserId, String? email, String? name}) {
    return MyUser(
      MyUserId: MyUserId ?? this.MyUserId,
      // this.MyUserId is the one that is found in the MyUser object
      // that already have But MyUserId is the one
      // that is passed by the copyWith method
      email: email ?? this.email,
      name: name ?? this.name,
    );
  }
// toEntity converts MyUser Object to MyUserEntity Object
  MyUserEntity toEntity() {
    return MyUserEntity(MyUserId: MyUserId, email: email, name: name);
  }
// fromEntity converts MyUserEntity Object to MyUser Object
  static MyUser fromEntity(MyUserEntity entity) {
    return MyUser(MyUserId: entity.MyUserId, email: entity.email, name: entity.name);
  }

  @override

  List<Object?> get props => [MyUserId, email, name];
}
