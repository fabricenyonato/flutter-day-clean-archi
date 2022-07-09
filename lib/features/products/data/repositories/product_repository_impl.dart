import '../datasources/product_api.dart';
import '../../domain/entities/product.dart';
import '../../domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductApi api;

  ProductRepositoryImpl({ required this.api });

  @override
  Future<List<Product>> findAll() => api.findAll();
}
