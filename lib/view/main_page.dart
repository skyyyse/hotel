import 'package:cuberto_bottom_bar/internal/cuberto_bottom_bar.dart';
import 'package:cuberto_bottom_bar/internal/tab_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:hotel/controller/main_controller.dart';

class main_page extends StatefulWidget {
  main_page({super.key});

  @override
  State<main_page> createState() => _main_pageState();
}

class _main_pageState extends State<main_page> {
  final controller=Get.put(main_controller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: controller.Page[controller.index],
      bottomNavigationBar: CubertoBottomBar(
        selectedTab: controller.index,
        tabs: const [
          TabData(
            iconData: Icons.home,
            title: 'Home',
            tabColor: Colors.green,
          ),
          TabData(
            iconData: Icons.note_alt_rounded,
            title: 'BooKing',
            tabColor: Colors.green,
          ),
          TabData(
            iconData: Icons.favorite,
            title: 'Profile',
            tabColor: Colors.green,
          ),
          TabData(
            iconData: Icons.settings,
            title: 'Settings',
            tabColor: Colors.green,
          ),
        ],
        onTabChangedListener: (position, title, color) {
          setState(() {
            controller.index = position;
          });
        },
      ),
    );
  }
}
