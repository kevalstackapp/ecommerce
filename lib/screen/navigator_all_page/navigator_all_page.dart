import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:ecommerce/common/constant/color_res.dart';
import 'package:ecommerce/common/widget/common_navigator.dart';
import 'package:ecommerce/screen/home_page/home_page.dart';
import 'package:ecommerce/screen/home_page/widget.dart';
import 'package:ecommerce/screen/like_page/like_page.dart';
import 'package:ecommerce/screen/message_page/message_page.dart';
import 'package:ecommerce/screen/post_add_page/post_add_page.dart';
import 'package:ecommerce/screen/user_profile_page/user_profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NavigatorAllPage extends StatefulWidget {
  final int index;

  const NavigatorAllPage({Key? key, this.index = 0}) : super(key: key);

  @override
  State<NavigatorAllPage> createState() => _NavigatorAllPageState();
}

class _NavigatorAllPageState extends State<NavigatorAllPage> {
  int _bottomNavIndex = 0;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  List widgetLst = [];

  @override
  void initState() {
    _bottomNavIndex = widget.index;
    widgetLst = [
      HomePage(scaffoldKey: scaffoldKey),
      LikePage(scaffoldKey),
      MessagePage(scaffoldKey),
      UserProfilePage(scaffoldKey: scaffoldKey),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        key: scaffoldKey,
        resizeToAvoidBottomInset: false,
        drawerEnableOpenDragGesture: true,
        drawer: draweropen(context),
        body: widgetLst[_bottomNavIndex],
        floatingActionButton: FloatingActionButton(
          splashColor: ColorResource.green,
          hoverColor: ColorResource.red,
          onPressed: () {
            Navigator.push(
                context, CommonNavigator(child: const PostAddPage()));
          },
          backgroundColor: ColorResource.green,
          child: const Icon(
            size: 40,
            Icons.add,
            color: ColorResource.white,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: AnimatedBottomNavigationBar.builder(
          notchSmoothness: NotchSmoothness.softEdge,
          activeIndex: _bottomNavIndex,
          gapLocation: GapLocation.center,
          itemCount: 4,
          tabBuilder: (index, isActive) {
            return Container(
              height: 27,
              width: 27,
              margin:
                  const EdgeInsets.only(top: 7, left: 9, bottom: 8, right: 12),
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: SvgPicture.asset(
                  color: isActive ? ColorResource.green : ColorResource.grey,
                  iconimg[index],
                ),
              ),
            );
          },
          onTap: (index) {
            setState(() {
              _bottomNavIndex = index;
            });
          },
        ));
  }
}
