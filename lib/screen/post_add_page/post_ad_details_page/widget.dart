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
    return CommonTextField(textInputType: TextInputType.number,
      hintText: StringResources.amount1,
    );
  }

 static Widget descriptionTextFiled() {
    return CommonTextField(maxLines: 6,
      hintText: StringResources.description,
    );
  }
}
