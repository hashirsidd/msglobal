import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import 'message_view.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [
                Spacer(),
                Text(
                  'When would you like you pickup?',
                  style: TextStyle(fontSize: 18, color: Colors.grey, fontStyle: FontStyle.italic),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Icon(
                      Icons.calendar_month,
                      color: Colors.blue,
                      size: 30,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DateSelectTile(
                  bgColor: Colors.grey,
                  fontColor: Colors.white,
                  date: '25 Jun',
                  day2: 'Yesterday',
                  day: 'Fri',
                ),
                DateSelectTile(
                  bgColor: Colors.blue,
                  fontColor: Colors.white,
                  date: '26 Jun',
                  day2: 'Today',
                  day: 'Sat',
                ),
                DateSelectTile(
                  bgColor: Colors.white,
                  fontColor: Colors.black,
                  date: '27 Jun',
                  day2: 'Tomorrow',
                  day: 'Sun',
                ),
                DateSelectTile(
                  bgColor: Colors.red,
                  fontColor: Colors.white,
                  date: '29 Jun',
                  day2: 'Blackday',
                  day: 'Mon',
                ),
              ],
            ),
            SizedBox(height: 30),
            Text(
              'Available time slots',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 30),
            GridView(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  mainAxisExtent: 40,
                ),
                children: [
                  timeSlot(time: '7am - 9pm', isSelected: true),
                  timeSlot(time: '10am - 12pm', isSelected: false),
                  timeSlot(time: '1pm - 2pm', isSelected: false),
                  timeSlot(time: '4pm - 6pm', isSelected: false),
                  timeSlot(
                    time: '8pm - 10pm',
                    isSelected: false,
                  )
                ]),
            SizedBox(height: 30),
            Container(
              padding: EdgeInsets.only(left: 40, right: 20),
              height: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: kElevationToShadow[3],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Repeat Pickup',
                    style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500, fontSize: 18),
                  ),
                  Transform.scale(
                    scale: 0.6,
                    child: Obx(
                      () => CupertinoSwitch(
                        value: controller.switchValue.value,
                        activeColor: Colors.blue,
                        onChanged: (bool? value) {
                          controller.switchValue.value = !controller.switchValue.value;
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'How Often Repeat?',
                style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500, fontSize: 18),
              ),
            ),
            SizedBox(height: 5),
            Container(
              padding: EdgeInsets.only(left: 40, right: 30),
              height: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: kElevationToShadow[3],
              ),
              child: Obx(() => DropdownButton<String>(
                    value: controller.repeatOftenVal.value == "" ? null : controller.repeatOftenVal.value,
                    icon: const Icon(
                      Icons.keyboard_arrow_down_outlined,
                      color: Colors.grey,
                      size: 25,
                    ),
                    elevation: 16,
                    hint: Text('Select Value', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w300, fontSize: 18)),
                    style: const TextStyle(color: Colors.grey, fontWeight: FontWeight.w500, fontSize: 18),
                    underline: Container(),
                    isExpanded: true,
                    onChanged: (String? value) {
                      controller.repeatOftenVal.value = value.toString();
                    },
                    items: controller.repeatOften.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  )),
            ),
            SizedBox(height: 30),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'How Many Times?',
                style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500, fontSize: 18),
              ),
            ),
            SizedBox(height: 5),
            Container(
              padding: EdgeInsets.only(left: 40, right: 30),
              height: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: kElevationToShadow[3],
              ),
              child: Obx(() => DropdownButton<String>(
                    value: controller.repeatTimesVal.value == "" ? null : controller.repeatTimesVal.value,
                    icon: const Icon(
                      Icons.keyboard_arrow_down_outlined,
                      color: Colors.grey,
                      size: 25,
                    ),
                    elevation: 16,
                    hint: Text('Select Value', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w300, fontSize: 18)),
                    style: const TextStyle(color: Colors.grey, fontWeight: FontWeight.w500, fontSize: 18),
                    underline: Container(),
                    isExpanded: true,
                    onChanged: (String? value) {
                      controller.repeatTimesVal.value = value.toString();
                    },
                    items: controller.repeatTimes.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  )),
            ),
            SizedBox(height: 30),
            GestureDetector(
              onTap: () => Get.to(() => MessageView()),
              child: Container(
                width: double.infinity,
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(vertical: 15),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: kElevationToShadow[3],
                ),
                child: Text(
                  'Continue',
                  style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  AppBar appbar() {
    return AppBar(
      shadowColor: Colors.blue,
      backgroundColor: Colors.white,
      leading: Icon(
        Icons.arrow_back_sharp,
        color: Colors.blue,
      ),
      title: const Text(
        'Pickup Date',
        style: TextStyle(color: Colors.blue),
      ),
      centerTitle: true,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: Icon(
            Icons.menu,
            color: Colors.blue,
          ),
        )
      ],
    );
  }

  Container timeSlot({required String time, required bool isSelected}) {
    return Container(
      width: 120,
      padding: EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(color: isSelected ? Colors.blue : Colors.white, borderRadius: BorderRadius.circular(10), boxShadow: kElevationToShadow[3]),
      alignment: Alignment.center,
      child: Text(
        time,
        style: TextStyle(color: isSelected ? Colors.white : Colors.grey, fontStyle: FontStyle.italic, fontWeight: FontWeight.w500),
      ),
    );
  }
}

class DateSelectTile extends StatelessWidget {
  const DateSelectTile({
    Key? key,
    required this.bgColor,
    required this.fontColor,
    required this.day,
    required this.date,
    required this.day2,
  }) : super(key: key);

  final Color bgColor;
  final Color fontColor;
  final String day;
  final String date;
  final String day2;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 70,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: kElevationToShadow[3],
      ),
      child: Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.center,
              color: bgColor,
              width: double.infinity,
              child: Text(
                day,
                style: TextStyle(color: fontColor, fontWeight: FontWeight.w500, fontSize: 22),
              ),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                SizedBox(height: 2),
                Text(
                  date,
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 3),
                Text(
                  day2,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
