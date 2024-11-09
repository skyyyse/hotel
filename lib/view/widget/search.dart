import 'package:flutter/material.dart';
import 'package:hotel/view/constants.dart';

class search extends StatelessWidget {
  const search({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child:Padding(
        padding:
        const EdgeInsets.only(left: 10, right: 10, top: 20,bottom:18),
        child: Container(
          height: 55,
          width: double.infinity,
          decoration: BoxDecoration(
            color: kcontentColor,
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
          child: Row(
            children: [
              const Icon(
                Icons.search,
                color: Colors.grey,
                size: 30,
              ),
              const SizedBox(width: 10),
              const Flexible(
                flex: 4,
                child: TextField(
                  decoration: InputDecoration(
                      hintText: "Search...", border: InputBorder.none),
                ),
              ),
              Container(
                height: 25,
                width: 1.5,
                color: Colors.grey,
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.tune,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
