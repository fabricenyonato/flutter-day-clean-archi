import 'package:dio/dio.dart';
import 'package:flutter_clean_arch/const.dart';
import 'package:flutter_clean_arch/features/product/data/datasources/product_api.dart';
import 'package:flutter_clean_arch/features/product/data/datasources/product_api_impl.dart';
import 'package:flutter_clean_arch/features/product/data/repositories/product_repository_impl.dart';
import 'package:flutter_clean_arch/features/product/domain/repositories/product_repository.dart';
import 'package:flutter_clean_arch/features/product/domain/usecases/find_all_poduct_usecase.dart';
import 'package:get_it/get_it.dart';

final getit = GetIt.instance;

void initDi() {
  final dio = Dio(BaseOptions(
    baseUrl: baseUrl + '/api',
    responseType: ResponseType.json,
  ));

  getit.registerSingleton<ProductApi>(ProductApiImpl(httpClient: dio));

  getit.registerSingleton<ProductRepository>(ProductRepositoryImpl(
    api: getit<ProductApi>()
  ));

  getit.registerSingleton<FindAllProductUsecase>(FindAllProductUsecase(
    productRepository: getit<ProductRepository>()
  ));
}
