import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_system/controller/main_controller.dart';

import 'widgets/home_button_widget.dart';
import 'widgets/home_drawer_profile_widget.dart';
import 'widgets/home_profile_action_menu_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(MainController());
    return SafeArea(
      child: Container(
        color: Colors.white,
        child: Scaffold(
          appBar: AppBar(
            title: const Text(
              "POS",
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.red,
            leading: Builder(
              builder: (context) => IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: const Icon(
                  Icons.menu,
                  color: Colors.white,
                ),
              ),
            ),
            actions: const [
              HomeProfileActionMenuWidget(),
            ],
          ),
          backgroundColor: Colors.transparent,
          drawer: const Drawer(
            child: HomeScreenDrawerWidget(),
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  height: 220,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/bg_image.jpg"),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 30),
                        Container(
                          height: 85,
                          width: 85,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: const DecorationImage(
                              image: AssetImage("assets/images/logo_image.jpg"),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        const Text(
                          "SNACK AND RELAX",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                        const Text(
                          "POS Profile : Cashier / Address: Sieam Reap, Cambodia",
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: 350,
                      child: Wrap(
                        children: [
                          HomeButtonWidget(
                            title: "Start Shift".tr,
                            iconData: Icons.access_time,
                            onPressed: controller.onStartShiftPressed,
                          ),
                          HomeButtonWidget(
                            title: "Close Shift".tr,
                            iconData: Icons.access_time,
                            background: Colors.red,
                            foreground: Colors.white,
                            foregroundIconColor: Colors.white,
                            onPressed: controller.onCloseShiftPressed,
                          ),
                          HomeButtonWidget(
                            title: "POS".tr,
                            iconData: Icons.shopping_cart_outlined,
                            onPressed: controller.onPOSPressed,
                            background: Colors.green,
                            foreground: Colors.white,
                            foregroundIconColor: Colors.white,
                          ),
                          HomeButtonWidget(
                              title: "Receipt".tr,
                              iconData: Icons.receipt_outlined,
                              onPressed: () {}),
                          HomeButtonWidget(
                            title: "Customer".tr,
                            iconData: Icons.group,
                            onPressed: () {},
                          ),
                          HomeButtonWidget(
                            title: "Report".tr,
                            iconData: Icons.assessment_outlined,
                            onPressed: () {},
                          ),
                          HomeButtonWidget(
                            title: "Backup".tr,
                            iconData: Icons.save,
                            onPressed: controller.onBackupPressed,
                            background: Colors.yellow.shade600,
                            foreground: Colors.white,
                            foregroundIconColor: Colors.white,
                          ),
                          HomeButtonWidget(
                            title: "WiFi".tr,
                            iconData: Icons.wifi_outlined,
                            onPressed: controller.onWIFIPressed,
                          ),
                          HomeButtonWidget(
                              title: "Reset Transaction".tr,
                              iconData: Icons.restart_alt_outlined,
                              onPressed: () {}),
                          HomeButtonWidget(
                            title: "Logout".tr,
                            background: Colors.red,
                            foreground: Colors.white,
                            iconData: Icons.logout_outlined,
                            onPressed: controller.onLogoutPressed,
                            foregroundIconColor: Colors.white,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
