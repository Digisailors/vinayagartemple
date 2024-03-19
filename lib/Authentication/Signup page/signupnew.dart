import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sreeselvavinayagartemple/aa_utils/api_config.dart';

import '../../themes/font_height.dart';
import '../Login page/login.dart';
import 'package:sreeselvavinayagartemple/widgets/customtextform.dart';
class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

    final TextEditingController name = TextEditingController();
  final TextEditingController username = TextEditingController();
 
  final TextEditingController mobileNumber = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController Password = TextEditingController();


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
       backgroundColor: Color(0xFFE4F5FF),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight + 10),
        child: AppBar(
          backgroundColor: Color(0xFF006CA7),
          title: Text('Sign Up'),
      
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(22),
              bottomRight: Radius.circular(22),
            ),
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(22),
                  bottomRight: Radius.circular(22)),
            ),
          ),
        ),
      ),
      body:    Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
                    child: Form(
                      key: formkey,
                      child: Column(
                        children: [
                          hGap15,
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
                          const Text(
                            'Sign Up',
                            style: hb2,
                          ),
                          CustomTextFormFeilds(
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
                          CustomTextFormFeilds(
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
                        
                          CustomTextFormFeilds(
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
                          CustomTextFormFeilds(
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
                         hGap20,
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
                            child: const Text(
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
                                const Text(
                                  'Already have An Account ?',
                                  style: hb3,
                                ),
                                TextButton(
                                    onPressed: () {
                                      Get.to(() => const LoginPage());
                                    },
                                    child: const Text(
                                      'Login',
                                      style: TextStyle(
                                        color: Color(0xFF0084FF),
                                        fontSize: 20,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w400,
                                        height: 0,
                                      ),
                                    ))
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
class CustomElevatedButton extends StatefulWidget {
  final VoidCallback? onPressed;
  final Widget? child;

  const CustomElevatedButton({Key? key, this.onPressed, this.child})
      : super(key: key);

  @override
  State<CustomElevatedButton> createState() => _CustomElevatedButtonState();
}

class _CustomElevatedButtonState extends State<CustomElevatedButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
            const Color(0xFFFF0000)), // Red color
        elevation: MaterialStateProperty.all<double>(4),
        shape: MaterialStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(41),
          ),
        ),
      ),
      child: widget.child,
    );
  }
}