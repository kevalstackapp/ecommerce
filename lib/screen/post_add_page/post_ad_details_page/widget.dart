import 'package:ecommerce/common/constant/string_res.dart';
import 'package:ecommerce/common/widget/common_text_field.dart';
import 'package:flutter/cupertino.dart';

class PostAdDetailModel {
 static Widget titleTextFiled() {
    return CommonTextField(
      hintText: StringResources.title,
    );
  }

 static Widget amountTextFiled() {
    return CommonTextField(
      hintText: StringResources.amount1,
    );
  }

 static Widget descriptionTextFiled() {
    return CommonTextField(
      hintText: StringResources.description,
    );
  }
}
