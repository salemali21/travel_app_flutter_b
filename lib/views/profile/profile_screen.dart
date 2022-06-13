import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app/components/custom_button.dart';
import 'package:travel_app/views/profile/add_card_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      child: Column(
        children: [
          CustomButton(
            text: "Add a new card",
            onPressed: () => Get.to(() => AddCardScreen()),
          ),
        ],
      ),
    );
  }
}
