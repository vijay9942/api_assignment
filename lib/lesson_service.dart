import 'dart:convert';
import 'package:flutter/services.dart';
import 'lesson_model.dart';
import 'package:http/http.dart'as http; //import manually when url method call

class LessonApiService {
  // static Future<LessonModel> fetchLessons() async {
  //   print('Reading from asset');
  //   final String response = await rootBundle.loadString('assets/sample_test.json');
  //
  //   if (response !=null) {
  //     Map<String,dynamic> jsonResponse = jsonDecode(response);
  //     print('${jsonResponse}');
  //
  //     return LessonModel.fromjson(jsonResponse);
  //   }
  //   else {
  //     throw Exception('Failed to load lessons');
  //   }
  // }

  static Future<LessonModel> fetchLessons ()async{
    final response = await http.get(Uri.parse('https://632017e19f82827dcf24a655.mockapi.io/api/lessons'));
    if(response.statusCode == 200){
      Map<String,dynamic>jsonResponse = jsonDecode(response.body);
      print('${response.body}');
      return LessonModel.fromjson(jsonResponse);
    }else{
      throw Exception('failed to reload');
    }
  }
}