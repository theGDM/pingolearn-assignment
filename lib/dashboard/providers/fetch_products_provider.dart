import 'package:ecommerce/dashboard/models/product_model.dart';
import 'package:ecommerce/dashboard/repository/product_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final fetchProductsProvider = FutureProvider<List<Product>>((ref) async {
  final productsRepository = ref.watch(productsRepositoryProvider);
  return productsRepository.fetchProductsData();
});
