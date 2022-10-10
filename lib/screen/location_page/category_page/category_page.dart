import 'package:ecommerce/common/constant/color_res.dart';
import 'package:ecommerce/common/constant/image_res.dart';
import 'package:ecommerce/common/constant/string_res.dart';
import 'package:ecommerce/common/widget/common_text.dart';
import 'package:ecommerce/common/widget/elevated_button.dart';
import 'package:ecommerce/screen/location_page/category_page/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  final List<bool> _selected =
      List.generate(CategoryWidget().categoryListName.length, (index) => false);

  final scaffoldKey = GlobalKey<ScaffoldState>();

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
              child: GridView.builder(
                itemCount: CategoryWidget().categoryListIcon.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 3, crossAxisCount: 2),
                itemBuilder: (context, index) {
                  return Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8)),
                        border: Border.all(
                            width: 1,
                            color: ColorResource.grey.withOpacity(0.2))),
                    child: InkWell(
                      onTap: () {
                        showModalBottomSheet(
                          isScrollControlled: true,
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25.0),
                            topRight: Radius.circular(25.0),
                          )),
                          context: context,
                          builder: (context) {
                            return StatefulBuilder(
                              builder: (context, setState) {
                                return Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.85,
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20),
                                      ),
                                    ),
                                    child: Column(
                                      children: [
                                        Expanded(
                                          child: SizedBox(
                                            child: ListView.builder(
                                              itemCount: CategoryWidget()
                                                  .categoryButtomSheetName
                                                  .length,
                                              itemBuilder: (context, index) {
                                                return ListTile(
                                                  onTap: () {
                                                    setState(() {
                                                      _selected[index] =
                                                          !_selected[index];
                                                    });
                                                  },
                                                  shape:
                                                      const RoundedRectangleBorder(
                                                    side: BorderSide(
                                                        color: Colors.grey,
                                                        width: 0.05),
                                                  ),
                                                  title: CommonText(
                                                    text: CategoryWidget()
                                                            .categoryButtomSheetName[
                                                        index],
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                  trailing: SvgPicture.asset(
                                                      ImageResources.chekicon,
                                                      color: _selected[index]
                                                          ? ColorResource.green
                                                          : ColorResource.grey),
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        CommonElevatedButton(
                                          onPressed: () {},
                                          buttonColor: ColorResource.green,
                                          textSize: 16,
                                          text: StringResources.apply,
                                          textColor: ColorResource.white,
                                        ),
                                      ],
                                    ));
                              },
                            );
                          },
                        );
                      },
                      child: GridTileBar(
                        leading: Container(
                          height: 40,
                          width: 40,
                          margin: const EdgeInsets.only(
                              top: 7, left: 9, bottom: 8, right: 12),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: const Color(0xff2ECC71).withOpacity(0.1),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: SvgPicture.asset(
                                CategoryWidget().categoryListIcon[index],
                              )),
                        ),
                        title: CommonText(
                          text: CategoryWidget().categoryListName[index],
                          fontSize: 14,
                          color: ColorResource.black,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  );
                },
              )),
        ),
      ]),
    );
  }
}
