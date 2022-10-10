import 'package:ecommerce/common/constant/color_res.dart';
import 'package:ecommerce/common/constant/image_res.dart';
import 'package:ecommerce/common/constant/string_res.dart';
import 'package:ecommerce/common/widget/common_text.dart';
import 'package:flutter/material.dart';


class NotificationsPage extends StatefulWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {


  List<String> notificationName = [
    (StringResources.notifitext),
    (StringResources.notifitext1),
    (StringResources.notifitext2),
    (StringResources.notifitext3),
    (StringResources.notifitext4)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResource.green,
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: SizedBox(
              height: 30,
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios_new,
                        color: ColorResource.white,
                      )),
                  const SizedBox(
                    width: 50,
                  ),
                  const CommonText(
                    text: StringResources.notifications,
                    color: ColorResource.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  )
                ],
              )),
        ),
        Expanded(
          child: Container(
            decoration: const BoxDecoration(
                color: ColorResource.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                )),
            child: ListView(children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: CommonText(
                  text: StringResources.timenotifi,
                  color: ColorResource.grey,
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                ),
              ),
              ListTile(
                leading: Container(
                  height: 50,
                  width: 50,
                  decoration: const BoxDecoration(
                      color: ColorResource.green,
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage(ImageResources.looklogo),
                          scale: 1.8)),
                ),
                title: const CommonText(
                    text: StringResources.notifitext,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: ColorResource.black),
                subtitle: const CommonText(
                    text: StringResources.messtime,
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                    color: ColorResource.grey),
                trailing: const Padding(
                  padding: EdgeInsets.only(bottom: 35),
                  child: Icon(
                    Icons.more_horiz,
                    color: ColorResource.grey,
                    size: 30,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: CommonText(
                  text: StringResources.timenotifi1,
                  color: ColorResource.grey,
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                ),
              ),
              SizedBox(
                height:MediaQuery.of(context).size.height * 0.70,
                child: ListView.builder(itemCount: notificationName.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Container(
                        height: 50,
                        width: 50,
                        decoration: const BoxDecoration(
                            color: ColorResource.green,
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: AssetImage(ImageResources.looklogo),
                                scale: 1.8)),
                      ),
                      title:  CommonText(
                          text: notificationName[index],
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: ColorResource.black),
                      subtitle: const CommonText(
                          text: StringResources.messtime,
                          fontSize: 11,
                          fontWeight: FontWeight.w400,
                          color: ColorResource.grey),
                      trailing: const Padding(
                        padding: EdgeInsets.only(bottom: 35),
                        child: Icon(
                          Icons.more_horiz,
                          color: ColorResource.grey,
                          size: 30,
                        ),
                      ),
                    );
                  },
                ),
              )
            ]),
          ),
        ),
      ]),
    );
  }
}
