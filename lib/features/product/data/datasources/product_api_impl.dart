import 'package:dio/dio.dart';
import 'package:flutter_clean_arch/features/product/data/datasources/product_api.dart';
import 'package:flutter_clean_arch/features/product/data/models/product_model.dart';

class ProductApiImpl implements ProductApi {
  final Dio httpClient;

  ProductApiImpl({ required this.httpClient });

  @override
  Future<List<ProductModel>> findAll() async {
    final response = await httpClient.get('/products?populate=*');

    return (response.data['data'] as List<dynamic>)
      .map((product) => ProductModel.fromJson(product))
      .toList();
  }
}
