import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import 'message_view.dart';

class Package extends GetView<HomeController> {
  const Package({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(),
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView(
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          children: [
            tile(),
            tile(),
            tile(),
          ],
        ),
      ),
    );
  }

  Container tile() {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: kElevationToShadow[3],
      ),
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: Container(
              height: 120,
              clipBehavior: Clip.hardEdge,
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: kElevationToShadow[3],
              ),
              child: Container(
                height: 120,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.network(
                  'https://www.researchgate.net/profile/Elif-Bayramoglu/publication/322918596/figure/fig3/AS:669304651530259@1536586072864/Sample-example-of-xeriscape-URL-3.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Expanded(
              flex: 6,
              child: Container(
                padding: EdgeInsets.all(5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            '5 T-shirts Dry and Cleaning',
                            style: TextStyle(color: Colors.blue, fontSize: 14, fontWeight: FontWeight.w500),
                          ),
                        ),
                        Text(
                          '(\$60)',
                          style: TextStyle(color: Colors.blue, fontSize: 16, fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                    Text(
                      'You will get T-shirts Dry',
                      style: TextStyle(
                        color: Colors.blue,
                      ),
                    ),
                    SizedBox(height: 3),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Container(
                              height: 50,
                              width: 50,
                              clipBehavior: Clip.hardEdge,
                              padding: EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: kElevationToShadow[3],
                              ),
                              child: Container(
                                clipBehavior: Clip.hardEdge,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Image.network(
                                  'https://www.researchgate.net/profile/Elif-Bayramoglu/publication/322918596/figure/fig3/AS:669304651530259@1536586072864/Sample-example-of-xeriscape-URL-3.jpg',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(height: 3),
                            Text(
                              'Wash',
                              style: TextStyle(
                                fontSize: 11,
                                color: Colors.blue,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              height: 50,
                              width: 50,
                              clipBehavior: Clip.hardEdge,
                              padding: EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: kElevationToShadow[3],
                              ),
                              child: Container(
                                clipBehavior: Clip.hardEdge,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Image.network(
                                  'https://www.researchgate.net/profile/Elif-Bayramoglu/publication/322918596/figure/fig3/AS:669304651530259@1536586072864/Sample-example-of-xeriscape-URL-3.jpg',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(height: 3),
                            Text(
                              'Clean',
                              style: TextStyle(
                                fontSize: 11,
                                color: Colors.blue,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              height: 50,
                              width: 50,
                              clipBehavior: Clip.hardEdge,
                              padding: EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: kElevationToShadow[3],
                              ),
                              child: Container(
                                clipBehavior: Clip.hardEdge,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Image.network(
                                  'https://www.researchgate.net/profile/Elif-Bayramoglu/publication/322918596/figure/fig3/AS:669304651530259@1536586072864/Sample-example-of-xeriscape-URL-3.jpg',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(height: 3),
                            Text(
                              'Iron',
                              style: TextStyle(
                                fontSize: 11,
                                color: Colors.blue,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ))
        ],
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
        'Package',
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
}
