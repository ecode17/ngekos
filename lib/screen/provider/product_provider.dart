import 'package:flutter/material.dart';
import 'product_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProductProvider extends ChangeNotifier {
  List<Product> _products = [];

  List<Product> get products => _products;

  Future<void> fetchProducts() async {
    try {
      final response = await Supabase.instance.client.from('products').select();
      final List<Map<String, dynamic>> data = response;
      _products = data.map((e) => Product.fromJson(e)).toList();
      notifyListeners();
    } catch (error) {
      print('Error fetching products: $error');
    }
  }
}
