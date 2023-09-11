import 'package:fake_apis_project_with_block/models/productmodels.dart';
import 'package:flutter/material.dart';


class ProductList extends StatelessWidget {
  final List<Product> products;

  ProductList(this.products);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return ListTile(
          title: Text(product.title),
          subtitle: Text('\$${product.price.toStringAsFixed(2)}'),
        );
      },
    );
  }
}
