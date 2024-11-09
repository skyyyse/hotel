import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:hotel/controller/category_local.dart';
import 'package:hotel/view/constants.dart';

class category extends StatefulWidget {
  category({super.key});

  @override
  State<category> createState() => _categoryState();
}

class _categoryState extends State<category> {
  final category_local_controller = Get.put(category_local());
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 5, right: 5),
            child: Container(
              height: 50,
              child: Obx(() {
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: category_local_controller.categories.length,
                  itemBuilder: (context, index) {
                    final category = category_local_controller.categories[index];
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          category_local_controller.onCategorySelected(category.id);
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: category_local_controller.selectedCategoryId.value ==
                                    category.id
                                ? Colors.redAccent
                                : kcontentColor,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 10, right: 10, top: 5, bottom: 5),
                            child: Row(
                              children: [
                                Text(
                                  category.title,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: category_local_controller
                                                .selectedCategoryId.value ==
                                            category.id
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
