import 'package:flutter_clean_arch/const.dart';
import 'package:flutter_clean_arch/features/product/domain/entities/product.dart';

class ProductModel extends Product {
  ProductModel({
    required int id,
    required String name,
    required String image,
    required double price,
    required int stock,
  }) : super(
          id: id,
          name: name,
          image: image,
          price: price,
          stock: stock,
        );

  factory ProductModel.fromJson(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'],
      name: map['attributes']['name'],
      image: baseUrl + map['attributes']['image']['data']['attributes']['url'],
      price: double.tryParse('${map['attributes']['price']}') ?? 0,
      stock: map['attributes']['stock'],
    );
  }
}
