import 'package:advance_flutter_exam/model/Productmodel.dart';
import 'package:advance_flutter_exam/model/offer_model.dart';
import 'package:advance_flutter_exam/view/home_screen.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Detailscreen extends StatefulWidget {
  const Detailscreen({super.key});

  @override
  State<Detailscreen> createState() => _DetailscreenState();
}

class _DetailscreenState extends State<Detailscreen> {
  @override
  Widget build(BuildContext context) {
    int i = ModalRoute.of(context)!.settings.arguments as int;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 30.h,
                width: 100.w,
                alignment: Alignment.center,
                color: Colors.white,
                child: CarouselSlider.builder(
                  itemCount: 4,
                  itemBuilder:
                      (BuildContext context, int index, int realIndex) {
                    return Image.asset("assets/logo.png",
                        width: 50.w, height: 50.w, fit: BoxFit.fill);
                  },
                  options: CarouselOptions(
                    height: 400,
                    aspectRatio: 16 / 9,
                    viewportFraction: 0.8,
                    initialPage: 0,
                    enableInfiniteScroll: false,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 5),
                    enlargeCenterPage: true,
                    enlargeFactor: 0.3,
                    scrollDirection: Axis.horizontal,
                  ),
                ),
              ),
              Container(
                width: 100.w,
                color: Colors.grey.shade100,
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${p!.data![i].productTitle}",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 15.sp,
                              color: Colors.black),
                          maxLines: 1,
                        ),
                        CircleAvatar(
                            child: Icon(Icons.favorite_border,
                                color: Colors.blue, size: 20.sp),
                            backgroundColor: Colors.white,
                            radius: 15.sp),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text(
                      "${p!.data![i].productDescription}",
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w400,
                          fontSize: 12.sp),
                    ),
                    Text(
                      "Size:${p!.data![i].productAttributes!.size}",
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w400,
                          fontSize: 12.sp),
                    ),
                    Text(
                      "Colors:${p!.data![i].productAttributes!.color}",
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w400,
                          fontSize: 12.sp),
                    ),
                    Text(
                      "features:${p!.data![i].productAttributes!.features}",
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w400,
                          fontSize: 12.sp),
                    ),
                    Text(
                      "material:${p!.data![i].productAttributes!.material}",
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w400,
                          fontSize: 12.sp),
                    ),
                    SizedBox(height: 10),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "offers",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 15.sp,
                              color: Colors.black),
                        ),
                        InkWell(onTap: () {
                          Offermodal offer;
                         offer= pf!.offer_Api_calling("${p!.data![i].productId}") as Offermodal;
                         Navigator.pushNamed(context, 'offer',arguments: offer);
                        },
                          child: Text(
                            "see all",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 12.sp,
                                color: Colors.blue),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
