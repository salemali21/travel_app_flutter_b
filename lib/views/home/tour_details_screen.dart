import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'package:travel_app/components/build_image.dart';
import 'package:travel_app/components/custom_button.dart';
import 'package:travel_app/components/custom_text.dart';
import 'package:travel_app/controllers/home/tour_details_controller.dart';
import 'package:travel_app/helpers/constants.dart';
import 'package:travel_app/models/tour_model.dart';

class TourDetailsScreen extends GetWidget<TourDetailsController> {
  const TourDetailsScreen({
    Key? key,
    required this.model,
  }) : super(key: key);
  final TourModel model;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: GetBuilder<TourDetailsController>(
          builder: (controller) {
            return Container(
              width: Get.width,
              height: Get.height,
              child: Stack(
                // alignment: Alignment.bottomCenter,
                children: [
                  Stack(
                    children: [
                      CarouselSlider.builder(
                        itemCount: model.images!.length,
                        itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
                          return BuildImage(
                            image: model.images![itemIndex],
                            height: Get.height * 0.6,
                            width: Get.width,
                          );
                        },
                        options: CarouselOptions(
                          enableInfiniteScroll: false,
                          height: Get.height * 0.6,
                          viewportFraction: 1.1,
                          onPageChanged:
                              (int index, CarouselPageChangedReason carouselPageChangedReason) {
                            controller.onPageChanged(index);
                          },
                        ),
                      ),
                      Container(
                        alignment: Alignment.bottomCenter,
                        height: Get.height * 0.54,
                        padding: EdgeInsets.only(bottom: 100),
                        child: AnimatedSmoothIndicator(
                          activeIndex: controller.currentCarouselIndex,
                          count: model.images!.length,
                          effect: SlideEffect(
                            spacing: 8.0,
                            dotWidth: 13,
                            dotHeight: 13,
                            strokeWidth: 1.5,
                            dotColor: Colors.grey,
                            activeDotColor: Colors.white,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () => Get.back(),
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      width: Get.width,
                      height: Get.height * 0.55,
                      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40),
                        ),
                      ),
                      child: Column(
                        children: [
                          Column(
                            children: [
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomText(
                                    text: model.title!,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 28,
                                  ),
                                  CustomText(
                                    text: "\$${model.startedPrice}",
                                    fontWeight: FontWeight.bold,
                                    color: k_primaryColor,
                                    fontSize: 28,
                                  )
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    LineIcons.starAlt,
                                    color: Color(0xFFFF9900),
                                  ),
                                  SizedBox(width: 5),
                                  CustomText(
                                    text:
                                        "${model.rating} (${model.numberOfReviews}  ${'reviews'.tr})",
                                    color: k_fontGray,
                                  ),
                                ],
                              )
                            ],
                          ),
                          SizedBox(height: 25),
                          Container(
                            height: 45,
                            child: ListView.separated(
                              physics: BouncingScrollPhysics(),
                              itemCount: controller.viewDetail.length,
                              scrollDirection: Axis.horizontal,
                              separatorBuilder: (BuildContext context, int index) {
                                return SizedBox(width: 25);
                              },
                              itemBuilder: (BuildContext context, int index) {
                                return GestureDetector(
                                  onTap: () {
                                    controller.onChangeViewDetail(index);
                                  },
                                  child: Column(
                                    children: [
                                      CustomText(
                                        text: controller.viewDetail[index],
                                        color: controller.currentViewDetailIndex == index
                                            ? k_primaryColor
                                            : Colors.black,
                                      ),
                                      SizedBox(height: 3),
                                      if (controller.currentViewDetailIndex == index)
                                        CircleAvatar(
                                          radius: 3,
                                          backgroundColor: k_primaryColor,
                                        ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),

                          Expanded(
                            child: _buildDetails(
                              index: controller.currentViewDetailIndex,
                              model: model,
                            ),
                          ),

                          Row(
                            children: [
                              Expanded(
                                flex: 12,
                                child: Container(
                                  height: 57,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(70),
                                    border: Border.all(
                                      color: k_primaryColor,
                                    ),
                                  ),
                                  child: GestureDetector(
                                    child: Center(
                                      child: CustomText(
                                        text: "\$${model.extraPrice}",
                                        color: k_primaryColor,
                                      ),
                                    ),
                                    onTap: () {},
                                  ),
                                ),
                              ),
                              SizedBox(width: 15),
                              Expanded(
                                flex: 16,
                                child: CustomButton(
                                  text: "Book_Now".tr,
                                  onPressed: () {},
                                  radius: 70,
                                ),
                              ),
                            ],
                          )
                          // Expanded(child: Row()),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class _buildDetails extends StatelessWidget {
  const _buildDetails({
    Key? key,
    required this.index,
    required this.model,
  }) : super(key: key);
  final int index;
  final TourModel model;

  @override
  Widget build(BuildContext context) {
    switch (index) {
      case 0: // Overview
        return SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              CustomText(text: model.overview!, textAlign: TextAlign.start, maxLines: 20),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _BuildInfoItem(
                    imagePath: "assets/images/duration.png",
                    title: "${model.durationDay} " + "Days".tr,
                    subTitle: "Duration".tr,
                  ),
                  _BuildInfoItem(
                    imagePath: "assets/images/Location.png",
                    title: "${model.distance} " + "KM".tr,
                    subTitle: "Distance".tr,
                  ),
                  _BuildInfoItem(
                    imagePath: "assets/images/weather_condition.png",
                    title: "${model.temperature} " + "C",
                    subTitle: "${model.weatherCondition}",
                  ),
                ],
              ),
              SizedBox(height: 20)
            ],
          ),
        );
      case 1: // Details
        return CustomText(text: model.details!);
      case 2: // Reviews
        return CustomText(text: model.reviews!);
      case 3: // Costs
        return CustomText(text: model.costs!);
    }
    return CustomText(text: model.overview!);
  }
}

class _BuildInfoItem extends StatelessWidget {
  const _BuildInfoItem({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.subTitle,
  }) : super(key: key);
  final String imagePath;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            BuildImage(
              image: imagePath,
              width: 20,
              height: 20,
              isNetworkImage: false,
            ),
            SizedBox(width: 5),
            CustomText(
              text: title,
              fontWeight: FontWeight.bold,
            ),
          ],
        ),
        SizedBox(height: 5),
        CustomText(
          text: subTitle,
          color: k_fontGray,
          fontSize: 15,
        ),
      ],
    );
  }
}
