import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task/cubits/product_states.dart';

import '../../network/dio_helper/dio_helper.dart';
import '../models/product_model.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(InitialProductState());

  static ProductCubit get(BuildContext context) {
    return BlocProvider.of(context);
  }

  List<ProductModel> fixedProducts = [
    ProductModel(
        imageUrl:
            'https://eg.jumia.is/unsafe/fit-in/680x680/filters:fill(white)/product/83/046013/1.jpg?3670',
        name: 'Samsung Galaxy note 7',
        price: 1000,
        siteImage: 'https://d1b3667xvzs6rz.cloudfront.net/2018/09/Jumia.png'),
    ProductModel(
        imageUrl:
            'https://eg.jumia.is/unsafe/fit-in/680x680/filters:fill(white)/product/83/046013/1.jpg?3670',
        name: 'Samsung Galaxy note 7',
        price: 1006,
        siteImage: 'https://d1b3667xvzs6rz.cloudfront.net/2018/09/Jumia.png'),
    ProductModel(
        imageUrl:
            'https://eg.jumia.is/unsafe/fit-in/680x680/filters:fill(white)/product/83/046013/1.jpg?3670',
        name: 'Samsung Galaxy note 7',
        price: 1005,
        siteImage: 'https://d1b3667xvzs6rz.cloudfront.net/2018/09/Jumia.png')
  ];
  List<ProductModel> _products = [];

  List<ProductModel> get products {
    return [..._products];
  }

  Future<void> getProductsFromAll(String productName) async {
    emit(GetAllProductLoadingState());
    final path = '$productName/50';

    try {
      final responseJumiaa = await DioHelper.getDataFromJumiaa(path);
      final responseAliExpress =
          await DioHelper.getDataFromAliExpress(productName);
      //  print(responseJumiaa.data);
      // print(responseAliExpress.data);
      if (responseJumiaa.statusCode == 200 &&
          responseAliExpress.statusCode == 200) {
        final responseJumiaaData = (responseJumiaa.data) as List;
        final responseAliExpressData =
            (responseAliExpress.data['docs']) as List;
        print(responseAliExpressData);
        _products = responseJumiaaData
            .map((e) => ProductModel.fromJsonJumia(e))
            .toList();
        for (var element in responseAliExpressData) {
          print('element:$element');
          final product = ProductModel.fromJsonAliExpress(element);
          _products.add(product);
        }
        arrange();
        emit(GetAllProductSuccessState(products));
      } else {
        emit(GetAllProductErrorState());
      }
    } catch (err) {
      print(err);
      emit(GetAllProductErrorState());
    }
  }

// this method for comparing prices
  void arrange() {
    _products.sort(
      (a, b) => a.price.compareTo(b.price),
    );
    _products = _products.reversed.toList();
  }
}
