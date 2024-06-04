import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:thamn/Config/config.dart';
import 'package:thamn/Ui/Screen/Screen/Root/Root/controller/Controller.dart';

Widget myNavBar(BuildContext context, RootController controller, int basketCounter) {
  return CustomNavigationBar(
    iconSize: 27.0,
    selectedColor: ColorX.primary,
    strokeColor: ColorX.secondary,
    unSelectedColor: ColorX.greyDark,
    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    elevation: 4.0,
    items: [
      CustomNavigationBarItem(
        icon: const Icon(Iconsax.home),
        selectedIcon: const Icon(Iconsax.home_15),
      ),
      CustomNavigationBarItem(
        icon: Stack(
          children: [
            const Icon(Iconsax.bag_happy5), // Your icon
            if (basketCounter > 0)
              Positioned(
                top: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    color: Colors.red, // Customize the color of the container
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    basketCounter.toString(), // Your number
                    style: const TextStyle(
                      color: Colors.white, // Customize the color of the number
                      fontSize: 12, // Customize the font size of the number
                    ),
                  ),
                ),
              ),
          ],
        ),
        selectedIcon: const Padding(
          padding: EdgeInsets.only(left: 27),
          child: Icon(Iconsax.bag_happy5),
        ),
      ),
      CustomNavigationBarItem(
        icon: const Icon(Iconsax.profile_circle),
        selectedIcon: const Icon(Iconsax.profile_circle5),
      ),
    ],
    currentIndex: controller.indexSelected.value,
    onTap: controller.onItemSelected,
  );
}
