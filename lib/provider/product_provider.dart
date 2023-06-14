import 'package:advance_flutter_exam/model/Productmodel.dart';
import 'package:advance_flutter_exam/model/offer_model.dart';
import 'package:advance_flutter_exam/utils/helper_class.dart';
import 'package:flutter/cupertino.dart';

class ProductProvider extends ChangeNotifier
{

  Future<Productmodel> product_Api_calling()
  async {
    return await Helper.helper.product_Api();
  }

  Future<Offermodal> offer_Api_calling(String id)
  async {
    return await Helper.helper.offer_api(id);
  }
}