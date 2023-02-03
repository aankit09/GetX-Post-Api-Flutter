import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/logincontroller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0, right: 20, left: 20),
            child: TextFormField(
              controller: loginController.emailController.value,
              decoration: const InputDecoration(
                labelText: 'Enter your Email',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 20, right: 20),
            child: TextFormField(
              controller: loginController.passwordController.value,
              decoration: const InputDecoration(
                labelText: 'Enter your Password',
              ),
              obscureText: true,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Obx(
            () {
              return InkWell(
                onTap: () {
                  loginController.loginApi();
                },
                child: loginController.loading.value
                    ? const CircularProgressIndicator()
                    : SizedBox(
                        height: 50,
                        child: Center(
                          child: Text(
                            'Submit',
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        ),
                      ),
              );
            },
          ),
        ],
      ),
    );
  }
}
