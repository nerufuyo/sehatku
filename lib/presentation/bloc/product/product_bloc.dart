import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sehatku/data/model/product_model.dart';
import 'package:sehatku/domain/usecase/get_products.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final GetProducts getProducts;
  ProductBloc(this.getProducts) : super(ProductInitial()) {
    on<ProductEvent>((event, emit) async {
      emit(ProductLoading());
      try {
        final products = await getProducts.execute();
        emit(ProductLoaded(products));
      } catch (e) {
        emit(ProductError(e.toString()));
      }
    });
  }
}
