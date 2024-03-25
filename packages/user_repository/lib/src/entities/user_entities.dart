import 'package:equatable/equatable.dart';

class MyUserEntity extends Equatable {
  final String userId;
  final String email;
  final String name;

  const MyUserEntity({
    required this.userId,
    required this.email,
    required this.name,
  });
  // Send to the firestore
  Map<String, Object?> toDocument() {
    return {
      'userId': userId,
      'email': email,
      'name': name,
    };
  }

// to recieve data from Firestore
  static MyUserEntity fromDocument(Map<String, dynamic> doc) {
    return MyUserEntity(
      userId: doc['userId'],
      email: doc['email'],
      name: doc['name'],
    );
  }

  @override
  List<Object?> get props => [userId, email, name];
}
