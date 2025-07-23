import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:donut_app_2b_carmona/models/product.dart';

class ProductService{
  static const String _baseUrl = 'http://localhost:8080/api';

  static Future<List<Product>> getProducts() async {
    final response = await http.get(Uri.parse('$_baseUrl/products'));
    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((item) => Product.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }

  static Future<List<Product>> getProductByCategory(int categoryId) async {
    final response = await http.get(
      Uri.parse('http://localhost:8080/api/by-category/$categoryId'),
    );
    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((item) => Product.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load products by category');
    }
  }


}