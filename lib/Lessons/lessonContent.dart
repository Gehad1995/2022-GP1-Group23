import 'package:alqgp/consts.dart';
import 'package:flutter/material.dart';
import 'package:alqgp/models/lesson_model.dart';
import 'package:easy_web_view2/easy_web_view2.dart';

class lessonCont extends StatelessWidget {
  final LessonModle lesson;
  const lessonCont(this.lesson, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Color.fromARGB(255, 243, 247, 248),
      appBar: AppBar(
        elevation: 0,
        title: Text(
          '${lesson.id?.split(",")[0]}',
          style:
              const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF8EA3E2),
      ),
      body: SingleChildScrollView(
        child: Expanded(
          child: Column(children: [
            Container(
              margin: const EdgeInsets.only(
                bottom: kPadding * 1.2,
              ),
              decoration: const BoxDecoration(
                color: Color(0xFF8EA3E2),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(29),
                  bottomRight: Radius.circular(29),
                ),
                // boxShadow: [
                //   BoxShadow(
                //     offset: const Offset(0, 10),
                //     blurRadius: 50,
                //     color: Color(0xFF8EA3E2).withOpacity(0.75),
                //   )
                // ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  margin: const EdgeInsets.only(
                    bottom: kPadding - 5,
                  ),
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.33,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  child: EasyWebView(
                    src: lesson.id!.split(",")[1],
                    onLoaded: () {}, // Try to convert to flutter widgets
                  ),
                ),
              ),
            ),
            const Divider(),
            const SizedBox(
              width: double.infinity,
              height: 30,
            ),
            // Text(
            //   lesson.id!.split(",")[0],
            //   textAlign: TextAlign.left,
            //   style: const TextStyle(
            //     fontSize: 22.0,
            //     fontWeight: FontWeight.bold,
            //     //foreground: Paint()
            //     color: kTextColor,
            //   ),
            // ),
            Container(
              height: 300,
              child:
                  PageView(scrollDirection: Axis.horizontal, children: const [
                lessonCard(
                  title: 'title1',
                  content: 'content 1 kter',
                ),
                lessonCard(
                  title: 'title2',
                  content: 'content 2 kter',
                ),
                lessonCard(
                  title: 'title3',
                  content: 'content 3 kter',
                ),
              ]),
            )
          ]),
        ),
      ),
    );
  }
}

class lessonCard extends StatelessWidget {
  final String title, content;
  const lessonCard({
    Key? key,
    required this.title,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        decoration: BoxDecoration(
          color: kLightTextColor,
          borderRadius: BorderRadius.circular(16.0),
        ),
        width: size.width * 0.85,
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Icon(Icons.bookmark),
                Icon(Icons.volume_up),
              ],
            ),
            Text(title),
            Text(content),
          ],
        ),
      ),
    );
  }
}
