import 'package:stacked/stacked.dart';

class ProductDetailVM extends BaseViewModel {
  bool visibility = false;

  showVisibility() {
    visibility = !visibility;
    notifyListeners();
  }
}
