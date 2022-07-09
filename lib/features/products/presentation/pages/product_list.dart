import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../notifiers/product_list_notifier.dart';
import '../widgets/product_tile.dart';

class ProductList extends StatefulWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  @override
  Widget build(BuildContext context) {
    final notifier = context.watch<ProductListNotifier>();

    return Scaffold(
      body: ListView.builder(
        itemCount: notifier.products.length,
        itemBuilder: (context, index) => ProductTile(
          product: notifier.products[index],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      final notifier = context.read<ProductListNotifier>();
      notifier.findAllProducts();
    });
  }
}
