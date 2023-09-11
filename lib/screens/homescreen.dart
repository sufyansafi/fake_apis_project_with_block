import 'package:fake_apis_project_with_block/bloc/productbloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productBloc = BlocProvider.of<ProductBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Fake Store Products'),
      ),
      body: BlocBuilder<ProductBloc, List<Map<String, dynamic>>>(
  builder: (context, products) {
   return ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Dismissible(
            key: Key(product['id'].toString()), // Unique key for each item
            background: Container(
              color: Color.fromARGB(255, 26, 172, 230),
              alignment: Alignment.centerRight,
              child: Icon(
                Icons.delete,
                color: Colors.white,
              ),
            ),
            onDismissed: (direction) {
              // Remove the product from the list when dismissed
               productBloc.deleteProduct(product['id']);

              
              BlocProvider.of<ProductBloc>(context).deleteProduct(index);
            },
            child: ListTile(
              title: Text(product['title']),
              subtitle: Text('\$${product['price']}'),
              // Add more UI elements as needed
              
            ),
          );
        },
      );
  },
),




      floatingActionButton: FloatingActionButton(
        onPressed: () {
          productBloc.fetchProducts();
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}


