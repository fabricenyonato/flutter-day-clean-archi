import '../../../products/data/models/product_model.dart';

abstract class ProductApi {
  Future<List<ProductModel>> findAll();
}
