import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class slider extends StatefulWidget {
  slider({super.key});

  @override
  State<slider> createState() => _sliderState();
}

class _sliderState extends State<slider> {
  final List<String> imgList = [
    'assets/img/bf8mPkK5x5Zcnc3RJCZ0JZ1338KsGLnbw3Olu38t.png',
    'assets/img/bf8mPkK5x5Zcnc3RJCZ0JZ1338KsGLnbw3Olu38t.png',
    'assets/img/bf8mPkK5x5Zcnc3RJCZ0JZ1338KsGLnbw3Olu38t.png',
  ];
  var currentIndex = 0;
  // var number;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Stack(
        children: [
          Container(
            height: 200,
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
                height: 200,
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
    );
  }
}
