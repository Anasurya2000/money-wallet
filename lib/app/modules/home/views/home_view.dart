import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../../graph/views/graph_view.dart';
import '../controllers/home_controller.dart';
import 'total_expenses_view.dart';
import 'total_income_view.dart';
import 'widget/custom_icons.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final body = [
      Home(),
      const GraphChart(),
    ];
    return WillPopScope(
      onWillPop: () async {
        if (controller.currentIndex.value != 0) {
          controller.changeIndex(controller.currentIndex.value - 1);
          return false;
        } else {
          return true;
        }
      },
      child: Scaffold(
        body: Obx(() => body[controller.currentIndex.value]),
        bottomNavigationBar: Obx(() => Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                SalomonBottomBar(
                  currentIndex: controller.currentIndex.value,
                  onTap: controller.changeIndex,
                  items: [
                    SalomonBottomBarItem(
                        title: const Text(
                          "Home",
                          style: TextStyle(color: Colors.white),
                        ),
                        icon: const Icon(Icons.home)),
                    SalomonBottomBarItem(
                        title: const Text(
                          "Graph",
                          style: TextStyle(color: Colors.white),
                        ),
                        icon: const Icon(Icons.graphic_eq)),
                  ],
                ),
              ],
            )),
      ),
    );
  }
}

class Home extends StatelessWidget {
  Home({
    super.key,
  });
  final categoryController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 35, horizontal: 25),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Hi Guru ',
                style: TextStyle(fontSize: 40),
              ),
              const SizedBox(height: 15),
              const Text(
                'Total Balance',
                style: TextStyle(fontSize: 25),
                // style: theme.,
              ),
              const Text(
                '₹ 25000',
                style: TextStyle(fontSize: 40),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomCostDetails(
                      icon: (Icons.call_made), data: 'Income', onPressed: () => Get.to(() => const TotalIncome())),
                  CustomCostDetails(
                      icon: (Icons.call_received),
                      data: 'Expenses',
                      onPressed: () => Get.to(() => const TotalExpense())),
                  CustomCostDetails(data: 'Add', icon: (Icons.add), onPressed: () {}
                      // => Get.to(() => const AddAmount())
                      ),
                ],
              ),
              Text(categoryController.text, style: const TextStyle(color: Colors.amber)),
              ListView.separated(
                shrinkWrap: true,
                itemCount: 5,
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider();
                },
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    visualDensity: VisualDensity.compact,
                    title: const Text('Salary'),
                    subtitle: const Text('₹ 30000'),
                    trailing: IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_forward_ios_outlined)),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      // floatingActionButton:
      //     FloatingActionButton.extended(onPressed: () => addCategory(context), label: const Text('+ Add Categories')),
    );
  }

  Future<dynamic> addCategory(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          final theme = Theme.of(context);
          return Container(
            height: 290,
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 22),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(6),
                topRight: Radius.circular(6),
              ),
              // color: Colors.transparent,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Choose Category',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
                TextFormField(
                  controller: categoryController,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    border: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: theme.colorScheme.primary,
                      ),
                    ),
                    labelText: 'Categories',
                    hintText: 'Add Categories',
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                  ),
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(),
                    onPressed: () {
                      Get.back();
                    },
                    child: const Text('Add')),
              ],
            ),
          );
        });
  }
}
