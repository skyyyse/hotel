import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:hotel/view/auth/login_page.dart';
import 'package:hotel/view/constants.dart';
class signup extends StatefulWidget {
  const signup({super.key});
  @override
  State<signup> createState() => _signupState();
}
class _signupState extends State<signup> {
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
                          'images/signup.jpeg'
                      ),
                    ),
                  ),
                ),
                //username
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: TextField(
                    // controller: controller.email,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 20.0),
                      hintText: 'Username'.tr,
                      prefixIcon:  Icon(
                        Icons.person,
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
                  padding: const EdgeInsets.only(bottom: 20),
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
                //confirm password
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: TextField(
                    // obscureText: controller.isHidden,
                    // controller: controller.password,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 20.0),
                      hintText: 'Confirm Password'.tr,
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
                //button
                Padding(
                  padding: const EdgeInsets.only(top: 0),
                  child: MaterialButton(
                    onPressed: () {

                    },
                    color: buttonColor,
                    textColor: Colors.white,
                    minWidth: double.infinity,
                    height: 60,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                  ),
                ),
                // Don't have account
                Padding(
                  padding: const EdgeInsets.only(top: 20),
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
                            Get.to(login_page());
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child:  Text(
                            'Login'.tr,
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
}
