import 'package:flutter_clean_arch/features/product/data/models/product_model.dart';

abstract class ProductApi {
  Future<List<ProductModel>> findAll();
}
