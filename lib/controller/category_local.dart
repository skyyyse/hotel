import 'package:get/get.dart';
import 'package:hotel/controller/product_local.dart';
import 'package:hotel/controller/service_controller.dart';
import 'package:hotel/model/category_model_local.dart';

class category_local extends GetxController{
  var categories = <Category_local>[].obs;
  var selectedCategoryId = 0.obs;
  final productService = Get.put(service_controller());
  final productController=Get.put(product_local());
  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }
  void fetchCategories(){
    categories.assignAll(productService.fetchCategories());
    if (categories.isNotEmpty) {
      selectedCategoryId.value = categories[0].id;
      fetchProducts(selectedCategoryId.value);
    }
  }
  void fetchProducts(int categoryId) {
    productController.products.assignAll(productService.fetchProducts(categoryId));
  }
  void onCategorySelected(int categoryId) {
    print(categoryId);
    selectedCategoryId.value = categoryId;
    fetchProducts(categoryId);
  }
}