import 'package:ecommerce/common/constant/color_res.dart';
import 'package:ecommerce/common/constant/string_res.dart';
import 'package:ecommerce/common/widget/common_text.dart';
import 'package:ecommerce/screen/post_add_page/post_add_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

class PostAddPageViewModel {
  final PostAddPageState postAddPageState;

  PostAddPageViewModel(this.postAddPageState);

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
                height: 220,
                child: Column(
                  children: [
                    ListTile(
                        onTap: () {
                          videoMethod(ImageSource.camera);
                          Navigator.pop(context);
                        },
                        title: const CommonText(
                          text: StringResources.RecordVideo,
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: ColorResource.black,
                          textAlign: TextAlign.center,
                        )),
                    const Divider(),
                    ListTile(
                        onTap: () {
                          videoMethod(ImageSource.gallery);
                          Navigator.pop(context);
                        },
                        title: const CommonText(
                          text: StringResources.Choosefromlibrary,
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: ColorResource.black,
                          textAlign: TextAlign.center,
                        )),
                    const Divider(),
                    ListTile(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        title: const CommonText(
                          text: StringResources.Cancel,
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: ColorResource.red,
                          textAlign: TextAlign.center,
                        )),
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
              height: 220,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  children: [
                    ListTile(
                        onTap: () {
                          imgMethod(ImageSource.camera);
                          Navigator.pop(context);
                        },
                        title: const CommonText(
                          text: StringResources.TakePhoto,
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: ColorResource.black,
                          textAlign: TextAlign.center,
                        )),
                    const Divider(),
                    ListTile(
                        onTap: () {
                          imgMethod(ImageSource.gallery);
                          Navigator.pop(context);
                        },
                        title: const CommonText(
                          text: StringResources.Choosefromlibrary,
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: ColorResource.black,
                          textAlign: TextAlign.center,
                        )),
                    const Divider(),
                    ListTile(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        title: const CommonText(
                          text: StringResources.Cancel,
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: ColorResource.red,
                          textAlign: TextAlign.center,
                        )),
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
    //final serviceStatus = await Permission.camera.isGranted;

    // bool isCameraOn = serviceStatus == ServiceStatus.enabled;

    final status = await Permission.camera.request();

    if (status == PermissionStatus.granted) {
      if (kDebugMode) {
        print('Permission Granted');
      }
    } else if (status == PermissionStatus.denied) {
      if (kDebugMode) {
        print('Permission denied');
      }
    } else if (status == PermissionStatus.permanentlyDenied) {
      if (kDebugMode) {
        print('Permission Permanently Denied');
      }
      await openAppSettings();
    }
  }

  imgMethod(ImageSource imageSource) async {
    try {
      XFile? image = await ImagePicker().pickImage(source: imageSource);
      if (image == null) return;
      postAddPageState.imgpath.add(image);
      postAddPageState.setState(() {});
    } on PlatformException catch (e) {
      if (kDebugMode) {
        print('Failed to pick image: $e');
      }
    }
  }

  multiImgMethod(ImageSource imageSource) async {
    try {
      List<XFile> image = await ImagePicker().pickMultiImage();
      if (image == null) return;
      postAddPageState.imgpath.addAll(image);
      postAddPageState.setState(() {});
    } on PlatformException catch (e) {
      if (kDebugMode) {
        print('Failed to pick image: $e');
      }
    }
  }

  videoMethod(ImageSource imageSource) async {
    try {
      XFile? video = await ImagePicker().pickVideo(
          source: imageSource, maxDuration: const Duration(seconds: 10));
      if (video == null) return;
      postAddPageState.videopath.add(video.path);
      postAddPageState.setState(() {});
    } on PlatformException catch (e) {
      if (kDebugMode) {
        print('Failed to pick image: $e');
      }
    }
  }

  Future<String?> videoThumbnail(int index) async {
    final fileName = await VideoThumbnail.thumbnailFile(
      imageFormat: ImageFormat.JPEG,
      video: postAddPageState.videopath[index],
      quality: 5,
    );
    return fileName;
  }
}
