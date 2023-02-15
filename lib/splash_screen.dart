import 'package:flutter/material.dart';
import 'package:new_city_project/utils/res/app_colors.dart';
import 'package:new_city_project/utils/utilities.dart';
import 'package:new_city_project/views/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      Utilities.removeStackActivity(context, const HomeScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blue,
      body: SizedBox(
        height: Utilities.screenHeight(context),
        width: Utilities.screenWidth(context),
        child: const Center(
          child: Text(
            "TEST APP",
            style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
