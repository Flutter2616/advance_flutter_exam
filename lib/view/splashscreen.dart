import 'package:advance_flutter_exam/provider/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3),() {
      Navigator.pushReplacementNamed(context, 'home');
    },);
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Image.asset("assets/logo.png",width: 40.w,height: 40.w,fit: BoxFit.fill),
        ),
      ),
    );
  }
}
