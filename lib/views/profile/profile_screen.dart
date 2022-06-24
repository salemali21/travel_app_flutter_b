import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:travel_app/components/build_image.dart';
import 'package:travel_app/components/custom_text.dart';
import 'package:travel_app/controllers/profile/profile_controller.dart';
import 'package:travel_app/helpers/constants.dart';
import 'package:travel_app/helpers/main_user.dart';
import 'package:travel_app/views/profile/add_card_screen.dart';
import 'package:travel_app/views/profile/change_language_screen.dart';
import 'package:travel_app/views/profile/currency_converter_screen.dart';
import 'package:travel_app/views/profile/edit_account_screen.dart';

class ProfileScreen extends GetWidget<ProfileController> {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: Get.width,
        height: Get.height,
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
        child: Column(
          children: [
            SizedBox(height: 30),
            GetBuilder<ProfileController>(
              builder: (_) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(60),
                  child: BuildImage(
                    image: MainUser.instance.model!.image!,
                    width: 120,
                    height: 120,
                  ),
                );
              },
            ),
            SizedBox(height: 10),
            GetBuilder<ProfileController>(
              builder: (_) {
                return CustomText(
                  text: MainUser.instance.model!.name!,
                  fontWeight: FontWeight.bold,
                  fontSize: 26,
                );
              },
            ),
            SizedBox(height: 30),
            _BuildItem(
              title: "Edit account".tr,
              leadingIcon: Icons.settings,
              sufixIcon: Icons.arrow_forward_ios,
              onTap: () => Get.to(() => EditAccountScreen()),
            ),
            SizedBox(height: 25),
            _BuildItem(
              title: "Add a new card".tr,
              leadingIcon: Icons.add,
              sufixIcon: Icons.arrow_forward_ios,
              onTap: () => Get.to(() => AddCardScreen()),
            ),
            SizedBox(height: 25),
            _BuildItem(
              title: "Change Language".tr,
              leadingIcon: Icons.language,
              sufixIcon: Icons.arrow_forward_ios,
              onTap: () {
                Get.to(() => ChangeLanguageScreen());
              },
            ),
            SizedBox(height: 25),
            _BuildItem(
              title: "Account Security".tr,
              leadingIcon: Icons.lock_open,
              sufixIcon: Icons.arrow_forward_ios,
              onTap: () {},
            ),
            SizedBox(height: 25),
            _BuildItem(
              title: "Help".tr,
              leadingIcon: Icons.help_outline,
              sufixIcon: Icons.arrow_forward_ios,
              onTap: () {},
            ),
            SizedBox(height: 25),
            _BuildItem(
              title: "Currency Converter".tr,
              leadingIcon: Icons.currency_bitcoin,
              sufixIcon: Icons.arrow_forward_ios,
              onTap: () {
                Get.to(() => CurrencyConverterScreen());
              },
            ),
            SizedBox(height: 25),
            _BuildItem(
              title: "Logout".tr,
              leadingIcon: Icons.logout,
              // sufixIcon: Icons.arrow_forward_ios,
              onTap: () {
                controller.logut();
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _BuildItem extends StatelessWidget {
  const _BuildItem({
    Key? key,
    this.onTap,
    required this.title,
    required this.leadingIcon,
    this.sufixIcon,
  }) : super(key: key);
  final void Function()? onTap;
  final String title;
  final IconData leadingIcon;
  final IconData? sufixIcon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Icon(leadingIcon, color: k_primaryColor, size: 30),
          SizedBox(width: 20),
          Expanded(
            child: CustomText(
              text: title,
              fontSize: 18,
              textAlign: TextAlign.start,
            ),
          ),
          if (sufixIcon != null) Icon(sufixIcon, color: k_buttonGray, size: 20),
        ],
      ),
    );
  }
}
