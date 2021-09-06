import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jurema/pages.dart';
import 'package:jurema/routes.dart';

class RootApplication extends StatefulWidget {
  const RootApplication({Key? key}) : super(key: key);

  @override
  _RootApplicationState createState() => _RootApplicationState();
}

class _RootApplicationState extends State<RootApplication> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: pages,
      initialRoute: RouteNames.login,
    );
  }
}
