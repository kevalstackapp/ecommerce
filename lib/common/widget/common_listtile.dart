import 'package:ecommerce/common/constant/image_res.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CommonListTile extends StatelessWidget {
  final Widget? title;
  final Widget? subtitle;

  final Color? color;
  final VoidCallback? onTap;
  final String? text;
  final String? titletext;

  const CommonListTile(
      {Key? key,
      this.title,
      this.subtitle,
      this.onTap,
      this.text,
      this.titletext,
      this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        height: 40,
        width: 40,
        margin: const EdgeInsets.only(top: 7, left: 9, bottom: 8, right: 12),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: const Color(0xff2ECC71).withOpacity(0.1),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: SvgPicture.asset(
            text!,
          ),
        ),
      ),
      title: Text(
        titletext!,
        style: GoogleFonts.poppins(
            textStyle: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w400,
        )),
      ),
      subtitle: subtitle,
      trailing: SvgPicture.asset(ImageResources.backarow),
      textColor: color,
      onTap: onTap,
      iconColor: color,
    );
  }
}
