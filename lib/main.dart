import 'package:advance_flutter_exam/provider/product_provider.dart';
import 'package:advance_flutter_exam/view/detail_screen.dart';
import 'package:advance_flutter_exam/view/home_screen.dart';
import 'package:advance_flutter_exam/view/offer_screen.dart';
import 'package:advance_flutter_exam/view/splashscreen.dart';
import'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
void main()
{
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProductProvider()),
      ],
      child: Sizer(
        builder: (context, orientation, deviceType) =>  MaterialApp(
          debugShowCheckedModeBanner: false,
          // initialRoute: 'detail',
          routes: {
            '/':(context) => Splashscreen(),
            'home':(context) => Homescreen(),
            'detail':(context) => Detailscreen(),
            'offer':(context) => Offerscreen(),
          },
        ),
      ),
    ),
  );
}