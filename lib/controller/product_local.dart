import 'package:get/get.dart';
import 'package:hotel/controller/service_controller.dart';
import 'package:hotel/model/product_model_local.dart';

class product_local extends GetxController{
  var products = <Product_local>[].obs;
  final productService = Get.put(service_controller());
  void fetchProducts(int categoryId) {
    print(categoryId);
    products.assignAll(productService.fetchProducts(categoryId));
  }
}