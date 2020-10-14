import 'package:equatable/equatable.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();
  
  @override
  List<Object> get props => [];
}


class AuthenticationInitial extends AuthenticationState {
  @override
  String toString() => 'Unitialized';
}

class Authenticated extends AuthenticationState{
  final String uid;
  const Authenticated(this.uid);

  @override
  List<Object> get props => [uid];
  @override
  String toString() => 'Authenticated { uid: $uid}';
}

class Unauthenticated extends AuthenticationState {}
