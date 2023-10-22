import 'package:get_it/get_it.dart';
import 'package:sehatku/data/repository/repository.dart';
import 'package:sehatku/domain/usecase/get_products.dart';
import 'package:sehatku/domain/usecase/post_user.dart';
import 'package:sehatku/presentation/bloc/product/product_bloc.dart';
import 'package:sehatku/presentation/bloc/user/user_bloc.dart';

final locator = GetIt.instance;

void init() {
  // BLoC
  locator.registerFactory(() => ProductBloc(locator()));
  locator.registerFactory(() => UserBloc(locator()));

  // Use Case
  locator.registerLazySingleton(() => GetProducts(locator()));
  locator.registerLazySingleton(() => PostUser(locator()));

  // Repository
  locator.registerLazySingleton(() => Repository());
}
