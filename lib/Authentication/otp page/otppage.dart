import 'package:auto_size_text/auto_size_text.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:sreeselvavinayagartemple/Authentication/Login%20page/login.dart';
import 'package:sreeselvavinayagartemple/Authentication/otp%20page/forgotpasswordemail.dart';
import 'package:sreeselvavinayagartemple/aa_controller/session_Controller.dart';
import 'package:sreeselvavinayagartemple/aa_utils/api_config.dart';
import 'package:sreeselvavinayagartemple/themes/font_height.dart';
import 'package:sreeselvavinayagartemple/widgets/customtextform.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({
    super.key,
    required this.userId,
  });
  final int userId;
  @override
  State<OtpPage> createState() => _OtpPageState();
}

@override
void dispose() {
  // for (var controller in _controllers) {
  //   controller.dispose();
  // }
  // for (var focusNode in _focusNodes) {
  //   focusNode.dispose();
  // }
  // super.dispose();
}

class _OtpPageState extends State<OtpPage> {
  SessionController? controller;

  @override
  void initState() {
    controller = Get.put(SessionController());

    super.initState();
  }

  TextEditingController newpassword = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();
  TextEditingController otp = TextEditingController();

  otpconfirm() async {
    try {
      await dio.post(
        otpUrl,
        data: {
          "password": newpassword.text,
          "confirm_password": confirmpassword.text,
          "otp": otp.text,
          "user_id": widget.userId.toString()
        },
      ).then((response) {
        if (response.statusCode == 200) {
          Get.back();
          MotionToast.success(
                  borderRadius: 0,
                  title: const Text("Successfully  changed"),
                  description: const Text(""))
              .show(context);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const LoginPage(),
            ),
          );
          // Get.to(() => const OtpPage());
        } else {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(response.data['message'].toString())));
          throw Exception('Failed to load data');
        }
      });
    } on DioException catch (e) {
      if (e.response != null) {
        if (e.response!.statusCode == 404) {
          MotionToast.error(
                  borderRadius: 0,
                  title: const Text("Invalid otp or mismatch password"),
                  description: const Text("Enter Valid values "))
              .show(context);
        }
        Get.back();
      } else {}
    }
  }

  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/temple.png',
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
            alignment: Alignment.center,
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  hGap40,
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.18,
                    width: MediaQuery.of(context).size.width * 0.27,
                    // decoration: BoxDecoration(
                    //   shape: BoxShape.circle,
                    //   // color: Colors.white,
                    // ),
                    child: Image.asset('assets/ammannew.png'),
                  ),
                  hGap10,
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.72,
                      height: MediaQuery.of(context).size.height * 0.27,
                      decoration: ShapeDecoration(
                        color: const Color.fromARGB(113, 0, 0, 0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Form(
                        key: formkey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // CustomTextFormFeild(
                            //   controller: newpassword,
                            //   labelText: 'password',
                            //   prefixIcon: Icons.lock,
                            //   validator: (value) {
                            //     if (value == null || value.isEmpty) {
                            //       return 'Please enter valid password';
                            //     }
                            //     return null;
                            //   },
                            // ),
                            // CustomTextFormFeild(
                            //   controller: confirmpassword,
                            //   labelText: 'Confirm password',
                            //   prefixIcon: Icons.lock,
                            //   validator: (value) {
                            //     if (value == null || value.isEmpty) {
                            //       return 'Please enter valid Confirm password';
                            //     }
                            //     return null;
                            //   },
                            // ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 15.0, right: 15),
                              child: CustomTextFormFeild(
                                controller: otp,
                                labelText: 'Otp',
                                prefixIcon: Icons.lock,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter valid ';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            // hGap5,
                            Padding(
                              padding: const EdgeInsets.only(left: 60),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const AutoSizeText(
                                    'Didnt receive code?',
                                    style: h3,
                                  ),
                                  TextButton(
                                      onPressed: () {
                                        Get.to(() => const ForgetPassword());
                                      },
                                      child: const AutoSizeText(
                                        'Re-send',
                                        style: TextStyle(
                                          color: Color.fromARGB(255, 255, 0, 0),
                                          fontSize: 16,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w400,
                                          height: 0,
                                        ),
                                      ))
                                ],
                              ),
                            ),
                            CustomElevatedButton(
                              onPressed: () async {
                                if (formkey.currentState!.validate()) {
                                  print("checking for seding otp");
                                  await otpconfirm().then((value) {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return const Center(
                                            child: CircularProgressIndicator(),
                                          );
                                        });
                                  });
                                }
                              },
                              child: const AutoSizeText(
                                'Confirm',
                                style: h2,
                              ),
                            ),
                            // hGap10,
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
