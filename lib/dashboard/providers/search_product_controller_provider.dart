import 'package:ecommerce/dashboard/models/product_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchProductControllerNotifier extends StateNotifier<List<Product>> {
  SearchProductControllerNotifier() : super([]);

  void onSearchEvent(String query, List<Product> products) {
    state = [];
    if (query.isNotEmpty) {
      final result = products.where((product) => product.title.toLowerCase().startsWith(query.toString().toLowerCase())).toSet().toList();
      state.addAll(result);
    }
  }
}

final searchProductControllerProvider = StateNotifierProvider<SearchProductControllerNotifier, List<Product>>((ref) {
  return SearchProductControllerNotifier();
});
