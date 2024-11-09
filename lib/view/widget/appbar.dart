import 'package:flutter/material.dart';

class appbar extends StatelessWidget {
  String title;
  bool status;
   appbar({super.key,required this.title,required this.status});
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.white,
      title: Text(title,style: TextStyle(fontSize: 20),),
      elevation: 0,
      centerTitle: true,
      pinned: true,
      leading: status==true?Icon(Icons.notes):null,
      shadowColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child:status==true? CircleAvatar(
            radius: 25,
            backgroundColor: Colors.red,
            backgroundImage: NetworkImage('https://imgs.search.brave.com/ZlMA1xyb5O_WINlJ1KTJPjXirJamlkRY4vG4wWqequQ/rs:fit:500:0:0:0/g:ce/aHR0cHM6Ly93YWxs/cGFwZXJzLmNvbS9p/bWFnZXMvZmVhdHVy/ZWQvY29vbC1wcm9m/aWxlLXBpY3R1cmUt/ODdoNDZnY29iamw1/ZTR4dS5qcGc'),
          ):null,
        ),
      ],
    );
  }
}
