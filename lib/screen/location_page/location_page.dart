import 'dart:async';
import 'package:ecommerce/common/constant/color_res.dart';
import 'package:ecommerce/common/constant/image_res.dart';
import 'package:ecommerce/common/constant/string_res.dart';
import 'package:ecommerce/common/widget/common_listtile.dart';
import 'package:ecommerce/common/widget/common_navigator.dart';
import 'package:ecommerce/common/widget/common_text.dart';
import 'package:ecommerce/common/widget/elevated_button.dart';
import 'package:ecommerce/screen/location_page/category_page/category_page.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({Key? key}) : super(key: key);

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  int age = 10;
  final Completer<GoogleMapController> _controller = Completer();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

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
                    text: StringResources.selectcategory,
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
              child: ListView(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: CommonText(
                      text: StringResources.category,
                      color: ColorResource.grey,
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8)),
                        border: Border.all(color: Colors.grey, width: 0.4)),
                    child: CommonListTile(
                      onTap: () {
                        Navigator.push(
                            context, CommonNavigator(child: const CategoryPage()));
                      },
                      text: ImageResources.category,
                      titletext: StringResources.selectcategory,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      imgtext: ImageResources.backarow,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: CommonText(
                      text: StringResources.location,
                      color: ColorResource.grey,
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8)),
                        border: Border.all(color: Colors.grey, width: 0.4)),
                    child: const CommonListTile(
                      text: ImageResources.Locationicon1,
                      titletext: StringResources.californiaUSA,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      imgtext: ImageResources.editicon,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: CommonText(
                      text: StringResources.selectdistance,
                      color: ColorResource.grey,
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                  ),
                  Slider(
                    divisions: 5,
                    activeColor: ColorResource.green,
                    inactiveColor: ColorResource.grey.withOpacity(0.4),
                    label: age.toString(),
                    value: age.toDouble(),
                    onChanged: (value) {
                      setState(() {
                        age = value.toInt();
                      });
                    },
                    min: 0,
                    max: 250,
                  ),
                  Container(
                    height: 200,
                    width: 50,
                    margin: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    child: GoogleMap(
                      compassEnabled: true,
                      myLocationEnabled: true,
                      zoomGesturesEnabled: true,
                      scrollGesturesEnabled: true,
                      myLocationButtonEnabled: true,
                      rotateGesturesEnabled: true,
                      mapType: MapType.normal,
                      initialCameraPosition: _kGooglePlex,
                      onMapCreated: (GoogleMapController controller) {
                        _controller.complete(controller);
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CommonElevatedButton(
                    onPressed: () {
                      _goToTheLake;
                      setState(() {});
                    },
                    buttonColor: ColorResource.green,
                    textSize: 16,
                    text: StringResources.apply,
                    textColor: ColorResource.white,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              )),
        ),
      ]),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}
