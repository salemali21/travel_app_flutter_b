import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:travel_app/components/custom_button.dart';
import 'package:travel_app/components/custom_text.dart';
import 'package:travel_app/helpers/catch_storage.dart';
import 'package:travel_app/helpers/constants.dart';
import 'package:travel_app/models/boarding_model.dart';
import 'package:get/get.dart';
import 'package:travel_app/views/auth/login_screen.dart';

// ignore: must_be_immutable
class OnBoardingScreen extends StatefulWidget {
  OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController boardingController = PageController();

  int currentIndex = 0;

  final List<BoardingModel> items = [
    BoardingModel(
      title: "explore_destinations",
      subtitle: "explore_desc",
      image: "assets/images/mountain1.png",
    ),
    BoardingModel(
      title: "choose_destination",
      subtitle: "destination_desc",
      image: "assets/images/destination.png",
    ),
    BoardingModel(
      title: "fly_destination",
      subtitle: "fly_desc",
      image: "assets/images/travelling_earth.png",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: Get.width,
          child: Column(
            children: [
              SizedBox(
                height: Get.height * 0.2,
              ),
              Container(
                height: 350,
                child: PageView.builder(
                  physics: BouncingScrollPhysics(),
                  controller: boardingController,
                  itemCount: items.length,
                  onPageChanged: (index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Image.asset(
                          items[index].image,
                          width: Get.width / 2,
                        ),
                        SizedBox(height: 12),
                        CustomText(
                          text: items[index].title.tr,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                        SizedBox(height: 12),
                        Container(
                          width: Get.width / 1.5,
                          child: CustomText(
                            text: items[index].subtitle.tr,
                            fontSize: 16,
                            color: Color(0xFFA5A7AC),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              SizedBox(height: 10),
              SmoothPageIndicator(
                controller: boardingController,
                count: 3,
                axisDirection: Axis.horizontal,
                effect: ExpandingDotsEffect(
                  spacing: 8.0,
                  radius: 10,
                  dotWidth: 22.0,
                  dotHeight: 12.0,
                  paintStyle: PaintingStyle.fill,
                  strokeWidth: 1.5,
                  dotColor: Color(0xFFC4C4C4),
                  activeDotColor: k_primaryColor,
                ),
              ),
              SizedBox(height: 30),
              CustomButton(
                text: "continue".tr,
                onPressed: currentIndex == items.length - 1
                    ? () async {
                        await CatchStorage.save(k_onBoardingKey, true);
                        await Get.off(() => LoginScreen());
                      }
                    : null,
              )
            ],
          ),
        ),
      ),
    );
  }
}
