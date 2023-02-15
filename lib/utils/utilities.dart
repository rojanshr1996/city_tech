import 'dart:convert';

import 'package:flutter/material.dart';

class Utilities {
  Utilities._();

  static Future<dynamic> openActivity(context, object, {bool fullscreenDialog = false}) async {
    return await Navigator.of(context).push(
      PageRouteBuilder(
        fullscreenDialog: fullscreenDialog,
        transitionDuration: const Duration(milliseconds: 50),
        reverseTransitionDuration: const Duration(milliseconds: 50),
        pageBuilder: (BuildContext context, _, __) {
          return object;
        },
        transitionsBuilder: (_, Animation<double> animation, __, Widget child) {
          return FadeTransition(opacity: animation, child: child);
        },
      ),
    );
  }

  static Future<dynamic> replaceActivity(context, object) async {
    return await Navigator.of(context).pushReplacement(
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 50),
        reverseTransitionDuration: const Duration(milliseconds: 50),
        pageBuilder: (BuildContext context, _, __) {
          return object;
        },
        transitionsBuilder: (_, Animation<double> animation, __, Widget child) {
          return FadeTransition(opacity: animation, child: child);
        },
      ),
    );
  }

  static Future<dynamic> replaceNamedActivity(context, routeName, {Object? arguments}) async {
    return await Navigator.pushReplacementNamed(context, routeName, arguments: arguments);
  }

  static Future<dynamic> openNamedActivity(context, routeName, {Object? arguments}) async {
    return await Navigator.pushNamed(context, routeName, arguments: arguments);
  }

  static void removeStackActivity(context, object) {
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => object), (r) => false);
  }

  static void removeNamedStackActivity(context, routeName, {Object? arguments}) {
    Navigator.of(context).pushNamedAndRemoveUntil(routeName, (Route<dynamic> route) => false, arguments: arguments);
  }

  static void closeActivity(context) {
    Navigator.pop(context);
  }

  static dynamic decodeJson(String jsonString) {
    return json.decode(jsonString);
  }

  static void returnDataCloseActivity(context, object) {
    Navigator.pop(context, object);
  }

  static double screenWidth(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return screenWidth;
  }

  static double screenHeight(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return screenHeight;
  }
}
