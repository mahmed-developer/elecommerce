import 'package:flutter/material.dart';
import 'package:elecommerce/model/product_model.dart';

class PGridView extends StatelessWidget {
  final List<ProductModel> products;
  PGridView({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
          crossAxisSpacing: 8.0, // Horizontal space between grid items
          mainAxisSpacing: 8.0, // Vertical space between grid items
        ),
        itemCount: products.length,
        itemBuilder: (ctx, index){
          return GridTile(
              child: Image.network(products[index].imageUrl, fit: BoxFit.cover),
          footer: GridTileBar(
          backgroundColor: Colors.black54,
          title: Text(products[index].name),
          subtitle: Text('\$${products[index].price.toString()}'),)
          );
        });
  }
}
