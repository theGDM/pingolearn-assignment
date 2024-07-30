import 'dart:convert';
import 'package:ecommerce/common/services/logger.dart';
import 'package:ecommerce/dashboard/models/product_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class ProductRepository {
  Future<List<Product>> fetchProductsData() async {
    String endPoint = 'https://dummyjson.com/products';
    try {
      Response response = await http.get(Uri.parse(endPoint));
      if (response.statusCode == 200) {
        final List result = json.decode(response.body)['products'];
        return result.map(((product) => Product.fromJson(product))).toList();
      } else {
        throw Exception(response.reasonPhrase);
      }
    } catch (error) {
      logger.e('Error: $error');
      return [];
    }
  }
}

final productsRepositoryProvider = Provider<ProductRepository>((ref) => ProductRepository());
