import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hotel/view/booking/booking.dart';
import 'package:hotel/view/favorite/favorite_page.dart';
import 'package:hotel/view/home_page/home_page.dart';
import 'package:hotel/view/setting/settings.dart';

class main_controller extends GetxController{
  int index=0;
  List Page=[
    home_page(),
    booking(),
    favorite_page(),
    settings(),
  ];
}