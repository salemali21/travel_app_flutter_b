import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app/components/build_image.dart';
import 'package:travel_app/components/custom_text.dart';
import 'package:travel_app/helpers/constants.dart';
import 'package:travel_app/models/tour_model.dart';
import 'package:travel_app/views/home/tour_details_screen.dart';

class BuildSearchItem extends StatelessWidget {
  final TourModel model;
  const BuildSearchItem({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(() => TourDetailsScreen(model: model)),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: BuildImage(
              image: model.image!,
              height: 140,
              width: Get.width,
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(text: model.title!, fontWeight: FontWeight.w600),
                CustomText(text: "\$${model.startedPrice}", fontWeight: FontWeight.w600),
              ],
            ),
          ),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 65,
                    height: 25,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: k_primaryColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.star, color: Colors.white, size: 20),
                        CustomText(
                          text: "${model.rating}",
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 8),
                  CustomText(
                    text: "(${model.numberOfReviews} ${("reviews").tr})",
                    color: k_fontGray,
                    fontSize: 14,
                  ),
                ],
              ),
              CustomText(
                text: "per_night".tr,
                color: k_fontGray,
                fontSize: 14,
              ),
            ],
          )
        ],
      ),
    );
  }
}
