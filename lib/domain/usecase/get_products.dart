import 'package:sehatku/data/model/product_model.dart';
import 'package:sehatku/data/repository/repository.dart';

class GetProducts {
  final Repository repository;

  GetProducts(this.repository);

  Future<List<Product>> execute() async {
    return await repository.getProducts();
  }
}
