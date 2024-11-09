import 'package:flutter/material.dart';
import 'package:hotel/view/widget/appbar.dart';
import 'package:hotel/view/widget/category.dart';
import 'package:hotel/view/widget/item.dart';
import 'package:hotel/view/widget/search.dart';
import 'package:hotel/view/widget/slider.dart';

class home_page extends StatefulWidget {
  home_page({super.key});

  @override
  State<home_page> createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          //appbar
          appbar(title: 'Home',status: true,),
          //search
          search(),
          //slider
          slider(),
          //category
          category(),
          //item
          item(),
        ],
      )
    );
  }
}
