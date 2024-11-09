import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:hotel/controller/favorite_local.dart';
import 'package:hotel/controller/product_local.dart';
import 'package:hotel/model/product_model_local.dart';
import 'package:hotel/view/constants.dart';
import 'package:hotel/view/detail/detail.dart';

class item extends StatefulWidget {
  item({super.key});

  @override
  State<item> createState() => _itemState();
}

class _itemState extends State<item> {
  final product_local_controller=Get.put(product_local());

  final farvorite_local_controller=Get.put(farvorite_local());

  final TextEditingController searchController = TextEditingController();

  String searchQuery = '';
  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.only(right: 5, left: 5, top: 10, bottom: 20),
      sliver: Obx(
        () {
          final filteredProducts = product_local_controller.products.where((product) {
            return product.title.toLowerCase().contains(searchQuery);
          }).toList();
          return SliverGrid(
            delegate: SliverChildBuilderDelegate(
              childCount: filteredProducts.length,
              (context, index) {
                final product = filteredProducts[index];
                return GestureDetector(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailScreen(image: product.image),
                      ),
                    );
                  },
                  child: Padding(
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
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image(
                                        width: 120,
                                        height: 120,
                                        fit: BoxFit.cover,
                                        image: AssetImage(
                                          product.image,
                                          // 'https://t3.ftcdn.net/jpg/02/94/19/40/240_F_294194023_disE35GtlVLDQx4caNDaWewZI8LbxWFQ.jpg'
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
                                        product.title,
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
                                color: Colors.black,
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(20),
                                  bottomLeft: Radius.circular(10),
                                ),
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  farvorite_local_controller.toggleFavorite(product);
                                },
                                child: Obx(() {
                                  final isFavorite = farvorite_local_controller.isExist(product);
                                  return Icon(
                                    isFavorite ? Icons.favorite : Icons.favorite_border,
                                    color: isFavorite ? Colors.red : Colors.white,
                                  );
                                }),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
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
    );
  }
}
