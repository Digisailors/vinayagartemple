import 'package:auto_size_text/auto_size_text.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sreeselvavinayagartemple/Authentication/Login%20page/login.dart';
import 'package:sreeselvavinayagartemple/aa_utils/api_config.dart';
import 'package:sreeselvavinayagartemple/homeScreen/homepage.dart';
import 'package:sreeselvavinayagartemple/themes/font_height.dart';
import 'package:sreeselvavinayagartemple/widgets/customtextform.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => SignupPageState();
}

class SignupPageState extends State<SignupPage> {
  final TextEditingController name = TextEditingController();
  final TextEditingController username = TextEditingController();
  // final TextEditingController icnumber = TextEditingController();
  final TextEditingController mobileNumber = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController Password = TextEditingController();
  //final TextEditingController confirmpassword = TextEditingController();
  // final TextEditingController address1 = TextEditingController();
  @override
  final formkey = GlobalKey<FormState>();
  final Dio dio = Dio();

  Future<void> signUp() async {
    try {
      final response = await dio.post(userregister, data: {
        'name': name.text,
        // 'ic_number': icnumber.text,
        'email': email.text,
        'password': Password.text,
        'username': username.text,
      });

      print('API Response: ${response.data}');

      if (response.statusCode == 200) {
        print(response);
        showSuccessSnackBar('Sign-up successful!');
        Get.to(() => const LoginPage());
      }
    } catch (err) {
      print('Error: $err');
      showSnackBar('Error: $err');
    }
  }

  void showSuccessSnackBar(String message) {
    final snackBar = SnackBar(
      content: Text(message),
      duration: const Duration(seconds: 3),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void showSnackBar(String message) {
    final snackBar = SnackBar(
      content: Text(message),
      duration: const Duration(seconds: 3),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Image.asset(
            'assets/gana.png',
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
            alignment: Alignment.center,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25, left: 10),
            child: CircleAvatar(
              backgroundColor: const Color.fromARGB(255, 223, 205, 205),
              child: IconButton(
                  onPressed: () {
                    Get.to(() => Homepage());
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.red,
                  )),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                hGap40,
                Container(
                  height: 80,
                  width: 80,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    //color: Colors.white,
                  ),
                  child: ClipOval(
                    child: Image.asset('assets/gana.png'),
                  ),
                ),
                hGap10,
                SingleChildScrollView(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    decoration: ShapeDecoration(
                      color: const Color(0xFF717171).withOpacity(0.5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Form(
                      key: formkey,
                      child: Column(
                        children: [
                          hGap15,
                          const AutoSizeText(
                            'Sign Up',
                            style: h2,
                          ),
                          CustomTextFormFeild(
                            controller: name,
                            labelText: 'Name ',
                            prefixIcon: Icons.person,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Name is required';
                              }
                              return null;
                            },
                          ),
                          CustomTextFormFeild(
                            controller: username,
                            labelText: 'User Name ',
                            prefixIcon: Icons.person,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'User Name is required';
                              }
                              return null;
                            },
                          ),
                          // CustomTextFormFeild(
                          //   controller: icnumber,
                          //   labelText: 'Ic Number',
                          //   prefixIcon: Icons.phone,
                          //     validator: (value) {
                          //       if (value!.isEmpty) {
                          //         return 'IC Number is required';
                          //       }
                          //       return null;
                          //     },
                          // ),
                          // CustomTextFormFeild(
                          //   controller: address1,
                          //   labelText: 'Address',
                          //   prefixIcon: Icons.location_on,
                          // ),
                          CustomTextFormFeild(
                            controller: email,
                            labelText: 'Enter your email',
                            prefixIcon: Icons.mail,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Email is required';
                              }
                              return null;
                            },
                          ),
                          CustomTextFormFeild(
                            controller: Password,
                            labelText: 'Password',
                            prefixIcon: Icons.lock,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Password is required';
                              }
                              return null;
                            },
                          ),
                          // CustomTextFormFeild(
                          //   controller: TextEditingController(),
                          //   labelText: 'Confirm Password',
                          //   prefixIcon: Icons.lock,
                          // ),
                          CustomElevatedButton(
                            onPressed: () async {
                              if (formkey.currentState!.validate()) {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return const Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  },
                                );
                                await signUp();
                              }
                            },
                            child: const AutoSizeText(
                              'Sign up',
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
                                  'Already have An Account ?',
                                  style: h3,
                                ),
                                TextButton(
                                    onPressed: () {
                                      Get.to(() => const LoginPage());
                                    },
                                    child: const AutoSizeText(
                                      'Login',
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
