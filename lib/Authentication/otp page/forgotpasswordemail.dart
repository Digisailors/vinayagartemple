import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sreeselvavinayagartemple/Authentication/otp%20page/otppage.dart';
import 'package:sreeselvavinayagartemple/aa_utils/api_config.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:dio/dio.dart';
import 'package:sreeselvavinayagartemple/themes/font_height.dart';
import 'package:sreeselvavinayagartemple/widgets/customtextform.dart';

final dio = Dio();

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final TextEditingController email = TextEditingController();

  forgetPassword() async {
    try {
      await dio.post(
        forgetPasswordUrl,
        data: {"email": email.text},
      ).then((response) {
        if (response.statusCode == 200) {
          final userId = response.data['data']['user_id'];
          Get.back();
          MotionToast.success(
                  borderRadius: 0,
                  title: const Text("Email Send"),
                  description: const Text("Reset password "))
              .show(context);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => OtpPage(userId: userId),
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
                  title: const Text("Invalid Email"),
                  description: const Text("Enter Valid E-MailId "))
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
       backgroundColor: Color(0xFFE4F5FF),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight + 10),
        child: AppBar(
          backgroundColor: Color(0xFF006CA7),
          title: Text('Forget Password'),
      
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
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          
            SizedBox(
              //  color: Colors.amber,
              height: MediaQuery.of(context).size.height * 0.20,
              width: MediaQuery.of(context).size.width * 0.40,
              child: Image.asset("assets/gana.png"),
            ),
                
            hGap10,
            Center(
              child: Container(
                decoration: BoxDecoration(
                 
                  borderRadius: BorderRadius.circular(15),
                  color: const Color.fromARGB(113, 0, 0, 0),
                ),
                height: MediaQuery.of(context).size.height * 0.37,
                width: MediaQuery.of(context).size.width * 0.8,
                child: Form(
                  key: formkey,
                  child: Column(
               
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                    
                      hGap10,
                      const AutoSizeText(
                        "Sign up",
                      ),
                      hGap15,
                      const AutoSizeText(
                        "Enter your email and we'll send you Otp.",
                        textAlign: TextAlign.center,
                      ),
                      hGap15,
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: SizedBox(
                            width: 400,
                            child: CustomTextFormFeild(
                              controller: email,
                              labelText: 'Email',
                              prefixIcon: Icons.email,
                            )),
                      ),
                      hGap10,
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: SizedBox(
                            height: 45,
                            width: 100,
                            child: ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor:
                                        const MaterialStatePropertyAll(
                                            Color.fromARGB(255, 255, 0, 0)),
                                    shape: MaterialStatePropertyAll(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(7)),
                                    )),
                                onPressed: () {
                                  // showDialog(
                                  //     context: context,
                                  //     builder: (context) {
                                  //       return const Center(
                                  //         child: CircularProgressIndicator(),
                                  //       );
                                  //     });
                                  print("checking for otp");
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const OtpPage(userId: 22),
                                    ),
                                  );
                
                                  //forgetPassword();
                                },
                                child: const Text(
                                  'Submit',
                                  style: TextStyle(color: Colors.white),
                                ))),
                      ),
                      hGap10,
                      // TextButton.icon(
                      //     onPressed: () {
                      //       Navigator.push(
                      //           context,
                      //           MaterialPageRoute(
                      //             builder: (context) => const LoginPage(),
                      //           ));
                      //     },
                      //     icon: const Icon(
                      //       Icons.arrow_back_ios_new_rounded,
                      //       color: Colors.black,
                      //       size: 15,
                      //     ),
                      //     label: const AutoSizeText(
                      //       'Back to Login',
                      //       style: TextStyle(color: Colors.black),
                      //     ))
                    ],
                  ),
                ),
              ),
            ),
            hGap10,
          ],
        ),
      ),
    );
  }
}
