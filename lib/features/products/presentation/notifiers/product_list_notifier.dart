import 'package:flutter/material.dart';

import '../../domain/entities/product.dart';
import '../../domain/usecases/find_all_poduct_usecase.dart';

class ProductListNotifier with ChangeNotifier {
  final FindAllProductUsecase findAllProductUsecase;

  List<Product> products = [];
  bool loading = false;
  dynamic error;

  ProductListNotifier({required this.findAllProductUsecase});

  void findAllProducts() {
    loading = true;
    products = [];
    error = null;

    notifyListeners();

    findAllProductUsecase().then((value) {
      products = value;
    }).catchError((_error, stack) {
      error = _error;
    }).whenComplete(() => notifyListeners());
  }
}
