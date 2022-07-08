import 'package:flutter/material.dart';
import 'package:flutter_clean_arch/features/product/domain/entities/product.dart';

class ProductTile extends StatelessWidget {
  final Product product;

  const ProductTile({ Key? key, required this.product }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final image = Image(
      // image: NetworkImage('https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/portrait-of-cat-sitting-on-sofa-at-home-royalty-free-image-1574708553.jpg?crop=0.668xw:1.00xh;0.167xw,0&resize=300:*'),
      image: NetworkImage(product.image),
      height: 150,
      fit: BoxFit.cover,
      width: double.infinity,
    );

    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: Colors.grey,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          image,
          Container(
            height: 1,
            color: Colors.grey,
          ),

          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  product.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),

                const Spacer(),

                Text(
                  '\$${product.price}',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
