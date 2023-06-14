import 'dart:convert';

import 'package:advance_flutter_exam/model/Productmodel.dart';
import 'package:advance_flutter_exam/model/offer_model.dart';
import 'package:http/http.dart' as http;

class Helper {
  static Helper helper = Helper();

  Future<Productmodel> product_Api() async {
    String link =
        "https://real-time-product-search.p.rapidapi.com/search?q=Nike%20shoes&country=us&language=en";
    var response = await http.get(Uri.parse(link), headers: {
      "X-RapidAPI-Key": "d0d5a9eab1mshb3fe875b20d73b4p1a9ad3jsn89ea54996bbb",
      "X-Rapidapi-Host": "real-time-product-search.p.rapidapi.com"
    });
    var jsondata = jsonDecode(response.body);
    Productmodel p;
    p = Productmodel.fromJson(jsondata);
    return p;
  }

  Future<Offermodal> offer_api(String id) async {
    String link =
        'https://real-time-product-search.p.rapidapi.com/product-offers?product_id=$id&country=us&language=en';
    var response = await http.get(Uri.parse(link), headers: {
      "X-RapidAPI-Key": "d0d5a9eab1mshb3fe875b20d73b4p1a9ad3jsn89ea54996bbb",
      "X-RapidAPI-Host": "real-time-product-search.p.rapidapi.com"
    });
    var json=jsonDecode(response.body);
    Offermodal offer=Offermodal.fromJson(json);
    return offer;
  }
}
