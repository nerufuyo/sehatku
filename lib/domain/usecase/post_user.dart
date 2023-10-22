import 'package:sehatku/data/model/user_model.dart';
import 'package:sehatku/data/repository/repository.dart';

class PostUser {
  final Repository repository;

  PostUser(this.repository);

  Future<User> call(String email, String password) async {
    return await repository.postLogin(email, password);
  }
}
