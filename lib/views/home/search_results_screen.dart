import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:line_icons/line_icons.dart';
import 'package:travel_app/components/build_search_item.dart';
import 'package:travel_app/components/custom_field.dart';
import 'package:travel_app/components/custom_text.dart';
import 'package:travel_app/controllers/home/search_results_controller.dart';
import 'package:travel_app/helpers/constants.dart';

// ignore: must_be_immutable
class SearchResultsScreen extends GetWidget<SearchResultsController> {
  SearchResultsScreen({
    required this.city,
    required this.checkIn,
    required this.checkOut,
    Key? key,
  }) : super(key: key);
  String? city;
  final DateTime checkIn;
  final DateTime checkOut;
  final String patternOfDateTime = "d MMM";

  String get textOfSearchBox {
    if (city == null) city = "";
    return city! +
        " " +
        DateFormat(patternOfDateTime).format(checkIn) +
        " , " +
        DateFormat(patternOfDateTime).format(checkOut);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: CustomText(
          text: "Hotels".tr,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Column(
        children: [
          Container(
            width: Get.width,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(85),
                  child: CustomField(
                    enabled: false,
                    hint: textOfSearchBox,
                    fillColor: k_fieldGray,
                    radius: 85,
                    suffixIcon: Container(
                      margin: EdgeInsets.all(10),
                      child: CircleAvatar(
                        backgroundColor: k_primaryColor,
                        child: Icon(LineIcons.search, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: GetBuilder<SearchResultsController>(
              builder: ((controller) {
                if (controller.isLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (controller.results.isEmpty)
                  return Center(
                    child: CustomText(
                      text: "empty_result".tr,
                      fontSize: 30,
                    ),
                  );

                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: ListView.separated(
                    itemCount: controller.results.length,
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(height: 20);
                    },
                    itemBuilder: (BuildContext context, int index) {
                      return BuildSearchItem(model: controller.results[index]);
                    },
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
