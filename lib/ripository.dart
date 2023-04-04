import 'package:dio/dio.dart';
import 'package:qiita_application/model/person_model.dart';

Future<List<Person>> fetchParsonDataList() async {
  List<dynamic> responseDataList;
  final personDataList = <Person>[];

  // APIのurl
  const url = 'https://reqres.in/api/users?page=2';
  final response = await Dio().get<Map<dynamic, dynamic>>(url);

  print("response: $response");

  if (response.statusCode == 200) {
    // null Check
    if (response.data != null) {
      // responseのdataを一旦、dynamic型のListとして格納
      responseDataList = response.data!['data'] as List<dynamic>;

      for (final responseData in responseDataList) {
        // Listの要素を1つ1つPerson(自作の型)に変換し、返すListに追加していく
        personDataList
            .add(Person.fromJson(responseData as Map<String, dynamic>));
      }
    } else {
      throw Exception('Data is not exist');
    }
  } else {
    throw Exception('Failed to load sentence');
  }
  print("personDataList: $personDataList");
  return personDataList;
}
