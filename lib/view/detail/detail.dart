import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hotel/view/detail/Widget/image_slider.dart';

class DetailScreen extends StatefulWidget {
  var image, ti;
  DetailScreen({super.key, required this.image});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int currentImage = 0;
  int currentColor = 1;
  final List<String> imgList = [
    'assets/img/bf8mPkK5x5Zcnc3RJCZ0JZ1338KsGLnbw3Olu38t.png',
    'assets/img/bf8mPkK5x5Zcnc3RJCZ0JZ1338KsGLnbw3Olu38t.png',
    'assets/img/bf8mPkK5x5Zcnc3RJCZ0JZ1338KsGLnbw3Olu38t.png',
  ];
  var currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.white,
            title: Text('sssssss'),
            centerTitle: true,
            pinned: true,
            elevation: 0,
            shadowColor: Colors.transparent,
            surfaceTintColor: Colors.transparent,
            leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(Icons.arrow_back_ios),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.favorite),
              ),
            ],
          ),
          SliverList.builder(
            itemCount: 1,
            itemBuilder: (context, index) {
              return Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height*0.9,
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: 300,
                          width: double.infinity,
                          child: CarouselSlider.builder(
                            itemCount: imgList.length,
                            itemBuilder:
                                (BuildContext context, int itemIndex, int pageViewIndex) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(
                                    imgList[itemIndex],
                                    fit: BoxFit.cover,
                                    width: double
                                        .infinity, // Ensure the image takes up full width
                                  ),
                                ),
                              );
                            },
                            options: CarouselOptions(
                              scrollPhysics: BouncingScrollPhysics(),
                              autoPlay: true,
                              height: 300,
                              aspectRatio: 16 / 9, // Adjust aspect ratio to fit full width
                              viewportFraction: 1.0, // Full width for each item
                              onPageChanged: (index, reason) {
                                setState(() {
                                  currentIndex = index;
                                });
                              },
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 20,
                          left: 0,
                          right: 0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: imgList.asMap().entries.map((entry) {
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    currentIndex = entry.key;
                                  });
                                },
                                child: Container(
                                  width: currentIndex == entry.key ? 17 : 7,
                                  height: 7.0,
                                  margin: const EdgeInsets.symmetric(horizontal: 3.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color:
                                    currentIndex == entry.key ? Colors.red : Colors.teal,
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color:Colors.red,
                        borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(20))
                      ),
                      child: const Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text("Description"),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text("ID :412456526"),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text("Like :12"),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text("Main Categories :Care"),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text("Brand :Toyota"),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text("Model :Alphard"),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text("Year :2006"),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text("Tax Type:Tax Paper"),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text("Condition :Userd"),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text("Body Type :MPV (Minivan)"),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text("Fuel :Petrol"),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text("Transmission :Auto"),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text("Color :Black"),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
