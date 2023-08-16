import 'package:stacked/stacked.dart';
import 'package:stc_health_test/models/product_model.dart';

import '../network/api_client.dart';

class ProductListViewModel extends BaseViewModel {
  final apiClient = ApiClient();
  var selectedIndex = 0;
  List<Product> products = [];

  getProducts() async {
    setBusy(true);
    try {
      final response = await apiClient.getRequest('/products');
      print('GET Request Response: ${response.data}');
      for (var data in response.data) {
        products.add(Product.fromJson(data));
        notifyListeners();
      }
    } catch (error) {
      setBusy(false);
      print('Error: $error');
      return false;
    }
  }

  void onItemTapped(int index) {
    selectedIndex = index;
    notifyListeners();
  }
}
