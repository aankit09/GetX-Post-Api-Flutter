import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:loginapi/screens/home_screen.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  RxBool loading = false.obs;

  void loginApi() async {
    loading.value = true;
    try {
      //incase data are getting raw from
      // Map bodydata = {
      //   "email": emailController.value.text,
      //   "password": passwordController.value.text
      // };

      final response = await post(
        Uri.parse("https://reqres.in/api/login"),

        // incase data are getting raw from
        // body: jsonEncode(bodydata),
        // headers: {"authentication": "abfeeoifjoe"}

        body: {
          "email": emailController.value.text,
          "password": passwordController.value.text
        },
      );

      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        loading.value = false;
        Get.snackbar("Login Sucessful", data.toString());
        Get.to(const HomeScreen());
      } else {
        loading.value = false;
        Get.snackbar("Login Faild", "Something went wrong");
      }
    } catch (e) {
      loading.value = false;
      Get.snackbar("Exception", e.toString());
    }
  }
}
