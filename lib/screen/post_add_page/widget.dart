import 'package:ecommerce/common/constant/color_res.dart';
import 'package:ecommerce/common/constant/string_res.dart';
import 'package:ecommerce/common/widget/common_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class PostAddPageWidget {
  showModelButtomsSheetVideo(BuildContext context) {
    return showModalBottomSheet(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        topLeft: Radius.circular(25.0),
        topRight: Radius.circular(25.0),
      )),
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: SizedBox(
                height: 129,
                child: Column(
                  children: [
                    InkWell(
                      onTap: () async {
                        try {
                          final image = await ImagePicker()
                              .pickVideo(source: ImageSource.camera);
                        } on PlatformException catch (e) {
                          if (kDebugMode) {
                            print('Failed to pick image: $e');
                          }
                        }
                      },
                      child: const CommonText(
                        text: StringResources.RecordVideo,
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: ColorResource.black,
                      ),
                    ),
                    const Divider(),
                    const CommonText(
                      text: StringResources.Choosefromlibrary,
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: ColorResource.black,
                    ),
                    const Divider(),
                    const CommonText(
                      text: StringResources.Cancel,
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: ColorResource.red,
                    ),
                    const Divider(),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  showModelButtomsSheetPhoto(BuildContext context) {
    return showModalBottomSheet(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        topLeft: Radius.circular(25.0),
        topRight: Radius.circular(25.0),
      )),
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return SizedBox(
              height: 149,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () async {
                        try {
                          final image = await ImagePicker()
                              .pickImage(source: ImageSource.gallery);
                        } on PlatformException catch (e) {
                          print('Failed to pick image: $e');
                        }
                      },
                      child: const CommonText(
                        text: StringResources.TakePhoto,
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: ColorResource.black,
                      ),
                    ),
                    const Divider(),
                    const CommonText(
                      text: StringResources.Choosefromlibrary,
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: ColorResource.black,
                    ),
                    const Divider(),
                    const CommonText(
                      text: StringResources.Cancel,
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: ColorResource.red,
                    ),
                    const Divider(),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Future<void> requestCameraPermission() async {
    final serviceStatus = await Permission.camera.isGranted;

    bool isCameraOn = serviceStatus == ServiceStatus.enabled;

    final status = await Permission.camera.request();

    if (status == PermissionStatus.granted) {
      print('Permission Granted');
    } else if (status == PermissionStatus.denied) {
      print('Permission denied');
    } else if (status == PermissionStatus.permanentlyDenied) {
      print('Permission Permanently Denied');
      await openAppSettings();
    }
  }
}
