import 'package:equatable/equatable.dart';

class MyUserEntity extends Equatable {
  final String MyUserId;
  final String email;
  final String name;

  const MyUserEntity({
    required this.MyUserId,
    required this.email,
    required this.name,
  });
  // Send to the firestore
  Map<String, Object?> toDocument() {
    return {
      'MyUserId': MyUserId,
      'email': email,
      'name': name,
    };
  }

// to recieve data from Firestore
  static MyUserEntity fromDocument(Map<String, dynamic> doc) {
    return MyUserEntity(
      MyUserId: doc['MyUserId'],
      email: doc['email'],
      name: doc['name'],
    );
  }

  @override
  List<Object?> get props => [MyUserId, email, name];
}
