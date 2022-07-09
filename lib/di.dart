import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'constants.dart';
import 'features/products/data/datasources/product_api.dart';
import 'features/products/data/datasources/product_api_impl.dart';
import 'features/products/data/repositories/product_repository_impl.dart';
import 'features/products/domain/repositories/product_repository.dart';
import 'features/products/domain/usecases/find_all_poduct_usecase.dart';

final getit = GetIt.instance;

void initDi() {
  final dio = Dio(
    BaseOptions(
      baseUrl: baseUrl + '/api',
      responseType: ResponseType.json,
    ),
  );

  getit.registerSingleton<ProductApi>(ProductApiImpl(httpClient: dio));

  getit.registerSingleton<ProductRepository>(
    ProductRepositoryImpl(api: getit<ProductApi>()),
  );

  getit.registerSingleton<FindAllProductUsecase>(
    FindAllProductUsecase(productRepository: getit<ProductRepository>()),
  );
}
