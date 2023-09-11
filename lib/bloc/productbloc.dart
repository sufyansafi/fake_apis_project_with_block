import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProductBloc extends Cubit<List<Map<String, dynamic>>> {
  ProductBloc() : super([]);

  Future<void> fetchProducts() async {
    try {
      final response = await http.get(Uri.parse('https://fakestoreapi.com/products'));
      if (response.statusCode == 200) {
        final List<Map<String, dynamic>> products = List<Map<String, dynamic>>.from(json.decode(response.body));
        emit(products);
      } else {
        // Handle error here
        print('Failed to load products');
      }
    } catch (error) {
      // Handle exception here
      print('Error: $error');
    }
  }

void deleteProduct(int index) {
    final currentProducts = state;
    currentProducts.removeAt(index);
    emit([...currentProducts]);
    
  }

}
