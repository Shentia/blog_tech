import 'package:blog_tech/component/api_constant.dart';
import 'package:blog_tech/services/dio_service.dart';
import 'package:blog_tech/view/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class RegisterController extends GetxController {
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController activetedCodeTextEditingController =
      TextEditingController();

  var email = '';
  var userId = 0;

  register() async {
    Map<String, dynamic> data = {
      'email': emailTextEditingController.text,
      'command': 'register',
    };
    var response =
        await DioService().postMethod(ApiConstant.postRegister, data);
    email = emailTextEditingController.text;
    userId = response.data['userId'];

    debugPrint(response);
  }

  verify() async {
    Map<String, dynamic> data = {
      'email': emailTextEditingController.text,
      'userId': userId,
      'code': activetedCodeTextEditingController.text,
      'command': 'verify',
    };
    debugPrint(data.toString());
    var response =
        await DioService().postMethod(ApiConstant.postRegister, data);
    debugPrint(response.data);

    if (response.data['response'] == 'verified') {
      var box = GetStorage();
      box.write('token', response.data['token']);
      box.write('userId', response.data['userId']);

      debugPrint('"read:::: " + box.read("token")');
      debugPrint('"read:::: " + box.read("userId")');
      Get.to(HomeScreen());
    } else {
      Get.snackbar('Error', 'Please enter valid code');
    }
  }
}
