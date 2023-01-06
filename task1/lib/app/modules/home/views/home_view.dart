import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          floatingActionButton: actionButton(),
          appBar: appBar(),
          body: TabBarView(
            children: [
              allPosts(),
              profiles(),
            ],
          ),
        ),
      ),
    );
  }

  Container actionButton() {
    return Container(
      child: Icon(
        Icons.add,
        color: Colors.white,
      ),
      height: 50,
      width: 50,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(50), color: Colors.red),
    );
  }

  AppBar appBar() {
    return AppBar(
      backgroundColor: Colors.red,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: Icon(Icons.search),
        )
      ],
      leading: Icon(Icons.menu),
      title: Text('Lorem Ipsum'),
      bottom: TabBar(
        tabs: [Tab(text: "ALL POSTS"), Tab(text: "PROFILE")],
      ),
    );
  }

  Container allPosts() {
    return Container(
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, i) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: GestureDetector(
              onTap: () => controller.selectedTile.value = i,
              child: ListTile(
                  title: Obx(
                    () => Text(
                      "Title",
                      style: TextStyle(
                        color: controller.selectedTile.value == i ? Colors.red : Colors.black,
                        fontWeight: controller.selectedTile.value == i ? FontWeight.w600 : null,
                      ),
                    ),
                  ),
                  subtitle: Obx(() => Text(
                        'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. ',
                        style: TextStyle(
                          color: controller.selectedTile.value == i ? Colors.black : Colors.grey,
                        ),
                      )),
                  shape: Border(
                    bottom: BorderSide(color: Colors.grey.withOpacity(i == 11 ? 0 : 0.5), width: 1),
                  ),
                  contentPadding: EdgeInsets.only(top: 15, bottom: 5)),
            ),
          );
        },
        itemCount: 12,
      ),
    );
  }

  Column profiles() {
    return Column(
      children: [
        profileTile(title: 'Name', text: 'Muhammad Hashir'),
        profileTile(title: 'Username', text: 'Hashir'),
        profileTile(title: 'Address', text: 'House 45, 123 Street, Khi, Pakistan'),
        profileTile(title: 'Zipcode', text: '9154-6554'),
      ],
    );
  }

  Container profileTile({required String title, required String text}) {
    return Container(
      decoration: BoxDecoration(
          border: Border(
        bottom: BorderSide(color: Colors.grey.withOpacity(0.5), width: 1),
      )),
      padding: EdgeInsets.all(20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: Text(
            title,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          )),
          Expanded(
              child: Text(
            text,
            style: TextStyle(
              fontSize: 20,
            ),
            textAlign: TextAlign.right,
          ))
        ],
      ),
    );
  }
}
