import 'package:equatable/equatable.dart';

class User extends Equatable {
  @override
  List get props => [username,password];

  final String username;
  final String password;

  const User({
    required this.username,
    required this.password,
  });
  
}
