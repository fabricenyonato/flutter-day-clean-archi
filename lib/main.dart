import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'di.dart';
import 'features/products/domain/usecases/find_all_poduct_usecase.dart';
import 'features/products/presentation/pages/product_list.dart';
import 'features/products/presentation/notifiers/product_list_notifier.dart';

void main() {
  initDi();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ProductListNotifier(
            findAllProductUsecase: getit<FindAllProductUsecase>(),
          ),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Clean Archi',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const ProductList()
      ),
    );
  }
}
