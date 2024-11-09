import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/controller/favorite_local.dart';
import 'package:hotel/controller/product_local.dart';
import 'package:hotel/view/constants.dart';
import 'package:hotel/view/widget/appbar.dart';

class favorite_page extends StatefulWidget {
  favorite_page({super.key});

  @override
  State<favorite_page> createState() => _favorite_pageState();
}

class _favorite_pageState extends State<favorite_page> {
  final favorite_local_controller = Get.put(farvorite_local());

  final product_local_controller=Get.put(product_local());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          appbar(title: 'Favorite', status: false),
          Obx((){
            if(favorite_local_controller.favorites.length==0){
              return SliverToBoxAdapter(
                child: Container(
                  height: MediaQuery.of(context).size.height*0.8,
                  width: 200,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 200,
                        width: 200,
                        child: Image(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/img/empty.png'),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }else{
              return SliverList.builder(
                itemCount: favorite_local_controller.favorites.length,
                itemBuilder: (context, index) {
                  final favorites = favorite_local_controller.favorites[index];
                  return Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                          ),
                          child: Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(10),
                                width: 90,
                                height: 90,
                                decoration: BoxDecoration(
                                  color: kcontentColor,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Image.asset(favorites.image),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      favorites.title,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      "\$${favorites.price}",
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: 50,right: 35,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              favorite_local_controller.toggleFavorite(favorites);
                            });
                          },
                          child: const Icon(
                            Icons.delete,
                            color: Colors.red,
                            size: 25,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              );
            }
          }),
        ],
      ),
    );
  }
}
