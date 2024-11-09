import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/controller/product_local.dart';
import 'package:hotel/view/constants.dart';
import 'package:hotel/view/widget/appbar.dart';

class booking extends StatelessWidget {
  booking({super.key});
  final  productController = Get.put(product_local());
  String searchQuery = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          appbar(title: "Booking", status: false),
          SliverPadding(
            padding:
            EdgeInsets.only(right: 5,left: 5,top: 10, bottom: 20),
            sliver: Obx(
                  () {
                final filteredProducts =
                productController.products.where((product) {
                  return product.title.toLowerCase().contains(searchQuery);
                }).toList();
                return SliverGrid(
                  delegate: SliverChildBuilderDelegate(
                    childCount: filteredProducts.length,
                        (context, index) {
                      final product = filteredProducts[index];
                      return Padding(
                        padding: const EdgeInsets.all(8),
                        child: Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: kcontentColor,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                children: [
                                  Expanded(
                                    flex: 5,
                                    child: Padding(
                                      padding: const EdgeInsets.all(15),
                                      child: Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(10),
                                            color: Colors.white
                                        ),
                                        child: Center(
                                          child: Image(
                                            width: 120,
                                            height: 120,
                                            fit: BoxFit.cover,
                                            image: AssetImage(
                                              product.image,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 10,right: 10),
                                      child: Container(
                                        width: double.infinity,
                                        child: Center(
                                          child: Text(
                                            'Hotels.com - Deals & Discounts',
                                            style:  TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize:14,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      width: double.infinity,
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 10,right: 10,bottom: 10),
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "\$${20}/night",
                                              style:  TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                  fontSize: 14
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                Icon(Icons.star,size: 18,color: Colors.deepOrange,),
                                                Text('(4.5)')
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              child: Align(
                                alignment: Alignment.topRight,
                                child: Container(
                                  height: 40,
                                  width: 40,
                                  decoration: const BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(20),
                                      bottomLeft: Radius.circular(10),
                                    ),
                                  ),
                                  child: GestureDetector(
                                    onTap: () {
                                      // provider.toggleFavorite(product);
                                    },
                                    child: Icon(Icons.favorite),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 0,
                    mainAxisSpacing: 0,
                    childAspectRatio: 0.75,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
