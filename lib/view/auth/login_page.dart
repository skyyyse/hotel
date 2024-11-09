import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:hotel/view/auth/register_page.dart';
import 'package:hotel/view/constants.dart';
import 'package:hotel/view/main_page.dart';

class login_page extends StatefulWidget {
  login_page({super.key});

  @override
  State<login_page> createState() => _login_pageState();
}

class _login_pageState extends State<login_page> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //image
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 200,
                    width: 200,
                    child: Image(
                      image: AssetImage(
                        'images/login.jpg'
                      ),
                    ),
                  ),
                ),
                //email
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: TextField(
                    // controller: controller.email,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 20.0),
                      hintText: 'Email'.tr,
                      prefixIcon:  Icon(
                        Icons.email_outlined,
                        color:Colors.grey,
                      ),
                      enabledBorder:  OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                        borderSide: BorderSide(color: Colors.red),
                      ),
                      fillColor: kcontentColor,
                      filled: true,
                    ),
                  ),
                ),
                //password
                Padding(
                  padding: const EdgeInsets.only(bottom: 10,top: 10),
                  child: TextField(
                    // obscureText: controller.isHidden,
                    // controller: controller.password,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 20.0),
                      hintText: 'Password'.tr,
                      prefixIcon:  Icon(
                        Icons.password,
                        color: Colors.grey,
                      ),
                      enabledBorder:  OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      fillColor: Colors.grey.shade200,
                      filled: true,
                      // suffixIcon: IconButton(
                      //   onPressed: () {
                      //     setState(() {
                      //       controller.isHidden
                      //           ? controller.isHidden = false
                      //           : controller.isHidden = true;
                      //     });
                      //   },
                      //   icon: controller.isHidden
                      //       ? const Icon(Icons.visibility)
                      //       : const Icon(
                      //     Icons.visibility_off_outlined,
                      //   ),
                      // ),
                    ),
                  ),
                ),
                //forgot password
                Padding(
                  padding: const EdgeInsets.only(bottom: 10,top: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "forgot Password ? ".tr,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                //button
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: MaterialButton(
                    onPressed: () {
                      Get.offAll(main_page());
                    },
                    color: buttonColor,
                    textColor: Colors.white,
                    minWidth: double.infinity,
                    height: 60,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: const Text(
                      'Login',
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                  ),
                ),
                // Or continue with
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 2,
                        width: size.width * 0.2,
                        color: Colors.black12,
                      ),
                      Text(
                        "  Or continue with   ",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: textColor2,
                          fontSize: 16,
                        ),
                      ),
                      Container(
                        height: 2,
                        width: size.width * 0.2,
                        color: Colors.black12,
                      ),
                    ],
                  ),
                ),
                //logo
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      socialIcon("images/google.png"),
                      socialIcon("images/apple.png"),
                      socialIcon("images/facebook.png"),
                    ],
                  ),
                ),
                // Don't have account
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have account ? ".tr,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            Get.to(signup());
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child:  Text(
                            'Sign up'.tr,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container socialIcon(image) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 32,
        vertical: 15,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.white,
          width: 2,
        ),
      ),
      child: Image.asset(
        image,
        height: 35,
      ),
    );
  }
}
