import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sreeselvavinayagartemple/Authentication/Signup%20page/signup.dart';
import 'package:sreeselvavinayagartemple/Authentication/otp%20page/forgotpasswordemail.dart';
import 'package:sreeselvavinayagartemple/aa_controller/session_Controller.dart';

import 'package:sreeselvavinayagartemple/themes/font_height.dart';
import 'package:sreeselvavinayagartemple/widgets/customtextform.dart';

import '../../homeScreen/homepage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  SessionController? controller;

  @override
  void initState() {
    controller = Get.put(SessionController());

    super.initState();
  }

  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Stack(
            children: [
              Image.asset(
                'assets/sv2.jpg',
                fit: BoxFit.cover,
                height: double.infinity,
                width: double.infinity,
                alignment: Alignment.center,
              ),   Padding(
            padding: const EdgeInsets.only(top: 25, left: 10),
            child: CircleAvatar(
              backgroundColor: Color.fromARGB(255, 223, 205, 205),
              child: IconButton(
                  onPressed: () {
                    Get.to(() => Homepage());
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.red,
                  )),
            ),
          ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 90,
                      width: 90,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        // color: Colors.white,
                      ),
                      child: ClipOval(
                        child: Image.asset('assets/gana.png'),
                      ),
                    ),
                    hGap20,
                    Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: MediaQuery.of(context).size.height * 0.5,
                      decoration: ShapeDecoration(
                        color: const Color(0xFF717171).withOpacity(0.5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Column(
                        children: [
                          hGap15,
                          const AutoSizeText(
                            'Login',
                            style: h1,
                          ),
                          CustomTextFormFeild(
                            controller: username,
                            labelText: 'Enter your username',
                            prefixIcon: Icons.person,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter username';
                              }
                              return null;
                            },
                          ),
                          hGap20,
                          CustomTextFormFeild(
                            controller: password,
                            labelText: 'password',
                            prefixIcon: Icons.lock,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter valid password';
                              }
                              return null;
                            },
                          ),
                          Align(
                              alignment: Alignment.bottomRight,
                              child: TextButton(
                                  onPressed: () {
                                    Get.to(() => const ForgetPassword());
                                  },
                                  child: const Text(
                                    'Forgot Password',
                                    style: h3,
                                  ))),
                          CustomElevatedButton(
                            onPressed: () async {
                              print('fnvvmv');
                              if (formkey.currentState!.validate()) {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    });
                                print('check for login user name${username}');
                                await controller!
                                    .login(
                                        username.text, context, password.text)
                                    .whenComplete(() {});
                              }
                            },
                            child: AutoSizeText(
                              'Login',
                              style: h2,
                            ),
                          ),
                          hGap30,
                          Padding(
                            padding: const EdgeInsets.only(left: 60),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const AutoSizeText(
                                  'Don’t Have An Account ?',
                                  style: h3,
                                ),
                                TextButton(
                                    onPressed: () {
                                      Get.to(() => const SignupPage());
                                    },
                                    child: const AutoSizeText(
                                      'Sign up',
                                      style: TextStyle(
                                        color: Color(0xFF0084FF),
                                        fontSize: 16,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w400,
                                        height: 0,
                                      ),
                                    ))
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
