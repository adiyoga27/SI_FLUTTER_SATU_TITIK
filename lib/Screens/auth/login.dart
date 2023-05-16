import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:satutitik/Screens/auth/registration.dart';
import 'package:satutitik/controllers/AuthController.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final controller = Get.put(AuthController());
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xfff8f9fd),
      backgroundColor: Colors.orange[200],
      body: Stack(
        children: [
          Positioned(
              top: Get.width / 2,
              right: Get.width / 3,
              left: Get.width / 3,
              child: Container(
                decoration:BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  width: 100.0,
                  height: 100.0,
                  child: Image.asset('assets/images/res_logo.png'))),
          Positioned(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    height: Get.height / 2.8,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        children: [
                          const Spacer(),
                          Form(
                            child: Column(
                              children: [
                                TextFormField(
                                  controller: controller.usernameController,
                                  keyboardType: TextInputType.text,
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(19),
                                  ],
                                  decoration: InputDecoration(hintText: "Username"),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 16),
                                  child: TextFormField(
                                  keyboardType: TextInputType.visiblePassword,
          
                                  controller: controller.passwordController,
          
                                     
                                    decoration:
                                        const InputDecoration(hintText: "Password"),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 16, bottom: 5.0),
                            child: ElevatedButton(
                              style:  ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all<Color>(Colors.orange),
                                ),
                              child: const Text("Login"),
                              onPressed: () => controller.verify(),
                            ),
                          ),
                          InkWell(
                            onTap: () => Get.to(RegistrationPage()),
                            child: Text('Tidak Memiliki Akun ? Klik disini', style: TextStyle(color: Colors.blue),)),
                          const Spacer(),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
