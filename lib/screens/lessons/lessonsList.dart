import 'package:alqgp/screens/lessons/lessonCard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../models/lesson_model.dart';

class Lessons extends StatefulWidget {
  const Lessons({super.key});

//prop
  static const String screenRout = 'lessonsList';

  @override
  State<Lessons> createState() => _LessonsState();
}

class _LessonsState extends State<Lessons> {
  List<Object> _lessonsList = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    getLessonsList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lessons"),
      ),
      body: SafeArea(
          child: ListView.builder(
              itemCount: _lessonsList.length,
              itemBuilder: (context, index) {
                return Lcard(_lessonsList[index] as LessonModle);
              })),
    );
  }

  Future getLessonsList() async {
    //final uid = auth(

    var data = await FirebaseFirestore.instance
        .collection('chapters')
        .doc('Chapter 4')
        .collection('Lessons')
        .orderBy('name')
        .get();

    setState(() {
      _lessonsList =
          List.from(data.docs.map((e) => LessonModle.fromSnapshot(e)));
    });
  }
}