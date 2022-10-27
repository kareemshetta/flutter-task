import 'package:flutter_task/models/product_model.dart';

abstract class ProductState {}

class InitialProductState extends ProductState {}

class GetAllProductSuccessState extends ProductState {
  final List<ProductModel> products;
  GetAllProductSuccessState(this.products);
}

class GetAllProductLoadingState extends ProductState {}

class GetAllProductErrorState extends ProductState {}
