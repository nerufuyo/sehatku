import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sehatku/data/model/user_model.dart';
import 'package:sehatku/domain/usecase/post_user.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final PostUser postUser;
  UserBloc(this.postUser) : super(UserInitial()) {
    on<UserEvent>((event, emit) async {
      emit(UserLoading());
      if (event is PostUserEvent) {
        try {
          final user = await postUser(event.email, event.password);
          emit(UserLoaded(user));
        } catch (e) {
          emit(UserError(e.toString()));
        }
      }
    });
  }
}
