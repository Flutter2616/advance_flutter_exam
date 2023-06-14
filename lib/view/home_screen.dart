import 'package:advance_flutter_exam/model/Productmodel.dart';
import 'package:advance_flutter_exam/provider/product_provider.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

ProductProvider? pf;
ProductProvider? pt;
Productmodel? p;

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  // void initState() {
  //   Provider.of<ProductProvider>(context, listen: false).product_Api_calling();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    pf = Provider.of<ProductProvider>(context, listen: false);
    pt = Provider.of<ProductProvider>(context, listen: true);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade50,
        bottomNavigationBar: FloatingNavbar(
          currentIndex: 0,
          items: [
            FloatingNavbarItem(icon: Icons.home, title: ""),
            FloatingNavbarItem(icon: Icons.favorite, title: ""),
            FloatingNavbarItem(icon: Icons.shopping_cart, title: ""),
            FloatingNavbarItem(icon: Icons.person, title: ""),
          ],
          backgroundColor: Colors.white,
          unselectedItemColor: Colors.grey.shade400,
          margin: EdgeInsets.all(0),
          selectedItemColor: Colors.white,
          selectedBackgroundColor: Colors.blue,
          iconSize: 20.sp,
          elevation: 0,
          itemBorderRadius: 15,
          borderRadius: 0,
          onTap: (int val) {},
        ),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text("Product Mall",
              style: GoogleFonts.cherryCreamSoda(
                  fontSize: 15.sp,
                  color: Colors.blue,
                  fontWeight: FontWeight.w700)),
          centerTitle: true,
          leading: Icon(Icons.sort, size: 25.sp, color: Colors.black),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Icon(Icons.search, color: Colors.black, size: 25.sp),
            ),
          ],
        ),
        body: FutureBuilder(
          future: pf!.product_Api_calling(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text("${snapshot.error}");
            } else if (snapshot.hasData) {
              p = snapshot.data!;
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Popular Products",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                  fontSize: 12.sp)),
                          Row(
                            children: [
                              Text("sort by",
                                  style: TextStyle(
                                      fontSize: 10.sp,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500)),
                              SizedBox(width: 5),
                              Icon(
                                Icons.keyboard_arrow_down_sharp,
                                size: 10.sp,
                                color: Colors.black,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Expanded(
                        child: GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 8,
                                    mainAxisSpacing: 8,
                                    mainAxisExtent: 30.h),
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  Navigator.pushNamed(context, 'detail',
                                      arguments: index);
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade200,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            width: 8.w,
                                            height: 9.w,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                                gradient: LinearGradient(
                                                    colors: [
                                                      Colors.blue.shade700,
                                                      Colors.blue.shade900
                                                    ]),
                                                borderRadius:
                                                    BorderRadius.circular(2)),
                                            child: Text("4.5",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 11.sp,
                                                    fontWeight:
                                                        FontWeight.w400)),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 8.0),
                                            child: Icon(Icons.favorite_border,
                                                color: Colors.blueGrey,
                                                size: 18.sp),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          p!.data![index].productPhotos == null
                                              ? Image.asset("assets/logo.png",
                                                  width: 30.w,
                                                  height: 30.w,
                                                  fit: BoxFit.fill)
                                              : Image.network(
                                                  "${p!.data![index].productPhotos![0]}",
                                                  width: 30.w,
                                                  height: 30.w,
                                                  fit: BoxFit.fill),
                                        ],
                                      ),
                                      Text(
                                        "${p!.data![index].productTitle}",
                                        maxLines: 1,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15.sp,
                                            color: Colors.black),
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        "${p!.data![index].productDescription}",
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 9.sp,
                                            color: Colors.grey.shade600),
                                      ),
                                      SizedBox(height: 10),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "\$${p!.data![index].typicalPriceRange![0]}",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 15.sp,
                                                color: Colors.blue),
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                color: Colors.blue.shade100),
                                            alignment: Alignment.center,
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10, vertical: 5),
                                            child: Text("Add",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 10.sp,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                            itemCount: p!.data!.length))
                  ],
                ),
              );
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
