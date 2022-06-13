import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app/components/custom_text.dart';

class BuildFutureBuilder extends StatelessWidget {
  const BuildFutureBuilder({
    Key? key,
    this.future,
    required this.widget,
  }) : super(key: key);
  final Future<Object>? future;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: future,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return CustomText(text: "Something_wrong".tr);
        }
        return widget;
      },
    );
  }
}
