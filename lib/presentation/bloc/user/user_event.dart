part of 'user_bloc.dart';

sealed class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

final class PostUserEvent extends UserEvent {
  final String email;
  final String password;

  const PostUserEvent({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}
