import 'package:flutter/material.dart';
import 'package:flutter_clean_arch/di.dart';
import 'package:flutter_clean_arch/features/product/domain/usecases/find_all_poduct_usecase.dart';
import 'package:flutter_clean_arch/features/product/presentation/product_list.dart';
import 'package:flutter_clean_arch/features/product/presentation/product_list_notifier.dart';
import 'package:provider/provider.dart';

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
