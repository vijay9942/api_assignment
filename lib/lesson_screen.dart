import 'package:api_assignment/lesson_model.dart';
import 'package:api_assignment/lesson_service.dart';
import 'package:flutter/material.dart';

class LessonScreen extends StatefulWidget {
  const LessonScreen({Key? key}) : super(key: key);

  @override
  State<LessonScreen> createState() => _LessonScreenState();
}

class _LessonScreenState extends State<LessonScreen> {
  late List<Items> _lessons = [];

  @override
  void initState() {
    super.initState();
    _loadLessons();
  }
  Future<void> _loadLessons() async{
    try{
      LessonModel response = await LessonApiService.fetchLessons();
      setState(() {
        _lessons = response.items!;
        print('${response.requestId}');
        print('${response.anykey}');
        print('${response.count}');
      });
    }
    catch (e) {
      print('Error loading lessons: $e');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Lessons'),
        ),
        body: _lessons == null || _lessons.isEmpty
            ? const Center(
          child: CircularProgressIndicator(),
        ):ListView.builder(
            itemCount: _lessons!.length,
            itemBuilder: (context,index){
              return Card(
                child: Column(
                  children: [
                    Text('Id : ${_lessons[index].id}'),
                    Text(
                        'Name : ${_lessons[index].name}'),
                    Text(
                        'createdAt : ${_lessons[index].createdAt}'),
                    Text(
                        'Category : ${_lessons[index].category}'),
                    Text(
                        'Duration : ${_lessons[index].duration}'),
                    Text(
                        'Locked : ${_lessons[index].locked}'),

                  ],
                ),
              );
            })
    );
  }
}
