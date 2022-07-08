import 'package:flutter_clean_arch/features/product/domain/entities/product.dart';
import 'package:flutter_clean_arch/features/product/domain/repositories/product_repository.dart';
import 'package:flutter_clean_arch/features/product/domain/usecases/usecase.dart';

class FindAllProductUsecase implements Usecase<Future<List<Product>>, void> {
  final ProductRepository productRepository;

  FindAllProductUsecase({ required this.productRepository });

  @override
  Future<List<Product>> call({ void params })
    => productRepository.findAll();
}
