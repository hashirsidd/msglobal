import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import 'package.dart';

class MessageView extends GetView<HomeController> {
  const MessageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blue,
        leading: Icon(
          Icons.arrow_back_sharp,
          color: Colors.white,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Icon(
              Icons.menu,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: Container(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            background(),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Expanded(
                    child: ListView(
                      physics: BouncingScrollPhysics(),
                      reverse: true,
                      children: [
                        messageTile(
                          sendByMe: false,
                          message: 'We help candidates sharpen their tech skills and pursue job opportunities.',
                        ),
                        Center(
                          child: Text(
                            'July 24 23.24',
                            style: TextStyle(color: Colors.grey, fontSize: 14, fontWeight: FontWeight.w500),
                          ),
                        ),
                        messageTile(
                          sendByMe: true,
                          message: 'We help companies develop the strongest tech teams around. ',
                        ),
                        messageTile(
                          sendByMe: true,
                          message: 'We help candidates sharpen their tech skills and pursue job opportunities.',
                        ),
                        messageTile(
                          sendByMe: false,
                          message: 'We help companies develop the strongest tech teams around. ',
                        ),
                        messageTile(
                          sendByMe: true,
                          message: 'We help candidates sharpen their tech skills and pursue job opportunities.',
                        ),
                        messageTile(
                          sendByMe: false,
                          message: 'We help companies develop the strongest tech teams around. ',
                        ),
                        messageTile(
                          sendByMe: true,
                          message: 'We help candidates sharpen their tech skills and pursue job opportunities.',
                        ),
                        messageTile(
                          sendByMe: true,
                          message: 'We help companies develop the strongest tech teams around. ',
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: kElevationToShadow[3],
                          ),
                          child: TextField(
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 18,
                            ),
                            decoration: InputDecoration(
                              isDense: true,
                              border: InputBorder.none,
                              hintText: 'Write a reply...',
                              hintStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 2),
                      Icon(
                        Icons.emoji_emotions_outlined,
                        color: Colors.grey,
                      ),
                      SizedBox(width: 2),
                      Icon(
                        Icons.image_outlined,
                        color: Colors.grey,
                      ),
                      SizedBox(width: 2),
                      RotationTransition(
                        turns: new AlwaysStoppedAnimation(60 / 360),
                        child: Icon(
                          Icons.attach_file,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(width: 2),
                      InkWell(
                        onTap: () => Get.to(() => Package()),
                        child: Icon(
                          Icons.send,
                          color: Colors.blue,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Transform background() {
    return Transform.translate(
      offset: const Offset(-30, -200),
      child: RotationTransition(
        turns: new AlwaysStoppedAnimation(-30 / 360),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(20),
            boxShadow: <BoxShadow>[
              BoxShadow(offset: Offset(0.0, 0.0), blurRadius: 5.0, spreadRadius: 3.0, color: Colors.black.withOpacity(0.6)),
            ],
          ),
          height: 350,
        ),
      ),
    );
  }
}

class messageTile extends StatelessWidget {
  const messageTile({
    Key? key,
    required this.sendByMe,
    required this.message,
  }) : super(key: key);
  final bool sendByMe;
  final String message;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.only(bottom: 10),
      child: Column(
        children: [
          sendByMe
              ? SizedBox()
              : Row(
                  children: [
                    Container(
                      height: 45,
                      width: 45,
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
                      child: Image.asset(
                        'assets/images/1.jfif',
                        fit: BoxFit.cover,
                        scale: 0.8,
                      ),
                    ),
                    SizedBox(width: 5),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Ali',
                          style: TextStyle(color: Colors.grey, fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          '1m ago',
                          style: TextStyle(color: Colors.grey.withOpacity(0.7), fontSize: 11),
                        ),
                      ],
                    ),
                  ],
                ),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: !sendByMe ? MainAxisAlignment.start : MainAxisAlignment.end,
            children: [
              SizedBox(width: 20),
              Container(
                width: width * 0.5,
                decoration: BoxDecoration(
                  color: sendByMe ? Colors.blue : Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                  boxShadow: kElevationToShadow[4],
                ),
                padding: EdgeInsets.all(10),
                child: Text(
                  message,
                  style: TextStyle(color: sendByMe ? Colors.white : Colors.grey, fontSize: 14),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
