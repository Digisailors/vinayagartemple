import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';


import 'package:shared_preferences/shared_preferences.dart';
import 'package:sreeselvavinayagartemple/aa_controller/videoController.dart';
import 'package:sreeselvavinayagartemple/aa_model/usermodel.dart';
import 'package:sreeselvavinayagartemple/aa_model/videolistmodel.dart';
import 'package:sreeselvavinayagartemple/aa_utils/api_config.dart';
import 'package:sreeselvavinayagartemple/homeScreen/homepage.dart';

import '../aa_model/paymentmodel.dart';

class SessionController extends GetxController {
    VideoController? vcontroller;
  List<Uint8List> memoryImage = <Uint8List>[].obs;
  List<String> images = <String>[].obs;
  List<File> files = <File>[].obs;
  UserModel? user;
  Paymentscreenmodel? paymentmode;
 Videolistmodel? videolistmodel; 

  int? loginId;

  final dio = Dio();  
    bool isloading = true;

  Future<void> login(
    String username,
    BuildContext context,
    String password,
  ) async {
    var requestBody = {"username": username, "password": password};
    isloading = true;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      await dio
          .post(
        loginUrl,
        data: requestBody,
      )
          .then((response)async {
        if (response.statusCode == 200) {
          loginId = response.data['data']['user_details']['login_id'];
          print(loginId);
          print(response.data);
        prefs.setInt('loginId', loginId!);
           
          prefs.setString('currentUser', jsonEncode(response.data));
          print(
              "${response.data['data']["user_details"]['username']} , user name");
          prefs.setString(
              'UserName', response.data['data']["user_details"]['username']);
          prefs.setString(
              'UserName', response.data['data']["user_details"]['username']);

          user =
              UserModel.fromJson(jsonDecode(prefs.getString('currentUser')!));

          isloading = false;
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(response.data['message'].toString())));
          Get.off(() => Homepage());
          update();
        } else {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(response.data['message'].toString())));
          throw Exception('Failed to load data');
        }
      });
    } on DioException catch (e) {
      if (e.response != null) {
        Navigator.pop(context);

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(e.response?.data["message"] ?? ''),
            backgroundColor: Colors.amber));
      } else {
        Get.snackbar(e.message.toString(), e.response.toString(),
            colorText: Colors.red, snackPosition: SnackPosition.TOP);
      }
    }
  }

  Future<void> setUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    if (prefs.getString('currentUser') == null) {
      user = null;
      isloading = false;
    } else {
      user = UserModel.fromJson(jsonDecode(prefs.getString('currentUser')!));
      isloading = false;
    }
    update();
  }

  Future<void> addprofileFromCamera() async {
    files = [];
    memoryImage = [];

    PickedFile? result =
        // ignore: invalid_use_of_visible_for_testing_member
        (await ImagePicker.platform.pickImage(source: ImageSource.camera));
    if (result != null) {
      files.add(File(result.path));
      images = await convertFilesToBase64();

      await File(result.path)
          .readAsBytes()
          .then((value) => memoryImage.add(value));
    }
  }

  Future<void> addFiles() async {
    List<PickedFile> result =
        (await ImagePicker.platform.pickMultiImage()) ?? [];
    files.addAll(result.map((e) => File(e.path)));
    images = await convertFilesToBase64();

    for (var file in result) {
      await File(file.path)
          .readAsBytes()
          .then((value) => memoryImage.add(value));
    }
    }

  Future<List<String>> convertFilesToBase64() {
    List<Future<String>> futures = [];
    for (var file in files) {
      futures.add(convertFiletoBase64(file));
    }

    return Future.wait(futures);
  }

  Future<String> convertFiletoBase64(File file) {
    return file.readAsBytes().then((Uint8List uint8list) {
      return base64Encode(uint8list);
    });
  }
}
