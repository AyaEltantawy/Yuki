import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:yuki/core/app_storage/app_storage.dart';
import 'package:yuki/core/dio_helper/dio_helper.dart';
import 'package:yuki/core/models/user_model.dart';
import 'package:yuki/core/routing/page_router.dart';
import 'package:yuki/core/utils/utils.dart';

import 'account_settings_state.dart';

class AccountSettingsCubit extends Cubit<AccountSettingsState> {
  AccountSettingsCubit() : super(AccountSettingsStateInit());

  selectDropDownItem() {
    emit(SelectDropDownItem());
  }

  // File image;
  String phoneCode = '';
  TextEditingController namelController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  String gender = '';
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isConnected = false;

  switchConnected() {
    isConnected = !isConnected;
    emit(SwitchConnected());
  }

  update() async {
    {
      if (!formKey.currentState!.validate()) return;
      emit(LoadingUpdate());

      final body = {
        '_method': 'PUT',
        'name': namelController.text.toString,
        'avatar': profileImage != null
            ? await MultipartFile.fromFile(
                profileImage!.path,
                filename: profileImage!.path.split('/').last,
              )
            : null, // Send null if no image is selected,
        'phonecode': phoneCode,
        'gender': gender,
        'password': passwordController.text.toString()
      };
      print('body ${body}');
      DioHelper.post("auth/profile", false, body: body).then((response) {
        final data = response.data as Map<String, dynamic>;
        print("dataaa $data");
        print(' jdshjhfdsjbdsj${data['message']}');

        if (data['status'] == true) {
          AppStorage.cacheUserInfo(UserModel.fromJson(data));
          Utils.showSnackBar(MagicRouter.currentContext, data['message']);
          emit(LoadingSuccess());
        } else {
          Utils.showSnackBar(
            MagicRouter.currentContext,
            data['message'],
          );
          emit(LoadingError());
        }
      });
    }
  }

  File? profileImage;

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      profileImage = File(pickedFile.path);
      emit(ProfileImagePicked());
    } else {
      print("No image selected.");
    }
  }
// void pickImage ()async{
//   final picker = ImagePicker();
//   var image= await picker.pickImage(source: ImageSource.gallery);
//
//
// }
changePassword() async{
  if (!formKey.currentState!.validate()) return;
  emit(LoadingChangePassword());

  final body = {

    'password': passwordController.text.toString(),
    '_method':"PUT"
  };
  print('body ${body}');
  DioHelper.post("auth/update-password", false, body: body).then((response) {
    final data = response.data as Map<String, dynamic>;
    print("dataaa $data");
    print(' jdshjhfdsjbdsj${data['message']}');

    if (data['status'] == true) {
      emit(LoadingChangeSuccess());
      Utils.showSnackBar(MagicRouter.currentContext, data['message']);
      AppStorage.cacheUserInfo(UserModel.fromJson(data));


    } else {
      Utils.showSnackBar(
        MagicRouter.currentContext,
        data['message'],
      );
      emit(LoadingChangeError());
    }
  });
}



}

