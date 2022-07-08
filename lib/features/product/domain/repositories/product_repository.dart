import 'package:flutter_clean_arch/features/product/domain/entities/product.dart';

abstract class ProductRepository {
  Future<List<Product>> findAll();
}
