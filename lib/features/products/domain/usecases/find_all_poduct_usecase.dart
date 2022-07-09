import '../../../../core/usecases/usecase.dart';
import '../entities/product.dart';
import '../repositories/product_repository.dart';


class FindAllProductUsecase implements Usecase<Future<List<Product>>, void> {
  final ProductRepository productRepository;

  FindAllProductUsecase({required this.productRepository});

  @override
  Future<List<Product>> call({void params}) => productRepository.findAll();
}
