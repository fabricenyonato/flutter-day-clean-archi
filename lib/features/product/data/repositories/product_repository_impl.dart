import 'package:flutter_clean_arch/features/product/data/datasources/product_api.dart';
import 'package:flutter_clean_arch/features/product/domain/entities/product.dart';
import 'package:flutter_clean_arch/features/product/domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductApi api;

  ProductRepositoryImpl({ required this.api });

  @override
  Future<List<Product>> findAll() => api.findAll();
}
